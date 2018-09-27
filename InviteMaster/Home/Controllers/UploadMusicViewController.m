//
//  UploadMusicViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/27.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "UploadMusicViewController.h"

@interface UploadMusicViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewShare1;
@property (weak, nonatomic) IBOutlet UIView *viewShare2;

@end

@implementation UploadMusicViewController

+ (id)newUploadMusicVC
{
    UploadMusicViewController *uploadMusicVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcUploadMusic"];
    
    return uploadMusicVC;
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
    self.title = @"上传音乐";
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapShare1)];
    [self.viewShare1 addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapShare2)];
    [self.viewShare2 addGestureRecognizer:tap2];
    
}

- (void)tapShare1
{
    NSLog(@"tap share WeChat");
}

- (void)tapShare2
{
    NSLog(@"tap share QQ");
}
@end
