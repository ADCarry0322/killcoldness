//
//  ViewController.m
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import "ViewController.h"
#import "WeChatCell.h"
#import "MessageModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.arrList=[[NSMutableArray alloc]init];

    
    
    [self allocList];
    
     CGFloat AppFrameWidth=[UIScreen mainScreen].bounds.size.width;
     CGFloat AppFrameHeight=[UIScreen mainScreen].bounds.size.height;
    self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,AppFrameWidth, AppFrameHeight)];
    self.table.separatorColor=[UIColor clearColor];
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.view addSubview:self.table];
    
}

-(void)allocList{
    MessageModel *model=[[MessageModel alloc] init];
    model.showMessageTime=YES;
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSInteger hour=[calendar component:NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger minute=[calendar component:NSCalendarUnitMinute fromDate:[NSDate date]];
    
    NSString *time=[[NSString alloc] initWithFormat:@"%2ld:%2ld",(long)hour,(long)minute];
    model.messageTime=time;
    model.messageText=@"hahahaha";
    model.messageSenderType=MessageSenderTypeUser;
    model.messageType=MessageTypeText;
    [self.arrList addObject:model];
    
    
    model=[[MessageModel alloc] init];
    model.showMessageTime=NO;
    model.messageSenderType=MessageSenderTypeZN;
    model.messageType=MessageTypeText;
    model.messageText=@"xixixixixxiixxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxixixixixiixixixixixiixixiixixixixixiixixiixixixixixiiixixixixixixixixixixixixixixix";
    [self.arrList addObject:model];
    

    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrList count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [WeChatCell tableHeightWithModel:self.arrList[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeChatCell *cell=[WeChatCell cellWithTableView:self.table messageModel:self.arrList[indexPath.row]];
    [cell setDoubleblock:^(MessageModel *model)
     {
         NSLog(@"%@-------",model.messageText);
     }];
    
    [cell setSingleblock:^(MessageModel *model)
     {
         
     }];
    return cell;
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     WeChatCell *cell=[WeChatCell cellWithTableView:self.table messageModel:self.arrList[indexPath.row]];
    
    
    
    
    
}

@end
