//
//  WalletViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/13.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "WalletViewController.h"
#import "BalanceViewController.h"
#import "CashCell.h"

#define StyleColor [UIColor colorWithRed:236/255.f green:77/255.f blue:114/255.f alpha:1]
#define StyleColorLight [UIColor colorWithRed:236/255.f green:120/255.f blue:150/255.f alpha:1]

#define TipViewHeight 100

@interface WalletViewController ()<UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *lblCountMoney;

@property (weak, nonatomic) IBOutlet UIView *cashView;
@property (weak, nonatomic) IBOutlet UILabel *lblCashTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCashCount;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewCash;
@property (weak, nonatomic) IBOutlet UIImageView *viewCashMark;

@property (weak, nonatomic) IBOutlet UIView *giftView;
@property (weak, nonatomic) IBOutlet UILabel *lblGiftTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblGiftCount;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewGift;
@property (weak, nonatomic) IBOutlet UIImageView *viewGiftMark;

@property (nonatomic, assign) CGFloat countMoney;

@property (nonatomic, assign) int tabIndex;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintScrollContentWidth;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView1;
@property (weak, nonatomic) IBOutlet UITableView *tableView2;

@property (strong, nonatomic) UIView *tipView1;
@property (strong, nonatomic) UIView *tipView2;

@property (nonatomic, retain) NSMutableArray *dataList1;
@property (nonatomic, retain) NSMutableArray *dataList2;

@end

@implementation WalletViewController

+ (id)newWalletVC
{
    WalletViewController *walletVC = [[UIStoryboard storyboardWithName:@"Wallet" bundle:nil] instantiateViewControllerWithIdentifier:@"vcWallet"];
    
    return walletVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self makeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewConstraints
{
    [super updateViewConstraints];
    self.constraintScrollContentWidth.constant = Screen_Width * 2;
}

#pragma mark - settle

- (void)setupUI
{
    self.navView.backgroundColor = [UIColor clearColor];
    self.title = @"请帖大师";
    
    [self setRightButtonTitle:@"查看余额" Target:self Action:@selector(clickBalance)];
    
    self.countMoney = 88.88;
    self.tabIndex = 1;
    
    _cashView.layer.cornerRadius = 8;
    _giftView.layer.cornerRadius = 8;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCashTab)];
    [_cashView addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGiftTab)];
    [_giftView addGestureRecognizer:tap2];

    self.scrollView.delegate = self;
    self.tableView1.delegate = self;
    self.tableView1.dataSource = self;
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
}

- (void)setCountMoney:(CGFloat)countMoney
{
    _countMoney = countMoney;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥ %.2f", _countMoney]];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:14]
                    range:NSMakeRange(0, 2)];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont boldSystemFontOfSize:42]
                    range:NSMakeRange(2, attrStr.string.length - 2)];
    
    _lblCountMoney.attributedText = attrStr;
}

- (void)setTabIndex:(int)tabIndex
{
    if (_tabIndex == tabIndex) return;
    
    _tabIndex = tabIndex;
    
    if (_tabIndex == 1)
    {
        [self setCashLight:YES];
        [self setGiftLight:NO];
    }
    else
    {
        [self setCashLight:NO];
        [self setGiftLight:YES];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.scrollView.contentOffset = CGPointMake((self.tabIndex == 1) ? 0 : Screen_Width, 0);
    }];
}

- (void)setCashLight:(BOOL)b
{
    if (b)
    {
        _cashView.backgroundColor = [UIColor whiteColor];
        _lblCashTitle.textColor = StyleColor;
        _lblCashCount.textColor = StyleColor;
        _imgViewCash.image = [UIImage imageNamed:@"icon_cash_tab_selected"];
        _viewCashMark.hidden = NO;
    }
    else
    {
        _cashView.backgroundColor = StyleColorLight;
        _lblCashTitle.textColor = [UIColor whiteColor];
        _lblCashCount.textColor = [UIColor whiteColor];
        _imgViewCash.image = [UIImage imageNamed:@"icon_cash_tab"];
        _viewCashMark.hidden = YES;
    }
}

- (void)setGiftLight:(BOOL)b
{
    if (b)
    {
        _giftView.backgroundColor = [UIColor whiteColor];
        _lblGiftTitle.textColor = StyleColor;
        _lblGiftCount.textColor = StyleColor;
        _imgViewGift.image = [UIImage imageNamed:@"icon_gift_tab_selected"];
        _viewGiftMark.hidden = NO;
    }
    else
    {
        _giftView.backgroundColor = StyleColorLight;
        _lblGiftTitle.textColor = [UIColor whiteColor];
        _lblGiftCount.textColor = [UIColor whiteColor];
        _imgViewGift.image = [UIImage imageNamed:@"icon_gift_tab"];
        _viewGiftMark.hidden = YES;
    }
}

- (UIView *)tipView1
{
    if (_tipView1 == nil)
    {
        _tipView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView1.frame.size.width, TipViewHeight)];
        _tipView1.layer.masksToBounds = YES;
        
        UILabel *lblTip = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, _tipView1.frame.size.width, 26)];
        lblTip.text = @"还未收到小伙伴赠送的礼物？";
        lblTip.textColor = [UIColor darkGrayColor];
        lblTip.font = [UIFont systemFontOfSize:13];
        lblTip.textAlignment = NSTextAlignmentCenter;
        [_tipView1 addSubview:lblTip];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 240, 36)];
        btn.center = CGPointMake(self.tableView1.frame.size.width / 2, lblTip.center.y + lblTip.frame.size.height + 12);
        btn.layer.cornerRadius = 5;
        btn.backgroundColor = StyleColor;
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitle:@"快去发请帖" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backHomePage) forControlEvents:UIControlEventTouchUpInside];
        [_tipView1 addSubview:btn];
    }
    return _tipView1;
}

- (UIView *)tipView2
{
    if (_tipView2 == nil)
    {
        _tipView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView2.frame.size.width, 100)];
        _tipView2.layer.masksToBounds = YES;
        
        UILabel *lblTip = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, _tipView2.frame.size.width, 26)];
        lblTip.text = @"还未收到小伙伴赠送的礼物？";
        lblTip.textColor = [UIColor darkGrayColor];
        lblTip.font = [UIFont systemFontOfSize:13];
        lblTip.textAlignment = NSTextAlignmentCenter;
        [_tipView2 addSubview:lblTip];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 240, 36)];
        btn.center = CGPointMake(self.tableView1.frame.size.width / 2, lblTip.center.y + lblTip.frame.size.height + 12);
        btn.layer.cornerRadius = 5;
        btn.backgroundColor = StyleColor;
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitle:@"快去发请帖" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(backHomePage) forControlEvents:UIControlEventTouchUpInside];
        [_tipView2 addSubview:btn];
    }
    return _tipView2;
}

- (NSMutableArray *)dataList1
{
    if (_dataList1 == nil)
    {
        _dataList1 = [NSMutableArray arrayWithCapacity:8];
    }
    return _dataList1;
}

- (NSMutableArray *)dataList2
{
    if (_dataList2 == nil)
    {
        _dataList2 = [NSMutableArray arrayWithCapacity:8];
    }
    return _dataList2;
}

- (void)makeData
{
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    [self.dataList1 addObject:@""];
    
    [self reloadData];
}

- (void)reloadData
{
    if (self.dataList1.count == 0)
    {
        self.tipView1.frame = CGRectMake(0, 0, self.tableView1.frame.size.width, TipViewHeight);
        self.tableView1.tableHeaderView = self.tipView1;
    }
    else
    {
        self.tipView1.frame = CGRectMake(0, 0, self.tableView1.frame.size.width, 0.1f);
        self.tableView1.tableHeaderView = self.tipView1;
    }

    if (self.dataList2.count == 0)
    {
        self.tipView2.frame = CGRectMake(0, 0, self.tableView2.frame.size.width, TipViewHeight);
        self.tableView2.tableHeaderView = self.tipView2;
    }
    else
    {
        self.tipView2.frame = CGRectMake(0, 0, self.tableView2.frame.size.width, 0.1f);
        self.tableView2.tableHeaderView = self.tipView2;
    }
    
    [self.tableView1 reloadData];
    [self.tableView2 reloadData];
}

#pragma mark - event

- (void)backHomePage
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)tapCashTab
{
    self.tabIndex = 1;
}

- (void)tapGiftTab
{
    self.tabIndex = 2;
}

- (void)clickBalance
{
    NSLog(@"click balance");
    
    BalanceViewController *vc = [BalanceViewController newBalanceVC];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView)
    {
        if (scrollView.contentOffset.x == 0)
        {
            _tabIndex = 1;
            [self setCashLight:YES];
            [self setGiftLight:NO];
        }
        else
        {
            _tabIndex = 2;
            [self setCashLight:NO];
            [self setGiftLight:YES];
        }
    }
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.tableView1)
    {
        return self.dataList1.count;
    }
    return self.dataList2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (tableView == self.tableView1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        CashCell *cashCell = (CashCell *)cell;
        cashCell.fromName = @"乐文";
        cashCell.dateTime = [NSDate date];
        cashCell.money = 999;
    }
    else
    {
        
    }
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]init];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
