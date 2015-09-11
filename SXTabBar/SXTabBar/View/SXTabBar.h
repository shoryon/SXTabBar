//
//  SXTabBar.h
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SXTabBarItem.h"
#import "SXTabBarPopupItem.h"

@protocol SXTabBarDelegate <NSObject>

@optional
/**
 *  @param from 从哪个视图(视图索引)
 *  @param to   到哪个视图(视图索引)
 */
- (void)tabBarDidSelectedItemFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface SXTabBar : UIView

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, weak) id<SXTabBarDelegate> delegate;

/**
 *  设置TabBar中的item项
 *
 *  @param image            普通图片
 *  @param highlightedImage 高亮图片
 */
- (void)addItemWithImage:(NSString *)image
        highlightedImage:(NSString *)highlightedImage;
/**
 *  设置TabBar中的item项(弹出)
 *
 *  @param image            普通图片
 *  @param highlightedImage 高亮图片
 */
- (void)addPopupItemWithImage:(NSString *)image
             highlightedImage:(NSString *)highlightedImage
                       target:(id)target
                       action:(SEL)action ;

@end
