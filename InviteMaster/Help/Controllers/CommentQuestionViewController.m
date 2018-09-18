//
//  CommentQuestionViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/18.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "CommentQuestionViewController.h"

@interface CommentQuestionViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UITextView *txtViewAnswer;

@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSString *answer;


@end

@implementation CommentQuestionViewController

+ (id)newCommentQuestionVC
{
    CommentQuestionViewController *commentQuestionVC = [[UIStoryboard storyboardWithName:@"Help" bundle:nil] instantiateViewControllerWithIdentifier:@"vcCommentQuestion"];
    
    return commentQuestionVC;
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
    self.title = @"常见问题";
    
    self.question = @"如何解绑微信钱包/银行卡";
    self.answer = @"微信钱包：在需要解绑的请帖中，点击【设置】【提现到】【更改微信钱包】后重新绑定";
}

- (void)setQuestion:(NSString *)question
{
    _question = question;
    
    if (_question != nil)
    {
        _lblQuestion.text = [NSString stringWithFormat:@"Q：%@", _question];
    }
}

- (void)setAnswer:(NSString *)answer
{
    _answer = answer;
    
    if (_answer != nil)
    {
        _txtViewAnswer.text = _answer;
        
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 8;// 字体的行间距
        
        NSDictionary *attributes = @{NSForegroundColorAttributeName:[UIColor darkGrayColor],
                                     NSFontAttributeName:[UIFont systemFontOfSize:14],
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     };
        _txtViewAnswer.attributedText = [[NSAttributedString alloc] initWithString:_txtViewAnswer.text attributes:attributes];
    }
}

@end
