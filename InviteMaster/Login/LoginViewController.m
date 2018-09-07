//
//  LoginViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/7.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle2;

@property (weak, nonatomic) IBOutlet UIView *actionView;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnMake;


@end

@implementation LoginViewController

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
    _btnLogin.layer.cornerRadius = _btnLogin.frame.size.height / 2;
    _btnLogin.layer.borderColor = [[UIColor whiteColor]CGColor];
    _btnLogin.layer.borderWidth = 1.5;
    
    _btnMake.layer.cornerRadius = _btnMake.frame.size.height / 2;
}

#pragma mark - event

- (IBAction)clickLogin:(id)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.actionView.frame = CGRectMake(self.actionView.frame.origin.x,
                                           self.actionView.frame.origin.y + self.actionView.frame.size.height,
                                           self.actionView.frame.size.width,
                                           self.actionView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
}

- (IBAction)clickMake:(id)sender
{
    
}

@end
