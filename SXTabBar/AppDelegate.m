//
//  AppDelegate.m
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "AppDelegate.h"
#import "SXTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "MiddleViewController.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width

@interface AppDelegate ()

@property (nonatomic, strong) SXTabBarController *tabBarController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    SXTabBarController *tabBarController = [[SXTabBarController alloc] init];
    
    //第一个视图控制器
    FirstViewController *homeViewController = [[FirstViewController alloc] init];
    UINavigationController *navigationHomeViewController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    //第二个视图控制器
    SecondViewController *colorStationViewController = [[SecondViewController alloc] init];
    UINavigationController *navigationColorStationViewController = [[UINavigationController alloc] initWithRootViewController:colorStationViewController];
    
    //第三个视图控制器
    ThirdViewController *informationViewController = [[ThirdViewController alloc] init];
    UINavigationController *navigationInformationViewController = [[UINavigationController alloc] initWithRootViewController:informationViewController];
    
    //第四个视图控制器
    FourthViewController *memberViewController = [[FourthViewController alloc] init];
    UINavigationController *navigationMemberViewController = [[UINavigationController alloc] initWithRootViewController:memberViewController];
    
    //设置子控制器
    tabBarController.items = @[[SXTabBarModel modelWithImage:@"tabbar_item_home"
                                            highlightedImage:@"tabbar_item_home_selected"
                                                     childVc:navigationHomeViewController],
                               [SXTabBarModel modelWithImage:@"tabbar_item_betting"
                                            highlightedImage:@"tabbar_item_betting_selected"
                                                     childVc:navigationColorStationViewController],
                               [SXTabBarPopupModel modelWithImage:@"tabbar_item_interaction"
                                                 highlightedImage:@"tabbar_item_interaction_selected"
                                                           target:self
                                                           action:@selector(popupToVc)],
                               [SXTabBarModel modelWithImage:@"tabbar_item_information"
                                            highlightedImage:@"tabbar_item_information_selected"
                                                     childVc:navigationInformationViewController],
                               [SXTabBarModel modelWithImage:@"tabbar_item_mine"
                                            highlightedImage:@"tabbar_item_mine_selected"
                                                     childVc:navigationMemberViewController]];
    // 自定义tabbar高度
    tabBarController.customHeight = (kScreenWidth > 320 ? 69.0f : 59.0f);
    
    self.tabBarController = tabBarController;
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)popupToVc {
    //选项卡中间视图控制器
    MiddleViewController *middleViewController = [[MiddleViewController alloc] init];
    UINavigationController *navigationMiddleViewController = [[UINavigationController alloc] initWithRootViewController:middleViewController];
    [self.tabBarController presentViewController:navigationMiddleViewController animated:YES completion:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
