//
//  TextView.h
//  killcoldness
//
//  Created by ios group on 2020/2/5.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TextHeightChangedBlock)(CGFloat textHeight);

@interface TextView : UITextView

//textView最大行数
@property (nonatomic,assign)NSUInteger maxNumberOfLines;

//文字大小
@property (nonatomic,strong) UIFont *textFont;

//文字最大高度
@property (nonatomic,assign) CGFloat maxTextH;

//文字高度改变block ->文字高度改变会自动调用
//block参数(text) ->文字高度
//block参数(textHeight) ->文字高度
@property (nonatomic,strong) TextHeightChangedBlock textChangedBlock;

-(void)textValueDidChanged:(TextHeightChangedBlock)block;
@end

NS_ASSUME_NONNULL_END
