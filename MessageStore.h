//
//  MessageStore.h
//  killcoldness
//
//  Created by ios group on 2020/2/1.
//  Copyright © 2020年 s. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeChatCell.h"
#import "MessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageStore : NSObject

@property(nonatomic,readonly)NSMutableArray *privateMessages;

//-(WeChatCell *)sendMessage;

+(instancetype)sharedStore;
@end

NS_ASSUME_NONNULL_END
