# SXTabBar
自定义标签控制器

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
- 
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    SXTabBarController *tabBarController = [[SXTabBarController alloc] init];
    
    //首页
    
    FirstViewController *homeViewController = [[FirstViewController alloc] init];
    
    UINavigationController *navigationHomeViewController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    
    //彩种
    
    SecondViewController *colorStationViewController = [[SecondViewController alloc] init];
    
    UINavigationController *navigationColorStationViewController = [[UINavigationController alloc] initWithRootViewController:colorStationViewController];
    
    //开奖信息
    
    ThirdViewController *informationViewController = [[ThirdViewController alloc] init];
    
    UINavigationController *navigationInformationViewController = [[UINavigationController alloc] initWithRootViewController:informationViewController];
    
    //个人信息
    
    FourthViewController *memberViewController = [[FourthViewController alloc] init];
    
    UINavigationController *navigationMemberViewController = [[UINavigationController alloc] initWithRootViewController:memberViewController];
    
    //设置子控制器
    
    tabBarController.items = @[
    
    [SXTabBarModel modelWithImage:@"tabbar_item_home" highlightedImage:@"tabbar_item_home_selected" childVc:navigationHomeViewController],
    
    [SXTabBarModel modelWithImage:@"tabbar_item_betting" highlightedImage:@"tabbar_item_betting_selected" childVc:navigationColorStationViewController],
    
    [SXTabBarPopupModel modelWithImage:@"tabbar_item_interaction" highlightedImage:@"tabbar_item_interaction_selected" target:self action:@selector(popupToVc)],
    
    [SXTabBarModel modelWithImage:@"tabbar_item_information" highlightedImage:@"tabbar_item_information_selected" childVc:navigationInformationViewController],
    
    [SXTabBarModel modelWithImage:@"tabbar_item_mine" highlightedImage:@"tabbar_item_mine_selected" childVc:navigationMemberViewController]
    ];
    
    self.tabBarController = tabBarController;
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)popupToVc {

    MiddleViewController *middleViewController = [[MiddleViewController alloc] init];
    
    UINavigationController *navigationMiddleViewController = [[UINavigationController alloc] initWithRootViewController:middleViewController];
    
    [self.tabBarController presentViewController:navigationMiddleViewController animated:YES completion:nil];
    
}
