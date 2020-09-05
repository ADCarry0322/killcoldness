//
//  TextView.m
//  killcoldness
//
//  Created by ios group on 2020/2/5.
//  Copyright © 2020年 s. All rights reserved.
//

#import "TextView.h"
#import "UIView+FrameTool.h"

static float textFont=25;
@implementation TextView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
    {
        if (!self.textFont) {
            self.textFont=[UIFont systemFontOfSize:textFont];
        }
        [self setUp];
    }
    return self;
}

-(void)setUp{
    self.scrollEnabled=NO;
    self.scrollsToTop=NO;
    self.showsHorizontalScrollIndicator=NO;//是否显示水平滚动条
    self.enablesReturnKeyAutomatically=YES;//为YES时键盘return键不可用
    //监听textView值的改变
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChange) name:UITextViewTextDidChangeNotification object:nil];
}


-(void)textDidChange{
    //计算高度
    CGFloat height=ceilf([self sizeThatFits:CGSizeMake(self.frame. size.width,MAXFLOAT)].height);//去掉小数进一
    if (height >_maxTextH) {
        height =_maxTextH;
        self.scrollEnabled=YES;//textView大于最大高度时可以滚动
    }
    else{
        self.scrollEnabled=NO;
        if (_textChangedBlock && self.scrollEnabled==NO) {
            _textChangedBlock(height);
        }
    }
    [self layoutIfNeeded];
}

-(void)setMaxNumberOfLines:(NSUInteger)maxNumberOfLines{
    _maxNumberOfLines=maxNumberOfLines;
    //最大高度=每行高度*总行数+文字上下间隙
    _maxTextH=ceil(self.font.lineHeight *maxNumberOfLines +self.textContainerInset.top+self.textContainerInset.bottom);
}

-(void)textValueDidChanged:(TextHeightChangedBlock)block{
    _textChangedBlock=block;
}

//移除监听
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end

