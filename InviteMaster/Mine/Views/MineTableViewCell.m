//
//  MineTableViewCell.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/11.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "MineTableViewCell.h"

@interface MineTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UIImageView *arrowView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgNewView;

@end

@implementation MineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setIcon:(UIImage *)icon Title:(NSString *)title HasNewIcon:(BOOL)hasNewIcon
{
    self.iconView.image = icon;
    self.lblTitle.text = title;
    if (hasNewIcon)
    {
        self.imgNewView.hidden = NO;
    }
    else
    {
        self.imgNewView.hidden = YES;
    }
}

@end
