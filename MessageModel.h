//
//  MessageModel.h
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//消息类型
typedef NS_ENUM (NSInteger,MessageType)
{
    MessageTypeText=1,
    MessageTypeVoice,
    MessageTypeImage
};

//消息发送方
typedef NS_ENUM (NSInteger,MessageSenderType)
{
    MessageSenderTypeZN=1,
    MessageSenderTypeUser
};


@interface MessageModel : NSObject <NSSecureCoding>


@property (nonatomic,assign)MessageType   messageType;

@property (nonatomic,assign)MessageSenderType  messageSenderType;

@property (nonatomic,assign)BOOL showMessageTime;

@property (nonatomic,retain)NSString *messageTime;

@property (nonatomic,retain)NSString *messageText;

@property (nonatomic,retain)UIImage *imageSmall;


@end

NS_ASSUME_NONNULL_END
