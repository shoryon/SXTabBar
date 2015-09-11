//
//  SXTabBarModel.m
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXTabBarModel.h"

@implementation SXTabBarModel

- (instancetype)initWithImage:(NSString *)image
             highlightedImage:(NSString *)highlightedImage
                      childVc:(UIViewController *)childVc {
    if (self = [super init]) {
        self.image = image;
        self.highlightedImage = highlightedImage;
        self.childVc = childVc;
    }
    return self;
}

+ (instancetype)modelWithImage:(NSString *)image
              highlightedImage:(NSString *)highlightedImage
                       childVc:(UIViewController *)childVc {
    return [[self alloc] initWithImage:image
                      highlightedImage:highlightedImage
                               childVc:childVc];
}

@end
