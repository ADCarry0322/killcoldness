//
//  MessageStore.m
//  killcoldness
//
//  Created by ios group on 2020/2/1.
//  Copyright © 2020年 s. All rights reserved.
//

#import "MessageStore.h"
#import "AppDelegate.h"
#import "ViewController.h"
@implementation MessageStore



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
            NSArray *array=[self readData];
            if (array!=nil) {
                for (int i=0; i<array.count; i++) {
                    [_privateMessages addObject:[array objectAtIndex:i]];
                }
            }
            
        }
    }
    return self;
}

-(void)saveData{
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"userArr.plist"];
    NSArray *array=[NSArray arrayWithArray:_privateMessages];
    NSData *data=[NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
        [data writeToFile:filePath atomically:YES];
    
}

-(NSArray *)readData{
    NSString *filePath=[NSHomeDirectory() stringByAppendingPathComponent:@"userArr.plist"];
    NSData *oldData=[NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSArray <MessageModel *>*array = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[MessageModel class], nil] fromData:oldData error:&error];
    return array;
}


@end
