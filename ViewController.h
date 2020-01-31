//
//  ViewController.h
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

@interface ViewController : UIViewController

@property(nonatomic,strong)UITableView *table;

@property(nonatomic,strong) NSMutableArray<MessageModel *>*arrList;

@end

