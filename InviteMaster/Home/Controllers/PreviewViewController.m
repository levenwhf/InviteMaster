//
//  PreviewViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/18.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "PreviewViewController.h"
#import "SendCardViewController.h"

#import <WebKit/WebKit.h>

@interface PreviewViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation PreviewViewController

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
    self.title = @"预览";
    [self setRightButtonTitle:@"发送" Target:self Action:@selector(clickSend)];
    
    NSURL *url = [NSURL URLWithString:@"https://www.hunliji.com/p/wedding/Home/Pay/card_page?card_id=MTA1MzkzNjVmaXJlX2Nsb3Vk&appName=cardMaster&with_myb=1"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (WKWebView *)webView
{
    if (_webView == nil)
    {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
        [self.view addSubview:_webView];
    }
    return _webView;
}

#pragma mark - event

- (void)clickSend
{
    NSLog(@"clickSend");
    
    SendCardViewController *vc = [SendCardViewController newSendCardVC];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
