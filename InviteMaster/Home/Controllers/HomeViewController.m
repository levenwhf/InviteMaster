//
//  HomeViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/9.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (weak, nonatomic) IBOutlet UIView *changeColorView;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewBangzhu;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewBinke;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewLiwu;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - method

- (void)setupUI
{
    [self changeMenuColor];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBangzhu)];
    [_imgViewBangzhu addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBinke)];
    [_imgViewBinke addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapLiwu)];
    [_imgViewLiwu addGestureRecognizer:tap3];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)changeMenuColor
{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)BaseNavBarColor.CGColor, (__bridge id)BaseNavBarColorLight.CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, _changeColorView.frame.size.width, _changeColorView.frame.size.height);
    [self.changeColorView.layer addSublayer:gradientLayer];
}

#pragma mark - event

- (IBAction)clickUser:(id)sender
{
    NSLog(@"click User");
}

- (void)tapBangzhu
{
    NSLog(@"tap Bangzhu");
}

- (void)tapBinke
{
    NSLog(@"tap Binke");
}

- (void)tapLiwu
{
    NSLog(@"tap Liwu");
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (collectionView.frame.size.width - 21) / 2;
    return CGSizeMake(width, width * 1.6);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
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
