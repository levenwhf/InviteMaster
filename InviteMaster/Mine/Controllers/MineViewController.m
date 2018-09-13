//
//  MineViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/11.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "SettingViewController.h"
#import "WalletViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *tableTopView;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewUserHeader;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UIButton *btnVip;

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIView *foreView;
@property (nonatomic, assign) CGRect origialFrame;

@end

@implementation MineViewController

+ (id)newMineVC
{
    MineViewController *mineVC = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:@"vcMine"];
    
    return mineVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

#pragma mark - method

- (void)setupUI
{
    self.navView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    [self setNavTintColor:BaseNavBarColor];
    
    _imgViewUserHeader.layer.cornerRadius = _imgViewUserHeader.frame.size.height / 2;
    _imgViewUserHeader.contentMode = UIViewContentModeScaleAspectFill;
    _imgViewUserHeader.layer.masksToBounds = YES;
    
    [self.view addSubview:self.headImageView];
    [self.view sendSubviewToBack:self.headImageView];
    
    _tableTopView.frame = CGRectMake(_tableTopView.frame.origin.x,
                                     _tableTopView.frame.origin.y,
                                     _tableTopView.frame.size.width,
                                     _origialFrame.size.height);
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (UIImageView *)headImageView
{
    if (_headImageView == nil)
    {
        _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Screen_Width, 240)];
        _headImageView.backgroundColor = BaseNavBarColor;
        _headImageView.image = [UIImage imageNamed:@"me-bg"];
        
        _headImageView.contentMode = UIViewContentModeScaleAspectFill;
        _headImageView.layer.masksToBounds = YES;
        
        self.origialFrame = _headImageView.frame;
        
        _foreView = [[UIView alloc]initWithFrame:CGRectMake(0, _headImageView.frame.size.height - 30, Screen_Width, 60)];
        _foreView.layer.cornerRadius = _foreView.frame.size.height / 2;
        _foreView.backgroundColor = [UIColor whiteColor];
        [_headImageView addSubview:_foreView];
    }
    return _headImageView;
}

#pragma mark - event

- (IBAction)clickVip:(id)sender
{
    NSLog(@"click vip");
}

#pragma mark - UIScrollViewDegete

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //往上滑动offset增加，往下滑动，yoffset减小
    CGFloat yOffset = scrollView.contentOffset.y;
    //处理背景图的放大效果和往上移动的效果
    if (yOffset>0)
    {//往上滑动
        _headImageView.frame = CGRectMake(self.origialFrame.origin.x,
                                          self.origialFrame.origin.y - yOffset,
                                          self.origialFrame.size.width,
                                          self.origialFrame.size.height);
    }
    else
    {//往下滑动，放大处理
        _headImageView.frame = CGRectMake(self.origialFrame.origin.x,
                                          self.origialFrame.origin.y,
                                          self.origialFrame.size.width,
                                          self.origialFrame.size.height - yOffset);
    }
    
    _foreView.frame = CGRectMake(0, _headImageView.frame.size.height - 30, Screen_Width, 60);
    
//    if (yOffset <= 0)
//    {
//        _navView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
//    }
//    else if (yOffset > 0 && yOffset < 160)
//    {
//        float alpha = yOffset / 160;
//
//        _navView.backgroundColor = [UIColor colorWithWhite:1 alpha:alpha];
//    }
//    else if (yOffset >= 160)
//    {
//        _navView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
//    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 4;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MineTableViewCell *cell;
    if (indexPath.section == 0)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        if (indexPath.row == 0)
        {
            [cell setIcon:[UIImage imageNamed:@"icon_wallet"] Title:@"钱包" HasNewIcon:NO];
        }
        else if (indexPath.row == 1)
        {
            [cell setIcon:[UIImage imageNamed:@"icon_setting"] Title:@"设置" HasNewIcon:NO];
        }
        else if (indexPath.row == 2)
        {
            [cell setIcon:[UIImage imageNamed:@"icon_ring"] Title:@"结婚筹备" HasNewIcon:YES];
        }
        else if (indexPath.row == 3)
        {
            [cell setIcon:[UIImage imageNamed:@"icon_headset"] Title:@"联系客服" HasNewIcon:NO];
        }
    }
    else if (indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellLogout" forIndexPath:indexPath];
    }
    
    if (cell == nil)
    {
        cell = (MineTableViewCell *)[[UITableViewCell alloc]init];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:indexPath];
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            WalletViewController *vc = [WalletViewController newWalletVC];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 1)
        {
            SettingViewController *vc = [SettingViewController newSettingVC];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.row == 2)
        {
            
        }
        else if (indexPath.row == 3)
        {
            
        }
    }
    else if (indexPath.section == 1)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
