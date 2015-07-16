//
//  SXTabBarController.m
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "MiddleViewController.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
/**
 *  中间图片凸起来的高度
 */
#define kTabBarTransparentOverH (kScreenWidth > 320 ? 20.0f : 10.0f)

@interface SXTabBarController () <SXTabBarDelegate>

@end

@implementation SXTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    // 初始化tabbar
    [self setupTabbar];
}

- (void)setItems:(NSArray *)items {
    
    _items = items;
    
    // 初始化所有的子控制器
    for (id item in self.items) {
        
        if ([item isKindOfClass:[SXTabBarModel class]]) {
            
            SXTabBarModel *tabBarModel = item;
            
            [self.customTabBar addItemWithImage:tabBarModel.image highlightedImage:tabBarModel.highlightedImage];
            
            [self addChildViewController:tabBarModel.childVc];
            
        } else if ([item isKindOfClass:[SXTabBarPopupModel class]]) {
            
            SXTabBarPopupModel *tabBarPopupModel = item;
            
            [self.customTabBar addPopupItemWithImage:tabBarPopupModel.image highlightedImage:tabBarPopupModel.highlightedImage target:tabBarPopupModel.target action:tabBarPopupModel.action];
            
            [self addChildViewController:[[UIViewController alloc] init]];
        }
    }
}

/**
 *  初始化自定义TabBar
 */
- (void)setupTabbar {
    
    CGRect tabBarFrame = self.tabBar.frame;
    
    //移除系统自带的tabbar
    [self.tabBar removeFromSuperview];
    
    CGFloat tabBarX = tabBarFrame.origin.x;
    CGFloat tabBarY = tabBarFrame.origin.y - kTabBarTransparentOverH;
    CGFloat tabBarW = tabBarFrame.size.width;
    CGFloat tabBarH = tabBarFrame.size.height + kTabBarTransparentOverH;
    
    SXTabBar *customTabBar = [[SXTabBar alloc] initWithFrame:CGRectMake(tabBarX, tabBarY, tabBarW, tabBarH)];
    
    customTabBar.delegate = self;
    
    [self.view addSubview:customTabBar];
    
    self.customTabBar = customTabBar;
}

#pragma mark - tabBar delegate

- (void)tabBarDidSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    
    self.selectedIndex = to;
}

@end
