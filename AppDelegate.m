//
//  AppDelegate.m
//  killcoldness
//
//  Created by ios group on 2020/1/20.
//  Copyright © 2020年 s. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WeChatCell.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc1=[[ViewController alloc]init];
    
    
    UINavigationController *nvc1=[[UINavigationController alloc]initWithRootViewController:vc1];
    vc1.navigationItem.title=@"小和尚";
    [vc1.navigationController.navigationBar setTranslucent:NO];
    [vc1.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
//    [vc1.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], nil]];
    [vc1.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [vc1.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    
    
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    
    gradientLayer.colors=@[(__bridge id)[UIColor colorWithRed:0.67 green:0.8 blue:1 alpha:1].CGColor,(__bridge id)[UIColor colorWithRed:1 green:0.86 blue:1 alpha:1].CGColor];
    gradientLayer.locations=@[@0.3,@0.6];
    gradientLayer.startPoint=CGPointMake(0, 0);
    gradientLayer.endPoint=CGPointMake(1.0, 0);
    gradientLayer.frame=CGRectMake(0, 0, AppFrameWidth, 64);
    
    UIView *barBackgroundView=[[UIView alloc] initWithFrame:CGRectMake(0, -20, AppFrameWidth, 64)];
    [barBackgroundView.layer addSublayer:gradientLayer];
    UIImage *image=[self convertViewToImage:barBackgroundView];
    //image=[UIImage alloc]convertViewToImage:barBackgroundView];
  
    [vc1.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];

//    UIFont *textFont=[UIFont fontWithName:@"PingFangSC-Regular" size:25];
//    NSDictionary *attributes=@{NSFontAttributeName:textFont};
//    [vc1.navigationController.navigationBar setTitleTextAttributes:attributes];
    [vc1.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25],NSForegroundColorAttributeName:[UIColor whiteColor]}];

  
    UIBarButtonItem *moreBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"5"] style:UIBarButtonItemStyleDone target:self action:@selector(nilSymbol)];
    vc1.navigationItem.rightBarButtonItem=moreBarButtonItem;
    
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=nvc1;
    [self.window makeKeyAndVisible];
    
    return YES;
}
//


-(UIImage *)convertViewToImage:(UIView *)v{
    CGSize size=v.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //参数1:区域大小 参数2:是否透明 半透明：NO 参数3:屏幕密度
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
