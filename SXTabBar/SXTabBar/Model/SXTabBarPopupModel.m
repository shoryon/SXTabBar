//
//  SXTabBarPopupModel.m
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXTabBarPopupModel.h"

@implementation SXTabBarPopupModel

- (instancetype)initWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action {
    if (self = [super init]) {
        self.image = image;
        self.highlightedImage = highlightedImage;
        self.target = target;
        self.action = action;
    }
    return self;
}

+ (instancetype)initWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action {
    
    return [[self alloc] initWithImage:image highlightedImage:highlightedImage target:target action:action];
}

+ (instancetype)modelWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action {
    
    return [[self alloc] initWithImage:image highlightedImage:highlightedImage target:target action:action];
}

@end
