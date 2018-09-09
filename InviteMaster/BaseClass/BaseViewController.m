//
//  BaseViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/8.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置导航栏不隐藏
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    //设置导航栏背景色
    self.navigationController.navigationBar.barTintColor = BaseNavBarColor;
    //设置导航栏不透明
    self.navigationController.navigationBar.translucent = NO;
    //设置顶部状态栏字体颜色
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
    
    //设置导航栏标题字体
//    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    //设置导航栏左右按钮颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
//    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
}


@end
