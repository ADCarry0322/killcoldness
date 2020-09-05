//
//  MoreView.m
//  killcoldness
//
//  Created by ios group on 2020/2/5.
//  Copyright © 2020年 s. All rights reserved.
//

#import "MoreView.h"
#import "UIView+FrameTool.h"
@implementation MoreView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        UIImageView *imageView=[[UIImageView alloc] init];
        imageView.frame=CGRectMake(30, 20, 60, 60);
        imageView.image=[UIImage imageNamed:@"2"];
        [self addSubview:imageView];
        
        UILabel *label=[UILabel new];
        label.text=@"照片";
        label.frame=CGRectMake(30, imageView.maxY+5, 60, 30);
        label.textAlignment=NSTextAlignmentCenter;
        [self addSubview:label];
    }
    return self;
}

@end
