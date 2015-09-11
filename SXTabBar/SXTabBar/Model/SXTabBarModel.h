//
//  SXTabBarModel.h
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SXTabBarModel : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *highlightedImage;
@property (nonatomic, strong) UIViewController *childVc;

- (instancetype)initWithImage:(NSString *)image
             highlightedImage:(NSString *)highlightedImage
                      childVc:(UIViewController *)childVc;
+ (instancetype)modelWithImage:(NSString *)image
              highlightedImage:(NSString *)highlightedImage
                       childVc:(UIViewController *)childVc;

@end
