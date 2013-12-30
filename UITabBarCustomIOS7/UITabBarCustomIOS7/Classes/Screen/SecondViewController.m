//
//  SecondViewController.m
//  UITabBarCustomSample
//
//  Created by 廣川政樹 on 2013/09/05.
//  Copyright (c) 2013年 Masaki Hirokawa. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //背景指定
    self.view.backgroundColor = [UIColor underPageBackgroundColor];
    
    //タイトルラベル配置
    UILabel *titleLabel = [DCLabel planeLabel:CGRectMake(0, 200, 320, 48)
                                         text:@"SecondViewController" font:[UIFont fontWithName:@"Helvetica" size:12]
                                    textColor:[UIColor whiteColor] textAlignment:NSTextAlignmentCenter
                              backgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]];
    [self.view addSubview:titleLabel];
}

@end
