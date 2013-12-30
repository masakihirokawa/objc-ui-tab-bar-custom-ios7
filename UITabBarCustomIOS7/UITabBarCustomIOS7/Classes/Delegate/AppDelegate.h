//
//  AppDelegate.h
//  UITabBarCustomIOS7
//
//  Created by Dolice on 2013/12/30.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UITabBarController *_rootController;
}

#pragma mark - property
@property (strong, nonatomic) UIWindow *window;

#pragma mark - public method
- (void)switchTabBarController:(NSInteger)selectedViewIndex;

@end
