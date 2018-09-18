//
//  BalanceViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/17.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "BalanceViewController.h"

#import "TTTAttributedLabel.h"

@interface BalanceViewController ()<TTTAttributedLabelDelegate>

@property (nonatomic, assign)CGFloat balance;

@property (weak, nonatomic) IBOutlet UILabel *lblBalance;
@property (weak, nonatomic) IBOutlet UIView *noteView;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *lblNote;

@end

@implementation BalanceViewController

+ (id)newBalanceVC
{
    BalanceViewController *balanceVC = [[UIStoryboard storyboardWithName:@"Wallet" bundle:nil] instantiateViewControllerWithIdentifier:@"vcBalance"];
    
    return balanceVC;
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


#pragma mark - settle

- (void)setupUI
{
    self.title = @"余额";
    
    [self setRightButtonTitle:@"提现" Target:self Action:@selector(clickChangeCash)];
    
    [self setNoteContent];
    
    self.balance = 0.88;
}

- (void)setBalance:(CGFloat)balance
{
    _balance = balance;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"¥ %.2f", _balance]];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont systemFontOfSize:14]
                    range:NSMakeRange(0, 2)];
    [attrStr addAttribute:NSFontAttributeName
                    value:[UIFont boldSystemFontOfSize:38]
                    range:NSMakeRange(2, attrStr.string.length - 2)];
    
    _lblBalance.attributedText = attrStr;
}

- (void)setNoteContent
{
    _noteView.layer.borderColor = [[UIColor colorWithWhite:0.8 alpha:1]CGColor];
    _noteView.layer.borderWidth = 0.5;
    _noteView.layer.cornerRadius = 5;
    
    NSString *str = @"您可将余额提现或用于平台消费。\n单笔提现金额不低于2元，提现需扣除0.6%的微信支付服务费，点击查看 相关说明。";
    
    _lblNote.delegate = self;
    _lblNote.lineSpacing = 5;
    
    [_lblNote setText:str afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        
        NSRange range1 = NSMakeRange(0, mutableAttributedString.string.length - 5);
        NSRange range2 = NSMakeRange(mutableAttributedString.string.length - 5, 4);
        
        [mutableAttributedString addAttribute:(NSString *)kCTFontAttributeName
                                        value:[UIFont systemFontOfSize:13]
                                        range:NSMakeRange(0, mutableAttributedString.string.length)];
        
        [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                        value:[UIColor blackColor]
                                        range:range1];
        
        [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName
                                        value:[UIColor colorWithRed:132/255.f green:154/255.f blue:229/255.f alpha:1]
                                        range:range2];
        
        return mutableAttributedString;
    }];
    
    [_lblNote addLinkToURL:nil withRange:NSMakeRange(str.length - 5, 4)];
}

#pragma mark - event

- (void)clickShowNote
{
    NSLog(@"click ShowNote");
}

- (void)clickChangeCash
{
    NSLog(@"click ChangeCash");
}

#pragma mark - TTTAttributedLabelDelegate

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{
    [self clickShowNote];
}

@end
