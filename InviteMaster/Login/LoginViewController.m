//
//  LoginViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/7.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "LoginViewController.h"

#import "NSString+WPAttributedMarkup.h"
#import "WPHotspotLabel.h"
#import "WPAttributedStyleAction.h"

#import "HomeViewController.h"
#import "HomePageViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle2;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;
@property (weak, nonatomic) IBOutlet UIButton *btnMake;

@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *inputView;

@property (weak, nonatomic) IBOutlet UIButton *btnAreaCode;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;
@property (weak, nonatomic) IBOutlet UITextField *txtVerifyCode;
@property (weak, nonatomic) IBOutlet UIButton *btnNext2;
@property (weak, nonatomic) IBOutlet UIButton *btnWeChatLogin;

@property (weak, nonatomic) IBOutlet WPHotspotLabel *lblRule;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintView2Bottom;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintView1Bottom;

@property (nonatomic,retain)NSTimer     *timer;
@property (nonatomic,assign)int         timerSecond;

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

#pragma mark - settle

- (void)setupUI
{
    _btnLogin.layer.cornerRadius = _btnLogin.frame.size.height / 2;
    _btnLogin.layer.borderColor = [[UIColor whiteColor]CGColor];
    _btnLogin.layer.borderWidth = 1.5;
    
    _btnMake.layer.cornerRadius = _btnMake.frame.size.height / 2;
    _view2.backgroundColor = [UIColor clearColor];
    _inputView.layer.cornerRadius = 5;
    
    NSDictionary* styleDict = @{@"body":[UIFont fontWithName:@"HelveticaNeue" size:13.0],
                                @"help1":[WPAttributedStyleAction styledActionWithAction:^{
                                    NSLog(@"请帖大师用户协议 action");
                                    [self clickShowRule];
                                }],
                                @"link": [UIColor whiteColor]};
    _lblRule.attributedText = [@"登录即表示你同意<help1>《请帖大师用户协议》</help1>" attributedStringWithStyleBook:styleDict];
}

- (void)refreshBtn
{
    _timerSecond--;
    if (_timerSecond > 0)
    {
        _lblTimer.text = [NSString stringWithFormat:@"%ds",_timerSecond];
        _lblTimer.hidden = NO;
        
        _btnNext.hidden = YES;
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(refreshBtn) userInfo:nil repeats:NO];
    }
    else
    {
        _timer = nil;
        _lblTimer.hidden = YES;
        
        _btnNext.hidden = NO;
    }
}

#pragma mark - event

- (IBAction)clickLogin:(id)sender
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.constraintView1Bottom.constant = -self.view1.frame.size.height;
        
        self.view1.frame = CGRectMake(self.view1.frame.origin.x,
                                      self.view1.frame.origin.y + self.view1.frame.size.height,
                                      self.view1.frame.size.width,
                                      self.view1.frame.size.height);
        
    } completion:^(BOOL finished) {
        
        [self.view updateConstraintsIfNeeded];
        
        self.constraintView2Bottom.constant = 0;
        
        [UIView animateWithDuration:0.2 animations:^{

            self.view2.frame = CGRectMake(self.view2.frame.origin.x,
                                          self.view2.frame.origin.y - self.view2.frame.size.height,
                                          self.view2.frame.size.width,
                                          self.view2.frame.size.height);
        } completion:^(BOOL finished) {
            
            [self.view updateConstraintsIfNeeded];
        } ];
    }];
}

- (IBAction)clickMake:(id)sender
{
    
}

- (IBAction)clickAreaCode:(id)sender
{
    
}

- (IBAction)clickNext:(id)sender
{
    _timerSecond = 5;
    [self refreshBtn];
    
    [_btnNext setImage:nil forState:UIControlStateNormal];
    [_btnNext setTitle:@"重新获取" forState:UIControlStateNormal];
}

- (IBAction)clickNext2:(id)sender
{
//    HomeViewController *vc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcHome"];
    HomePageViewController *vc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcHomePage"];

    BaseNavController *navC = [[BaseNavController alloc]initWithRootViewController:vc];
    navC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:navC animated:YES completion:nil];
}

- (IBAction)clickWeChatLogin:(id)sender
{
    
}

- (void)clickShowRule
{
    NSLog(@"click Show Rule");
}

@end
