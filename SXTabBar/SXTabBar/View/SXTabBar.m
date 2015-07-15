//
//  SXTabBar.m
//  SXTabBar
//
//  Created by 沧海小鱼 on 15/7/15.
//  Copyright (c) 2015年 Coder Shoryon. All rights reserved.
//

#import "SXTabBar.h"

@interface SXTabBar ()

/**
 *  定义变量记录当前选中项
 */
@property (nonatomic, weak) SXTabBarItem *selectedItem;

@end

@implementation SXTabBar

- (instancetype)init {
    if (self = [super init]) {
        [self initTabBar];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initTabBar];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self initTabBar];
    }
    return self;
}

- (void)initTabBar {
    [self setUserInteractionEnabled:YES];
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)addItemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage {
    
    // 3.1创建按钮
    SXTabBarItem *item = [[SXTabBarItem alloc] init];
    
    // 3.2设置按钮上显示的图片
    // 3.2.1设置默认状态图片
    [item setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    // 3.2.2设置不可用状态图片
    [item setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateDisabled];
    
    // 3.4监听按钮点击事件
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    // 3.5添加按钮到自定义TabBar
    [self addSubview:item];
    
    // 3.6设置默认选中按钮
    if (self.subviews.count == 1) {
        [self itemClick:item];
    }
    
    // 3.7设置按钮高亮状态不调整图片
    [item setAdjustsImageWhenHighlighted:NO];
}

- (void)addPopupItemWithImage:(NSString *)image highlightedImage:(NSString *)highlightedImage target:(id)target action:(SEL)action {
    
    // 3.1创建按钮
    SXTabBarPopupItem *item = [[SXTabBarPopupItem alloc] init];
    
    // 3.2设置按钮上显示的图片
    // 3.2.1设置默认状态图片
    [item setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    
    // 3.2.2设置不可用状态图片
    [item setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateDisabled];
    
    // 3.4监听按钮点击事件
    [item addTarget:target action:action forControlEvents:UIControlEventTouchDown];
    
    // 3.5添加按钮到自定义TabBar
    [self addSubview:item];
    
    // 3.6设置按钮高亮状态不调整图片
    [item setAdjustsImageWhenHighlighted:NO];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat gridW = self.frame.size.width / self.subviews.count;
    CGFloat gridH = self.frame.size.height;
    
    for (int i = 0; i < self.subviews.count ; i++) {
        
        id item = self.subviews[i];
        
        // 设置item的frame
        CGFloat itemW = gridW;
        CGFloat itemH = self.frame.size.height;
        CGFloat itemY = (gridH - itemH) * 0.5;
        CGFloat itemX = i * gridW + (gridW - itemW) * 0.5;
        [item setFrame:CGRectMake(itemX, itemY, itemW, itemH)];
        
        // 设置按钮的Tag作为将来切换子控制器的索引
        [item setTag:i];
    }
}

- (void)itemClick:(id)item {
    
    // 1.切换子控制器,通知TabBarController切换控制器
    if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedItemFrom:to:)]) {
        [self.delegate tabBarDidSelectedItemFrom:self.selectedItem.tag to:[item tag]];
    }
    
    // 2.取消上一次选中的按钮
    self.selectedItem.enabled = YES;
    
    // 3.设置当前被点击按钮为选中状态
    [item setEnabled:NO];
    
    // 4.记录当前选中的按钮
    self.selectedItem = item;
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    
    _selectedIndex = selectedIndex;
    
    SXTabBarItem *item = self.subviews[_selectedIndex];
    
    [self itemClick:item];
}

@end
