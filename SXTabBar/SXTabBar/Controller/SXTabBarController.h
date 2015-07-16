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
@property (nonatomic, strong) NSArray *items;

@end
