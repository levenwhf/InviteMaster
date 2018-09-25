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
    
    [self.view bringSubviewToFront:self.navView];
    
    //设置导航栏隐藏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)setupNavView
{
    _navTintColor = [UIColor whiteColor];
    
    [self.view addSubview:self.navView];
    [self.navView addSubview:self.lblTitle];
    [self.navView addSubview:self.btnLeft];
}

- (UIView *)navView
{
    if (_navView == nil)
    {
        _navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, SCREEN_SAFEAREA_TOP)];
        _navView.backgroundColor = BaseNavBarColor;
    }
    return _navView;
}

- (UILabel *)lblTitle
{
    if (_lblTitle == nil)
    {
        _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake((Screen_Width - TitleWidth) / 2, SCREEN_SAFEAREA_TOP - 44, TitleWidth, 44)];
        
        _lblTitle.textAlignment = NSTextAlignmentCenter;
        _lblTitle.font = [UIFont boldSystemFontOfSize:17];
        _lblTitle.textColor = _navTintColor;
    }
    
    return _lblTitle;
}

- (void)setRightButtonTitle:(NSString *)rightButtonTitle Target:(id)target Action:(SEL)action
{
    if (_rightButton == nil)
    {
        _rightButton = [[UIButton alloc]initWithFrame:CGRectMake(Screen_Width - 54, SCREEN_SAFEAREA_TOP - 44, 54, 44)];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_rightButton setTitleColor:_navTintColor forState:UIControlStateNormal];
        [self.navView addSubview:_rightButton];
    }
    
    if (rightButtonTitle.length > 2)
    {
        _rightButton.frame = CGRectMake(Screen_Width - 80, SCREEN_SAFEAREA_TOP - 44, 80, 44);
    }
    
    [_rightButton setTitle:rightButtonTitle forState:UIControlStateNormal];
    
    [_rightButton removeTarget:target action:nil forControlEvents:UIControlEventTouchUpInside];
    [_rightButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)btnLeft
{
    if (_btnLeft == nil)
    {
        _btnLeft = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_SAFEAREA_TOP - 44, 46, 44)];
        
        [_btnLeft setImage:[[UIImage imageNamed:@"nav_back"]imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
        _btnLeft.tintColor = self.navTintColor;
        
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

- (void)setNavTintColor:(UIColor *)navTintColor
{
    _navTintColor = navTintColor;
    
    _btnLeft.tintColor = _navTintColor;
    _lblTitle.textColor = _navTintColor;
    
    if (_rightButton != nil)
    {
        [_rightButton setTitleColor:_navTintColor forState:UIControlStateNormal];
    }
}

- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    _lblTitle.text = title;
}

@end
