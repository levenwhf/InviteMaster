//
//  EditViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/19.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "EditViewController.h"
#import "InviteSettingViewController.h"
#import "PreviewViewController.h"
#import "SendCardViewController.h"

@interface EditViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnBack;

@property (weak, nonatomic) IBOutlet UIView *itemAddPage;
@property (weak, nonatomic) IBOutlet UIView *itemSort;
@property (weak, nonatomic) IBOutlet UIView *itemSetting;
@property (weak, nonatomic) IBOutlet UIView *itemPreview;

@end

@implementation EditViewController

+ (id)newEditVC
{
    EditViewController *editVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcEdit"];
    
    return editVC;
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
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAddPage)];
    [_itemAddPage addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSort)];
    [_itemSort addGestureRecognizer:tap2];
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSetting)];
    [_itemSetting addGestureRecognizer:tap3];
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapPreview)];
    [_itemPreview addGestureRecognizer:tap4];
}

#pragma mark - event

- (IBAction)clickBack:(id)sender
{
    NSLog(@"click Back");
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickSend:(id)sender
{
    NSLog(@"click Send");
    
    SendCardViewController *vc = [SendCardViewController newSendCardVC];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapAddPage
{
    NSLog(@"tap AddPage");
}

- (void)tapSort
{
    NSLog(@"tap Sort");
}

- (void)tapSetting
{
    NSLog(@"tap Setting");
    
    InviteSettingViewController *vc = [InviteSettingViewController newInviteSettingVC];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tapPreview
{
    NSLog(@"tap Preview");
    
    PreviewViewController *vc = [[PreviewViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
