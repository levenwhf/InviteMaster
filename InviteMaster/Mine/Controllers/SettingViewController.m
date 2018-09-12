//
//  SettingViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/12.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

+ (id)newSettingVC
{
    SettingViewController *settingVC = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:@"vcSetting"];
    
    return settingVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - method

- (void)setupUI
{
    self.title = @"设置";
}

@end
