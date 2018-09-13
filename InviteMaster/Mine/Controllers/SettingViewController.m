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

#pragma mark - method

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
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 5;
    }
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.section == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellNormal" forIndexPath:indexPath];
        cell.textLabel.text = @"基本信息";
        cell.detailTextLabel.text = @"修改";
        cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
    else if (indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellNew" forIndexPath:indexPath];
        UILabel *lblTitle = [cell viewWithTag:1];
        UILabel *lblDetail = [cell viewWithTag:2];
        lblTitle.text = @"请帖音乐";
        lblDetail.text = @"最重要的决定";
    }
    else if (indexPath.section == 2)
    {
        if (indexPath.row == 4)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellNormal" forIndexPath:indexPath];
            cell.textLabel.text = @"提现到";
            cell.detailTextLabel.text = @"设置提现账号";
            cell.detailTextLabel.textColor = [UIColor redColor];
        }
        else
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellSwitch" forIndexPath:indexPath];
            UILabel *lblTitle = [cell viewWithTag:1];
            UISwitch *swh = [cell viewWithTag:2];
            
            if (indexPath.row == 0)
            {
                lblTitle.text = @"弹幕";
                swh.on = NO;
            }
            else if (indexPath.row == 1)
            {
                lblTitle.text = @"虚拟礼物";
                swh.on = NO;
            }
            else if (indexPath.row == 2)
            {
                lblTitle.text = @"礼金";
                swh.on = NO;
            }
            else if (indexPath.row == 3)
            {
                lblTitle.text = @"尾页";
                swh.on = NO;
            }
        }
    }
    else if (indexPath.section == 3)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellLabel" forIndexPath:indexPath];
        UILabel *lblTitle = [cell viewWithTag:1];
        lblTitle.textColor = [UIColor blackColor];
        lblTitle.text = @"复制请帖";
    }
    else if (indexPath.section == 4)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellLabel" forIndexPath:indexPath];
        UILabel *lblTitle = [cell viewWithTag:1];
        lblTitle.textColor = [UIColor redColor];
        lblTitle.text = @"删除请帖";
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
        BaseInfoViewController *vc = [BaseInfoViewController newBaseInfoVC];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
