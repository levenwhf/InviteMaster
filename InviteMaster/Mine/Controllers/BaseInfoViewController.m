//
//  BaseInfoViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/13.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "BaseInfoViewController.h"

@interface BaseInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BaseInfoViewController

+ (id)newBaseInfoVC
{
    BaseInfoViewController *baseInfoVC = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:@"vcBaseInfo"];
    
    return baseInfoVC;
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
    self.title = @"基本信息";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
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
    if (indexPath.row == 0)
    {
        return 66;
    }
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.row == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHeader" forIndexPath:indexPath];
        UILabel *lblTitle = [cell viewWithTag:1];
        UIImageView *imgViewHeader = [cell viewWithTag:2];
        
        lblTitle.text = @"编辑头像";
        imgViewHeader.image = [UIImage imageNamed:@"default_header"];
    }
    else if (indexPath.row == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellNormal" forIndexPath:indexPath];
        cell.textLabel.text = @"昵称";
        cell.detailTextLabel.text = @"手机用户6350";
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
    
}


@end
