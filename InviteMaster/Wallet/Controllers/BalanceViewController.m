//
//  BalanceViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/17.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "BalanceViewController.h"

@interface BalanceViewController ()

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


#pragma mark - method

- (void)setupUI
{
    self.title = @"余额";
}

@end
