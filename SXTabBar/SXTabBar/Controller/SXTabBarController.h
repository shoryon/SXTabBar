//
//  SXTabBarController.h
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXTabBar.h"
#import "SXTabBarModel.h"
#import "SXTabBarPopupModel.h"

@interface SXTabBarController : UITabBarController
/**
 *  自定义标签条
 */
@property (nonatomic, weak) SXTabBar *customTabBar;
/**
 *  自定义tabbar子菜单项
 */
@property (nonatomic, strong) NSArray *items;
/**
 *  自定义tabbar高度
 */
@property (nonatomic, assign) CGFloat customHeight;

@end
