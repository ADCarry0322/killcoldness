//
//  WeChatCell.h
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MessageModel;

typedef void (^DoubleClickBlock)(MessageModel *model);


NS_ASSUME_NONNULL_BEGIN

@interface WeChatCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView messageModel:(MessageModel *)model;

//获取高度
+(CGFloat)tableHeightWithModel:(MessageModel *)model;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier messageModel:model;

@property (nonatomic,strong) UIImageView *coversImageView;//长按后图片的阴影

@property (nonatomic,strong) MessageModel *messageModel;

@property (nonatomic,copy)DoubleClickBlock doubleblock;

@property (nonatomic,copy)DoubleClickBlock singleblock;

@property (nonatomic,copy)DoubleClickBlock resendblock;

-(void)setDoubleblock:(DoubleClickBlock _Nonnull)doubleblock;

-(void)setSingleblock:(DoubleClickBlock _Nonnull)singleblock;

-(void)setResendblock:(DoubleClickBlock _Nonnull)resendblock;


@end

NS_ASSUME_NONNULL_END
