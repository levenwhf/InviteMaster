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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupNavView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置导航栏隐藏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.view bringSubviewToFront:self.navView];
}

- (void)setupNavView
{
    [self.view addSubview:self.navView];
    [self.navView addSubview:self.lblTitle];
    [self.navView addSubview:self.btnLeft];
}

- (UIView *)navView
{
    if (_navView == nil)
    {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 64)];
        _navView.backgroundColor = [UIColor whiteColor];
    }
    return _navView;
}

- (UILabel *)lblTitle
{
    if (_lblTitle == nil)
    {
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake((Screen_Width - TitleWidth) / 2, 20, TitleWidth, 44)];
        
        _lblTitle.textAlignment = NSTextAlignmentCenter;
        _lblTitle.font = [UIFont boldSystemFontOfSize:17];
        _lblTitle.textColor = [UIColor blackColor];
    }
    
    return _lblTitle;
}

- (UIButton *)btnLeft
{
    if (_btnLeft == nil)
    {
        _btnLeft = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 46, 44)];
        
        [_btnLeft setImage:[UIImage imageNamed:@"nav_back"] forState:UIControlStateNormal];
        
        [_btnLeft addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnLeft;
}

- (void)clickLeftBtn
{
    if (self.navigationController != nil)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _lblTitle.text = title;
}

@end
