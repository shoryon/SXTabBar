//
//  SXTabBarPopupModel.h
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXTabBarPopupModel : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *highlightedImage;
@property (nonatomic, strong) id target;
@property (nonatomic, assign) SEL action;

- (instancetype)initWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;
+ (instancetype)initWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;
+ (instancetype)modelWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action;

@end
