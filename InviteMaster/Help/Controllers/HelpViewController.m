//
//  HelpViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/17.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *line;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;

@property (nonatomic, assign) int tabIndex;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintScrollContentWidth;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnSubmit;

@end

@implementation HelpViewController

+ (id)newHelpVC
{
    HelpViewController *helpVC = [[UIStoryboard storyboardWithName:@"Help" bundle:nil] instantiateViewControllerWithIdentifier:@"vcHelp"];
    
    return helpVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"帮助";
    [self setupUI];
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


#pragma mark - method

- (void)setupUI
{
    self.tabIndex = 1;
    _line.layer.cornerRadius = 1;
    self.scrollView.delegate = self;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"请尽量详细描述反馈，我们第一时间帮你解决~";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    [placeHolderLabel sizeToFit];
    placeHolderLabel.font = _textView.font;
    [_textView addSubview:placeHolderLabel];
    [_textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    _btnSubmit.layer.cornerRadius = 5;
}


- (void)setTabIndex:(int)tabIndex
{
    if (_tabIndex == tabIndex) return;
    
    _tabIndex = tabIndex;
    
    if (_tabIndex == 1)
    {
        [self setBtn1Light:YES];
        [self setBtn2Light:NO];
    }
    else
    {
        [self setBtn1Light:NO];
        [self setBtn2Light:YES];
    }
    
    [UIView animateWithDuration:0.2 animations:^{
        
        self.line.center = CGPointMake((self.tabIndex == 1) ? self.btn1.center.x : self.btn2.center.x, self.line.center.y);
        
        self.scrollView.contentOffset = CGPointMake((self.tabIndex == 1) ? 0 : Screen_Width, 0);
    }];
}

- (void)setBtn1Light:(BOOL)b
{
    if (b)
    {
        [_btn1 setTitleColor:BaseNavBarColor forState:UIControlStateNormal];
    }
    else
    {
        [_btn1 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

- (void)setBtn2Light:(BOOL)b
{
    if (b)
    {
        [_btn2 setTitleColor:BaseNavBarColor forState:UIControlStateNormal];
    }
    else
    {
        [_btn2 setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
}

#pragma mark - event

- (IBAction)clickBtn1:(id)sender
{
    self.tabIndex = 1;
}

- (IBAction)clickBtn2:(id)sender
{
    self.tabIndex = 2;
}
- (IBAction)clickService1:(id)sender {
}
- (IBAction)clickService2:(id)sender {
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView)
    {
        if (scrollView.contentOffset.x == 0)
        {
            self.tabIndex = 1;
        }
        else
        {
            self.tabIndex = 2;
        }
    }
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.row == 0)
    {
        cell.textLabel.text = @"如何解绑微信钱包/银行卡";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"如何回复宾客祝福";
    }
    else if (indexPath.row == 2)
    {
        cell.textLabel.text = @"如何删除礼物、礼金和宾客回复";
    }
    else if (indexPath.row == 3)
    {
        cell.textLabel.text = @"如何更换/上传请帖音乐";
    }
    else if (indexPath.row == 4)
    {
        cell.textLabel.text = @"如何提现礼物.礼金";
    }
    else if (indexPath.row == 5)
    {
        cell.textLabel.text = @"提现礼物.礼金多久到账";
    }
    else if (indexPath.row == 6)
    {
        cell.textLabel.text = @"如何添加单页";
    }
    else if (indexPath.row == 7)
    {
        cell.textLabel.text = @"如何删除单页";
    }
    else if (indexPath.row == 8)
    {
        cell.textLabel.text = @"如何关闭弹幕";
    }
    else if (indexPath.row == 9)
    {
        cell.textLabel.text = @"请帖地图位置为什么显示不正确";
    }
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]init];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath  animated:YES];
}



@end
