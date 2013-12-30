//
//  AppDelegate.m
//  UITabBarCustomIOS7
//
//  Created by Dolice on 2013/12/30.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // window初期化
    [self initWindow];
    
    // rootController初期化
    [self initRootController];
    
    return YES;
}

#pragma mark - Init Window

// window初期化
- (void)initWindow
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    _window = [[UIWindow alloc] initWithFrame:bounds];
}

#pragma mark - Init Root Controller

// rootController初期化
- (void)initRootController
{
    // 基点となる Controller生成
    _rootController = [[UITabBarController alloc] init];
    
    // タブの背景画像と選択時の背景画像を設定
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tab_bar_background.png"]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tab_bar_selection_indicator.png"]];
    
    // タブメニュー選択時のビュー生成
    FirstViewController  *tabFirst  = [[FirstViewController alloc] init];
    SecondViewController *tabSecond = [[SecondViewController alloc] init];
    ThirdViewController  *tabThird  = [[ThirdViewController alloc] init];
    
    if ([self isIOS7]) { // iOS 7用のタブバー生成
        // タブのアイコン指定
        tabFirst.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"First"
                                                            image:[[UIImage imageNamed:@"tab_bar_icon1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                    selectedImage:[[UIImage imageNamed:@"tab_bar_icon1_o.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        tabSecond.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second"
                                                             image:[[UIImage imageNamed:@"tab_bar_icon2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                     selectedImage:[[UIImage imageNamed:@"tab_bar_icon2_o.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        tabThird.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Third"
                                                            image:[[UIImage imageNamed:@"tab_bar_icon3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                    selectedImage:[[UIImage imageNamed:@"tab_bar_icon3_o.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        // タブのフォント指定
        UIFont *tabFont = [UIFont fontWithName:@"HelveticaNeue" size:9.0f];
        
        // タブのタイトル色指定
        NSDictionary *attributesNormal = @{NSFontAttributeName:tabFont, NSForegroundColorAttributeName:[UIColor colorWithRed:0.733f green:0.733f blue:0.733f alpha:1.0f]};
        [[UITabBarItem appearance] setTitleTextAttributes:attributesNormal forState:UIControlStateNormal];
        
        // タブのタイトル色指定 (選択中)
        NSDictionary *selectedAttributes = @{NSFontAttributeName:tabFont, NSForegroundColorAttributeName:[UIColor colorWithRed:0.886f green:0 blue:0.415f alpha:1.0f]};
        [[UITabBarItem appearance] setTitleTextAttributes:selectedAttributes forState:UIControlStateSelected];
    } else { // iOS 6.1以下用のタブバー生成
        // タブのアイコン指定
        [tabFirst.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_bar_icon1_o.png"]
                          withFinishedUnselectedImage:[UIImage imageNamed:@"tab_bar_icon1.png"]];
        [tabSecond.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_bar_icon2_o.png"]
                           withFinishedUnselectedImage:[UIImage imageNamed:@"tab_bar_icon2.png"]];
        [tabThird.tabBarItem setFinishedSelectedImage:[UIImage imageNamed:@"tab_bar_icon3_o.png"]
                          withFinishedUnselectedImage:[UIImage imageNamed:@"tab_bar_icon3.png"]];
        
        // タブのタイトル指定
        [tabFirst setTitle:@"First"];
        [tabSecond setTitle:@"Second"];
        [tabThird setTitle:@"Third"];
        
        // タブのタイトル色指定
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.733f green:0.733f blue:0.733f alpha:1.0f], UITextAttributeTextColor,nil] forState:UIControlStateNormal];
        
        // タブのタイトル色指定 (選択中)
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.886f green:0 blue:0.415f alpha:1.0f], UITextAttributeTextColor,nil] forState:UIControlStateSelected];
    }
    
    // タブのタイトル位置設定
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -2)];
    
    // ビューを Controllerに追加
    NSArray *controllers = [NSArray arrayWithObjects:tabFirst, tabSecond, tabThird, nil];
    [(UITabBarController *)_rootController setViewControllers:controllers animated:NO];
    
    // windowに Controllerのビュー追加
    [_window addSubview:_rootController.view];
    [_window makeKeyAndVisible];
}

// タブ切り替え
- (void)switchTabBarController:(NSInteger)selectedViewIndex
{
    UITabBarController *controller = (UITabBarController *)_rootController;
    controller.selectedViewController = [controller.viewControllers objectAtIndex:selectedViewIndex];
}

#pragma mark - Private method

// iOS7以降であるか
- (BOOL)isIOS7
{
    NSString *osversion = [UIDevice currentDevice].systemVersion;
    NSArray *a = [osversion componentsSeparatedByString:@"."];
    return ([(NSString*)[a objectAtIndex:0] intValue] >= 7);
}

@end
