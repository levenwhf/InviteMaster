//
//  WalletViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/13.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "WalletViewController.h"

#define StyleColor [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0]
#define StyleColorLight [UIColor colorWithRed:0/255.f green:0/255.f blue:0/255.f alpha:0.5]

@interface WalletViewController ()

@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UILabel *lblCountMoney;

@property (weak, nonatomic) IBOutlet UIView *cashView;
@property (weak, nonatomic) IBOutlet UILabel *lblCashTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCashCount;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewCash;

@property (weak, nonatomic) IBOutlet UIView *giftView;
@property (weak, nonatomic) IBOutlet UILabel *lblGiftTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblGiftCount;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewGift;

@property (nonatomic, assign) CGFloat countMoney;

@property (nonatomic, assign) int tabIndex;


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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - method

- (void)setupUI
{
    self.navView.backgroundColor = [UIColor clearColor];
    self.title = @"请帖大师";
    
    self.countMoney = 88.88;
    
    _cashView.layer.cornerRadius = 8;
    _giftView.layer.cornerRadius = 8;
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapCashTab)];
    [_cashView addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGiftTab)];
    [_giftView addGestureRecognizer:tap2];
    
}

- (void)setCountMoney:(CGFloat)countMoney
{
    _countMoney = countMoney;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥ %.2f", _countMoney]];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:14]
                    range:NSMakeRange(0, 2)];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:46]
                    range:NSMakeRange(2, attrStr.string.length - 2)];
    
    _lblCountMoney.attributedText = attrStr;
}

- (void)setTabIndex:(int)tabIndex
{
    if (_tabIndex == tabIndex) return;
    
    _tabIndex = tabIndex;
    
    if (_tabIndex == 0)
    {
        [self setCashLight:YES];
        [self setGiftLight:NO];
    }
    else
    {
        [self setCashLight:NO];
        [self setGiftLight:YES];
    }
}

- (void)setCashLight:(BOOL)b
{
    if (b)
    {
        _cashView.backgroundColor = [UIColor whiteColor];
        _lblCashTitle.textColor = StyleColor;
        _lblCashCount.textColor = StyleColor;
    }
    else
    {
        _cashView.backgroundColor = StyleColorLight;
        _lblCashTitle.textColor = [UIColor whiteColor];
        _lblCashCount.textColor = [UIColor whiteColor];
    }
}

- (void)setGiftLight:(BOOL)b
{
    if (b)
    {
        _cashView.backgroundColor = [UIColor whiteColor];
        _lblGiftTitle.textColor = StyleColor;
        _lblGiftCount.textColor = StyleColor;
    }
    else
    {
        _cashView.backgroundColor = StyleColorLight;
        _lblGiftTitle.textColor = [UIColor whiteColor];
        _lblGiftCount.textColor = [UIColor whiteColor];
    }
}

#pragma mark - event

- (void)tapCashTab
{
    self.tabIndex = 0;
}

- (void)tapGiftTab
{
    self.tabIndex = 1;
}

@end
