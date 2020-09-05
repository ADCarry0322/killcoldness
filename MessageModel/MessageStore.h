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

@property(nonatomic,readwrite)NSMutableArray<MessageModel *>*privateMessages;

+(instancetype)sharedStore;

-(void)saveData;

-(NSArray *)readData;

@end

NS_ASSUME_NONNULL_END
