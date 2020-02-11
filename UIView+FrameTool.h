//
//  UIView+FrameTool.h
//  killcoldness
//
//  Created by ios group on 2020/2/5.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FrameTool)

-(CGFloat)x;
-(void)setX:(CGFloat)x;

-(CGFloat)y;
-(void)setY:(CGFloat)y;

-(CGFloat)width;
-(void)setWidth:(CGFloat)width;

-(CGFloat)height;
-(void)setHeight:(CGFloat)height;

-(CGPoint)origin;
-(void)setOrigin:(CGPoint)origin;

-(CGSize)size;
-(void)setSize:(CGSize)size;

-(CGFloat)maxX;
-(CGFloat)minX;

-(CGFloat)maxY;
-(CGFloat)minY;

@end

@interface UIView (FindFirstResponder)

-(UIView *)findFirstResponder;

@end
NS_ASSUME_NONNULL_END
