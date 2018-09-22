//
//  SendCardViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/22.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "SendCardViewController.h"

@interface SendCardViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblInviteTitle;
@property (weak, nonatomic) IBOutlet UIView *frontView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
@property (weak, nonatomic) IBOutlet UIView *viewWeChat;
@property (weak, nonatomic) IBOutlet UIView *viewQQ;
@property (weak, nonatomic) IBOutlet UIView *viewWeChatCircle;
@property (weak, nonatomic) IBOutlet UIView *viewQQZone;
@property (weak, nonatomic) IBOutlet UIView *viewWebo;
@property (weak, nonatomic) IBOutlet UIView *viewSMS;

@end

@implementation SendCardViewController

+ (id)newSendCardVC
{
    SendCardViewController *sendCardVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcSendCard"];
    
    return sendCardVC;
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
    self.title = @"发送";
    _imgView.layer.cornerRadius = _imgView.frame.size.height / 2;
    _imgView.layer.masksToBounds = YES;
}

@end
