//
//  AddNewPageViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/27.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "AddNewPageViewController.h"

#import "XFScrollSegment.h"
#import "NewPageCell.h"

@interface AddNewPageViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic)XFScrollSegment *seg;

@property (strong, nonatomic)UIScrollView *scrollView;

@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic, retain)UICollectionView *collectionView1;
@property (nonatomic, retain)UICollectionView *collectionView2;
@property (nonatomic, retain)UICollectionView *collectionView3;
@property (nonatomic, retain)UICollectionView *collectionView4;

@end

@implementation AddNewPageViewController

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
    self.title = @"添加新页";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    _seg = [[XFScrollSegment alloc]initWithFrame:CGRectMake(0, SCREEN_SAFEAREA_TOP, Screen_Width, 44)];
    [self.seg setItems:[NSArray arrayWithObjects:@"单图",@"二图",@"多图",@"纯文字",@"视频", nil]];
    [self.view addSubview:_seg];
    
    CGFloat y = CGRectGetMaxY(_seg.frame) + 0.5;
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, y, Screen_Width, Screen_Height - y)];
    _scrollView.contentSize = CGSizeMake(Screen_Width * 5, _scrollView.frame.size.height);
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
    
    [self setupCollectionViews];
}

- (void)setupCollectionViews
{
    CGFloat width = _scrollView.frame.size.width;
    CGFloat height = _scrollView.frame.size.height;
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(width * 0, 0, width, height) collectionViewLayout:layout];
    _collectionView.tag = 10;
    _collectionView1 = [[UICollectionView alloc]initWithFrame:CGRectMake(width * 1, 0, width, height) collectionViewLayout:layout];
    _collectionView.tag = 11;
    _collectionView2 = [[UICollectionView alloc]initWithFrame:CGRectMake(width * 2, 0, width, height) collectionViewLayout:layout];
    _collectionView.tag = 12;
    _collectionView3 = [[UICollectionView alloc]initWithFrame:CGRectMake(width * 3, 0, width, height) collectionViewLayout:layout];
    _collectionView.tag = 13;
    _collectionView4 = [[UICollectionView alloc]initWithFrame:CGRectMake(width * 4, 0, width, height) collectionViewLayout:layout];
    _collectionView.tag = 14;
    
    _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _collectionView4.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [_collectionView registerClass:[NewPageCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView1 registerClass:[NewPageCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView2 registerClass:[NewPageCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView3 registerClass:[NewPageCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionView4 registerClass:[NewPageCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    _collectionView1.delegate = self;
    _collectionView1.dataSource = self;
    
    _collectionView2.delegate = self;
    _collectionView2.dataSource = self;
    
    _collectionView3.delegate = self;
    _collectionView3.dataSource = self;
    
    _collectionView4.delegate = self;
    _collectionView4.dataSource = self;
    
    [_scrollView addSubview:_collectionView];
    [_scrollView addSubview:_collectionView1];
    [_scrollView addSubview:_collectionView2];
    [_scrollView addSubview:_collectionView3];
    [_scrollView addSubview:_collectionView4];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (Screen_Width - 10 * 4) / 3;
    
    return CGSizeMake(width, width * 1.8);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView.tag == _collectionView.tag)
    {
        return 2;
    }
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewPageCell *cell = (NewPageCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.img = [UIImage imageNamed:@"login_bg"];
    
    return cell;
}

@end
