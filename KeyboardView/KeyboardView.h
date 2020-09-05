//
//  KeyboardView.h
//  killcoldness
//
//  Created by ios group on 2020/2/5.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

#define StatusNav_Height 88
#define AppFrameWidth [UIScreen mainScreen].bounds.size.width
#define AppFrameHeight [UIScreen mainScreen].bounds.size.height

@protocol KeyboardDelegate <NSObject>
//类遵守协议
@optional

//点击发送时输入框内的文案
-(void)textViewContentText:(NSString *)textStr;

//键盘的frame改变
-(void)keyboardChangeFrameWithMinY:(CGFloat)minY;

@end
NS_ASSUME_NONNULL_BEGIN

@interface KeyboardView : UIView <UITextViewDelegate>


@property(nonatomic,weak) id <KeyboardDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
