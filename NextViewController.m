//
//  NextViewController.m
//  killcoldness
//
//  Created by ios group on 2020/2/3.
//  Copyright © 2020年 s. All rights reserved.
//

#import "NextViewController.h"
#import "WeChatCell.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"聊天详情";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    gradientLayer.colors=@[(__bridge id)[UIColor colorWithRed:0.67 green:0.8 blue:1 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:1 green:0.86 blue:1 alpha:1].CGColor];
    gradientLayer.locations=@[@0.2,@0.7];
    gradientLayer.startPoint=CGPointMake(0, 0);
    gradientLayer.endPoint=CGPointMake(1.0, 0);
    gradientLayer.frame=CGRectMake(0, 0, AppFrameWidth,AppFrameHeight);
    [self.view.layer addSublayer:gradientLayer];
    
    [self creatView];
}

-(void)creatView{
    [self Labels];
    [self nameField];

}

-(void)Labels{
    UILabel *nameLabel=[[UILabel alloc] init];
    UILabel *logoLabel=[[UILabel alloc]init];

    nameLabel.text=@"备注";
    logoLabel.text=@"头像";
    
    nameLabel.font=[UIFont fontWithName:@"PingFang-SCregular" size:20];
    logoLabel.font=[UIFont fontWithName:@"PingFang-SCregular" size:20];
    
    nameLabel.textColor=[UIColor whiteColor];
    logoLabel.textColor=[UIColor whiteColor];
    
    nameLabel.frame=CGRectMake(AppFrameWidth/4-30, AppFrameHeight/4-200, 100, 60);
    logoLabel.frame=CGRectMake(AppFrameWidth/4-30, AppFrameHeight/4-150, 100, 60);
    
    [self.view addSubview:nameLabel];
    [self.view addSubview:logoLabel];
}

-(void)nameField{
    UITextField *nameField=[[UITextField alloc] initWithFrame:CGRectMake(AppFrameWidth/4-30+50, AppFrameHeight/4-185, 200, 30)];
    nameField.backgroundColor=[UIColor clearColor];
    nameField.font=[UIFont fontWithName:@"PingFang-SCRegular" size:20];
    nameField.textColor=[UIColor whiteColor];
    nameField.layer.borderColor=[UIColor whiteColor].CGColor;
    nameField.layer.borderWidth=1;
    nameField.clearButtonMode=UITextFieldViewModeWhileEditing;//一键清除
    nameField.keyboardType=UIKeyboardTypeDefault;
    nameField.delegate=self;
    [self.view addSubview:nameField];

}

-(void)logoImage{
    UIImageView *logoImage=[[UIImageView alloc] initWithFrame:CGRectMake(AppFrameWidth/4-30+50, AppFrameHeight/4-185, 200, 30)];
    logoImage.image=[UIImage imageNamed:@"1"];
    [self.view addSubview:logoImage];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
