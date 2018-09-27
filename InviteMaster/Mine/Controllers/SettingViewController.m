//
//  SettingViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/12.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "SettingViewController.h"
#import "BaseInfoViewController.h"

@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - settle

- (void)setupUI
{
    self.title = @"设置";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 3;
    }
    else if (section == 2)
    {
        return 3;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellNormal" forIndexPath:indexPath];
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = @"账号安全";
        cell.detailTextLabel.text = @" ";
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"个人信息";
            cell.detailTextLabel.text = @" ";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"第三方账号绑定";
            cell.detailTextLabel.text = @" ";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"意见反馈";
            cell.detailTextLabel.text = @" ";
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"给请帖大师好评";
            cell.detailTextLabel.text = @" ";
        }
        else if (indexPath.row == 1)
        {
            cell.textLabel.text = @"关于我们";
            cell.detailTextLabel.text = @" ";
        }
        else if (indexPath.row == 2)
        {
            cell.textLabel.text = @"清楚缓存";
            cell.detailTextLabel.text = @" ";
        }
    }
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]init];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            BaseInfoViewController *vc = [BaseInfoViewController newBaseInfoVC];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1)
        {
            
        }
        else if (indexPath.row == 3)
        {
            
        }
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 0)
        {
            
        }
        else if (indexPath.row == 1)
        {
            
        }
        else if (indexPath.row == 3)
        {
            
        }
    }
}

@end
