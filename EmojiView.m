//
//  EmojiView.m
//  killcoldness
//
//  Created by ios group on 2020/2/5.
//  Copyright © 2020年 s. All rights reserved.
//

#import "EmojiView.h"
#import "UIView+FrameTool.h"
@implementation EmojiView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UILabel *label=[UILabel new];
        label.text=@"😊";
        label.frame=CGRectMake(30, 20, 30, 30);
        label.textAlignment=NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
