//
//  MessageStore.m
//  killcoldness
//
//  Created by ios group on 2020/2/1.
//  Copyright © 2020年 s. All rights reserved.
//

#import "MessageStore.h"

@implementation MessageStore


//-(WeChatCell *)sendMessage
//{
//    
//}
+(instancetype)sharedStore
{
    static MessageStore *sharedStore=nil;
    if (!sharedStore){
        sharedStore=[[self alloc]initPrivate];
        
    }
    return sharedStore;
}

-(instancetype)initPrivate{
    self=[super init];
    if (self) {
        if(!_privateMessages){
            _privateMessages=[[NSMutableArray alloc] init];
        }
    }
    return self;
}

@end
