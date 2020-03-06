//
//  ViewController.h
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"
#import "Keyboard/KeyboardView.h"
#import "Keyboard/MoreView.h"
#import "Keyboard/EmojiView.h"
#import "Keyboard/TextView.h"
#import "Keyboard/UIView+FrameTool.h"

@interface ViewController : UIViewController



@property(nonatomic,retain)UITableView *table;

@property(nonatomic,strong) NSMutableArray<MessageModel *>*arrList;

@property (nonatomic,strong)KeyboardView *keyView;
@end

