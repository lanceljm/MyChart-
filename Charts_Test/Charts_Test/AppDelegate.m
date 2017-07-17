//
//  AppDelegate.m
//  Charts_Test
//
//  Created by ljm on 2017/7/14.
//  Copyright © 2017年 ljm. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen] .bounds];
    
    /** 第一界面 **/
    ViewController *vc          =   [[ViewController alloc] init];
    vc.title                    =   @"折线图";
    vc.tabBarItem.image         =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nvc =   [[UINavigationController alloc] initWithRootViewController:vc];
    
    
    /** 第二界面 **/
    SecondViewController *svc    =   [[SecondViewController alloc] init];
    svc.title                    =   @"柱状图";
    svc.tabBarItem.image         =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    svc.tabBarItem.selectedImage =  [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nsvc =  [[UINavigationController alloc] initWithRootViewController:svc];
    
    
    /** 第三界面 **/
    ThirdViewController *tvc     =  [[ThirdViewController alloc] init];
    tvc.title                    =  @"扇形图";
    tvc.tabBarItem.image         =  [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tvc.tabBarItem.selectedImage =  [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *ntvc =  [[UINavigationController alloc] initWithRootViewController:tvc];
    
    
    /** 第四界面 **/
    FourthViewController *fovc    =   [[FourthViewController alloc] init];
    fovc.title                    =   @"点状图";
    fovc.tabBarItem.image         =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fovc.tabBarItem.selectedImage =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nfovc =   [[UINavigationController alloc] initWithRootViewController:fovc];
    
    
    /** 第五界面 **/
    FivethViewController *fivc      =   [[FivethViewController alloc] init];
    fivc.title                      =   @"雷达图";
    fivc.tabBarItem.image           =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    fivc.tabBarItem.selectedImage   =   [[UIImage imageNamed:@""] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *nfivc   =   [[UINavigationController alloc] initWithRootViewController:fivc];
    
    UITabBarController *tab     =   [[UITabBarController alloc] init];
    
    [tab addChildViewController :   nvc];
    [tab addChildViewController :   nsvc];
    [tab addChildViewController :   ntvc];
    [tab addChildViewController :   nfovc];
    [tab addChildViewController :   nfivc];
    
    /** 默认选中的界面 **/
    tab.selectedIndex = 0;
    
    self.window.rootViewController = tab;
    [self.window makeKeyAndVisible];
    
    return YES;
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
