//
//  SelectMusicViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/25.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "SelectMusicViewController.h"
#import "UploadMusicViewController.h"

#import "XFScrollSegment.h"
#import "ChoseMusicCell.h"

@interface SelectMusicViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic)XFScrollSegment *seg;

@property (strong, nonatomic)UIScrollView *scrollView;

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UITableView *tableView1;
@property (nonatomic, strong)UITableView *tableView2;
@property (nonatomic, strong)UITableView *tableView3;
@property (nonatomic, strong)UITableView *tableView4;

@end

@implementation SelectMusicViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - settle

- (void)setupUI
{
    self.title = @"选择音乐";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _seg = [[XFScrollSegment alloc]initWithFrame:CGRectMake(0, SCREEN_SAFEAREA_TOP, Screen_Width, 44)];
    [self.seg setItems:[NSArray arrayWithObjects:@"全部",@"华语",@"日韩",@"欧美",@"纯音乐", nil]];
    [self.view addSubview:_seg];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_seg.frame) + 0.5, Screen_Width, Screen_Height)];
    _scrollView.contentSize = CGSizeMake(Screen_Width * 5, self.scrollView.frame.size.height);
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    [self setupTableViews];
}

- (void)setupTableViews
{
    CGFloat width = _scrollView.frame.size.width;
    CGFloat height = _scrollView.frame.size.height;
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(width * 0, 0, width, height) style:UITableViewStyleGrouped];
    _tableView1 = [[UITableView alloc]initWithFrame:CGRectMake(width * 1, 0, width, height) style:UITableViewStyleGrouped];
    _tableView2 = [[UITableView alloc]initWithFrame:CGRectMake(width * 2, 0, width, height) style:UITableViewStyleGrouped];
    _tableView3 = [[UITableView alloc]initWithFrame:CGRectMake(width * 3, 0, width, height) style:UITableViewStyleGrouped];
    _tableView4 = [[UITableView alloc]initWithFrame:CGRectMake(width * 4, 0, width, height) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    
    _tableView4.delegate = self;
    _tableView4.dataSource = self;
    
    [_scrollView addSubview:_tableView];
    [_scrollView addSubview:_tableView1];
    [_scrollView addSubview:_tableView2];
    [_scrollView addSubview:_tableView3];
    [_scrollView addSubview:_tableView4];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.tableView)
    {
        return 2;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView)
    {
        if (section == 0)
        {
            return 2;
        }
        else
        {
            return 3;
        }
    }
    else if (tableView == self.tableView1)
    {
        return 3;
    }
    else if (tableView == self.tableView2)
    {
        return 3;
    }
    else if (tableView == self.tableView3)
    {
        return 3;
    }
    else if (tableView == self.tableView4)
    {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChoseMusicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[ChoseMusicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    if (tableView == self.tableView)
    {
        if (indexPath.section == 0)
        {
            if (indexPath.row == 0)
            {
                [cell setTitle:@"录音" Detail:@"" Flag:ChoseMusicFlagNone IsMark:NO AccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }
            else if (indexPath.row == 1)
            {
                [cell setTitle:@"上传音乐" Detail:@"最多上传5首" Flag:ChoseMusicFlagNone IsMark:NO AccessoryType:UITableViewCellAccessoryDisclosureIndicator];
            }
        }
        else if (indexPath.section == 1)
        {
            if (indexPath.row == 0)
            {
                [cell setTitle:@"我们结婚吧" Detail:@"" Flag:ChoseMusicFlagHot IsMark:YES AccessoryType:UITableViewCellAccessoryNone];
            }
            else if (indexPath.row == 1)
            {
                [cell setTitle:@"无音乐" Detail:@"" Flag:ChoseMusicFlagNone IsMark:NO AccessoryType:UITableViewCellAccessoryNone];
            }
            else if (indexPath.row == 2)
            {
                [cell setTitle:@"哈哈哈" Detail:@"" Flag:ChoseMusicFlagUpload IsMark:NO AccessoryType:UITableViewCellAccessoryNone];
            }
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == self.tableView)
    {
        if (indexPath.section == 0)
        {
            if (indexPath.row == 0)
            {
                
            }
            else if (indexPath.row == 1)
            {
                UploadMusicViewController *vc = [UploadMusicViewController newUploadMusicVC];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }
    }
}

@end
