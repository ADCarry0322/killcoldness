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
#import "MessageStore.h"
#import "NextViewController.h"
#import "Keyboard/KeyboardView.h"
#import "Keyboard/MoreView.h"
#import "Keyboard/EmojiView.h"
#import "Keyboard/TextView.h"
#import "Keyboard/UIView+FrameTool.h"
@interface ViewController ()<KeyboardDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    self.arrList=[[NSMutableArray alloc]init];

    
    
    [self allocList];
    
    self.table=[[UITableView alloc] initWithFrame:CGRectMake(0, 0,AppFrameWidth, AppFrameHeight)];
    self.navigationItem.title=@"小和尚";
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    //    [vc1.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], nil]];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    
    
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    
    gradientLayer.colors=@[(__bridge id)[UIColor colorWithRed:0.67 green:0.8 blue:1 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:1 green:0.86 blue:1 alpha:1].CGColor];
    gradientLayer.locations=@[@0.2,@0.7];
    gradientLayer.startPoint=CGPointMake(0, 0);
    gradientLayer.endPoint=CGPointMake(1.0, 0);
    gradientLayer.frame=CGRectMake(0, 0, AppFrameWidth, 64);
    
    UIView *barBackgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, -20, AppFrameWidth, 64)];
    [barBackgroundView.layer addSublayer:gradientLayer];
    UIImage *image=[self convertViewToImage:barBackgroundView];
    
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    //    UIFont *textFont=[UIFont fontWithName:@"PingFangSC-Regular" size:25];
    //    NSDictionary *attributes=@{NSFontAttributeName:textFont};
    //    [vc1.navigationController.navigationBar setTitleTextAttributes:attributes];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]init];
    tapGesture.delegate=self;
    [self.table addGestureRecognizer:tapGesture];
    
    UIBarButtonItem *moreBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"5"] style:UIBarButtonItemStyleDone target:self action:@selector(clickToSettingPage)];
    self.navigationItem.rightBarButtonItem=moreBarButtonItem;
    
    self.view.backgroundColor=[UIColor colorWithRed:0.92 green:0.92 blue:0.92 alpha:1];
    
    self.table.separatorColor=[UIColor clearColor];
    self.table.delegate=self;
    self.table.dataSource=self;
    self.keyView=[[KeyboardView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-52-StatusNav_Height, AppFrameWidth, 52)];
    self.keyView.delegate=self;
    [self.view addSubview:self.table];
    [self.view addSubview:_keyView];
    
    
}

-(UIImage *)convertViewToImage:(UIView *)v{
    CGSize size=v.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //参数1:区域大小 参数2:是否透明 半透明：NO 参数3:屏幕密度
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)allocList{
    MessageModel *model=[[MessageModel alloc] init];
    model.showMessageTime=YES;
    NSCalendar *calendar=[NSCalendar currentCalendar];
    NSInteger hour=[calendar component:NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger minute=[calendar component:NSCalendarUnitMinute fromDate:[NSDate date]];
    
    NSString *time=[[NSString alloc] initWithFormat:@"%2ld:%2ld",(long)hour,(long)minute];
    model.messageTime=time;
    model.messageText=@"快哄我！";
    model.messageSenderType=MessageSenderTypeUser;
    model.messageType=MessageTypeText;
    [self.arrList addObject:model];
    
    
    model=[[MessageModel alloc] init];
    model.showMessageTime=NO;
    model.messageSenderType=MessageSenderTypeZN;
    model.messageType=MessageTypeText;
    model.messageText=@"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈？！";
    [self.arrList addObject:model];
    

    
}

//发送的文本
-(void)textViewContentText:(NSString *)textStr{
    MessageModel *userCell=[[MessageModel alloc]init];
    userCell.messageText=textStr;
    userCell.messageSenderType=MessageSenderTypeUser;
    userCell.showMessageTime=NO;
    userCell.messageType=MessageTypeText;
    [self.arrList addObject:userCell];
    [self.table reloadData];
    [self scrollToBottom];
    
}
//keyboard的frame改变
-(void)keyboardChangeFrameWithMinY:(CGFloat)minY{
    [self scrollToBottom];
    //获取对应cell的rect值
    NSIndexPath *lastIndex=[NSIndexPath indexPathForRow:self.arrList.count-1 inSection:0];
    CGRect rect=[self.table rectForRowAtIndexPath:lastIndex];
    CGFloat lastMaxY=rect.origin.y+rect.size.height;
    //如果最后一个cell的最大Y值大于tableview的高度
    if (lastMaxY <= self.table.height) {
        if (lastMaxY >= minY) {
            self.table.y=minY-lastMaxY;
        }
        else
        {
            self.table.y=0;
        }
        
    }
    else{
        self.table.y+=minY-self.table.maxY;
    }
    
}
//tableView滚动到底部
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self scrollToBottom];
}

-(void)scrollToBottom{
    if (self.arrList.count>=1) {
        [self.table scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:MAX(0, self.arrList.count-1) inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

//点击UITableView
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(nonnull UITouch *)touch{
    //收回键盘
    [[NSNotificationCenter defaultCenter]postNotificationName:@"keyboardHide" object:nil];
    //若为UITableViewCellContentView（即点击了tavleViewCell） 则不截获touch事件
    if ([NSStringFromClass([touch.view class])isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [[UIMenuController sharedMenuController] setMenuVisible:NO animated:YES];
}

//section中的行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrList count];
}

//section个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//获取cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [WeChatCell tableHeightWithModel:self.arrList[indexPath.row]];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeChatCell *cell=[WeChatCell cellWithTableView:self.table messageModel:self.arrList[indexPath.row]];

    return cell;
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(void)clickToSettingPage{
    NextViewController *nextVc=[[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVc animated:YES];
}


-(void)addNew{

}
@end
