//
//  SXTabBarController.m
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXTabBarController.h"

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
    
    CGRect baseFrame = self.tabBar.frame;
    
    //移除系统自带的tabbar
    [self.tabBar removeFromSuperview];
    
    SXTabBar *customTabBar = [[SXTabBar alloc] initWithFrame:baseFrame];
    
    customTabBar.delegate = self;
    
    [self.view addSubview:customTabBar];
    
    self.customTabBar = customTabBar;
}

/**
 *  自定义高度
 */
- (void)setCustomHeight:(CGFloat)customHeight {
    
    _customHeight = customHeight;
    
    CGFloat customTabBarH = self.customHeight;
    CGFloat customTabBarX = self.customTabBar.frame.origin.x;
    CGFloat customTabBarY = self.customTabBar.frame.origin.y - (customTabBarH - self.customTabBar.frame.size.height);
    CGFloat customTabBarW = self.customTabBar.frame.size.width;
    
    self.customTabBar.frame = CGRectMake(customTabBarX, customTabBarY, customTabBarW, customTabBarH);
}

#pragma mark - tabBar delegate

- (void)tabBarDidSelectedItemFrom:(NSInteger)from to:(NSInteger)to {
    
    self.selectedIndex = to;
}

@end
