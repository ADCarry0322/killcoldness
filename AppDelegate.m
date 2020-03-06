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
#import "NextViewController.h"
#import "MessageModel/MessageStore.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    ViewController *vc1=[[ViewController alloc]init];
    
    
    UINavigationController *nvc1=[[UINavigationController alloc]initWithRootViewController:vc1];
      
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.rootViewController=nvc1;
    [self.window makeKeyAndVisible];
    
    return YES;
}

//




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}



//程序进入后台 保存数据
- (void)applicationDidEnterBackground:(UIApplication *)application{
    MessageStore *msgStore=[MessageStore sharedStore];
    [msgStore saveData];
}
   
  
    



- (void)applicationWillEnterForeground:(UIApplication *)application {
     
 
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
