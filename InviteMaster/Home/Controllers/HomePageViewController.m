//
//  HomePageViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/11.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "HomePageViewController.h"
#import "MineViewController.h"
#import "WalletViewController.h"
#import "HelpViewController.h"

@interface HomePageViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnUser;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewBangzhu;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewBinke;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewLiwu;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *btnCreate;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintContentViewTop;

@property (nonatomic, assign) CGFloat lastContentOffset;
@property (nonatomic, assign)BOOL menuHidden;

@end

@implementation HomePageViewController

- (void)viewDidLoad
{
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
    
    //设置导航栏不隐藏
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //设置顶部状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

#pragma mark - method

- (void)setupUI
{
    [self changeBackgroundColor];
    
    _menuHidden = NO;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBangzhu)];
    [_imgViewBangzhu addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBinke)];
    [_imgViewBinke addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLiwu)];
    [_imgViewLiwu addGestureRecognizer:tap3];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    _btnCreate.layer.cornerRadius = _btnCreate.frame.size.height / 2;
    _btnCreate.layer.shadowColor = [UIColor blackColor].CGColor;
    _btnCreate.layer.shadowOpacity = 0.5;
    _btnCreate.layer.shadowRadius = 10.0f;
    _btnCreate.layer.shadowOffset = CGSizeMake(0,2);
    
}

- (void)changeBackgroundColor
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)BaseNavBarColor.CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, self.backgroundView.frame.size.width, self.backgroundView.frame.size.height);
    [self.backgroundView.layer addSublayer:gradientLayer];
}

- (void)setMenuHidden:(BOOL)menuHidden
{
    _menuHidden = menuHidden;
    
    if (_menuHidden)
    {
        _constraintContentViewTop.constant = - self.menuView.frame.origin.y;

        [UIView animateWithDuration:0.3 animations:^{
            
            self.menuView.alpha = 0;
            self.menuView.frame = CGRectMake(self.menuView.frame.origin.x,
                                             self.menuView.frame.origin.y - self.menuView.frame.size.height,
                                             self.menuView.frame.size.width,
                                             self.menuView.frame.size.height);
            self.collectionView.frame = CGRectMake(self.collectionView.frame.origin.x,
                                                   self.collectionView.frame.origin.y - self.menuView.frame.size.height,
                                                   self.collectionView.frame.size.width,
                                                   self.collectionView.frame.size.height);
        } completion:^(BOOL finished) {
            [self updateViewConstraints];
        }];
    }
    else
    {
        _constraintContentViewTop.constant = 0;

        [UIView animateWithDuration:0.3 animations:^{
        
            self.menuView.alpha = 1;
            self.menuView.frame = CGRectMake(self.menuView.frame.origin.x,
                                             0,
                                             self.menuView.frame.size.width,
                                             self.menuView.frame.size.height);
            self.collectionView.frame = CGRectMake(self.collectionView.frame.origin.x,
                                                   self.menuView.frame.size.height,
                                                   self.collectionView.frame.size.width,
                                                   self.collectionView.frame.size.height);
        } completion:^(BOOL finished) {
            [self updateViewConstraints];
        }];
    }
}

#pragma mark - event

- (IBAction)clickCreate:(id)sender
{
    
}

- (IBAction)clickUser:(id)sender
{
    NSLog(@"click User");
    
    MineViewController *vc = [MineViewController newMineVC];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapBangzhu
{
    NSLog(@"tap Bangzhu");
    
    HelpViewController *vc = [HelpViewController newHelpVC];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapBinke
{
    NSLog(@"tap Binke");
}

- (void)tapLiwu
{
    NSLog(@"tap Liwu");
    
    WalletViewController *vc = [WalletViewController newWalletVC];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y < 0 ||
        scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height)
    {
        return;
    }
    
    if (scrollView.contentOffset.y < _lastContentOffset)
    {
        if (_menuHidden == YES)
        {
            self.menuHidden = NO;
        }
    }
    else if (scrollView. contentOffset.y >_lastContentOffset)
    {
        if (_menuHidden == NO)
        {
            self.menuHidden = YES;
        }
    }
    
    _lastContentOffset = scrollView.contentOffset.y;
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (collectionView.frame.size.width - 21) / 2;
    return CGSizeMake(width, width * 1.6);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, self.menuView.frame.size.height + 5, 5);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
}

@end
