//
//  MessageModel.m
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import "MessageModel.h"
#import "ViewController.h"
@implementation MessageModel

- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    [aCoder encodeBool:_showMessageTime forKey:@"showTime"];
    [aCoder encodeInteger:(NSInteger)_messageSenderType forKey:@"messageSender"];
    [aCoder encodeInteger:(NSInteger)_messageType forKey:@"messageType"];
    [aCoder encodeObject:_messageTime forKey:@"time"];
    [aCoder encodeObject:_messageText forKey:@"text"];
    [aCoder encodeObject:_imageSmall forKey:@"image"];

}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    self=[super init];
    if (self) {
        _showMessageTime=[aDecoder decodeBoolForKey:@"showTime"];
        _messageSenderType=[aDecoder decodeIntegerForKey:@"messageSender"];
        _messageType=[aDecoder decodeIntegerForKey:@"messageType"];
        _messageTime=[aDecoder decodeObjectForKey:@"time"];
        _messageText=[aDecoder decodeObjectForKey:@"text"];
        _imageSmall=[aDecoder decodeObjectForKey:@"image"];
    }
    return self;
}

+(BOOL)supportsSecureCoding{
    return YES;
}


@end
