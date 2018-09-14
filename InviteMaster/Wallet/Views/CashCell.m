//
//  CashCell.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/14.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "CashCell.h"

#import "NSString+WPAttributedMarkup.h"
#import "WPHotspotLabel.h"
#import "WPAttributedStyleAction.h"

@interface CashCell()

@property (weak, nonatomic) IBOutlet WPHotspotLabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
@property (weak, nonatomic) IBOutlet UILabel *lblMoney;
@property (weak, nonatomic) IBOutlet UIButton *btnReply;

@end

@implementation CashCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark method

- (void)setMoney:(CGFloat)money
{
    _money = money;
    
    _lblMoney.text = [NSString stringWithFormat:@"¥ %.2f", _money];
}

- (void)setFromName:(NSString *)fromName
{
    _fromName = fromName;
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@给您送了一份礼金", _fromName]];
    [attrStr addAttribute:NSForegroundColorAttributeName
                    value:[UIColor redColor]
                    range:NSMakeRange(0, _fromName.length)];
    
    _lblTitle.attributedText = attrStr;
}

- (void)setDateTime:(NSDate *)dateTime
{
    _dateTime = dateTime;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd hh:mm:ss";
    
    _lblTime.text = [formatter stringFromDate:_dateTime];
}

@end
