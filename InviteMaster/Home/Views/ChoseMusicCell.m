//
//  ChoseMusicCell.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/26.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "ChoseMusicCell.h"

@interface ChoseMusicCell()


@end

@implementation ChoseMusicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setupViews];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    _imgViewMark = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 44)];
    _imgViewMark.contentMode = UIViewContentModeCenter;
    [self addSubview:_imgViewMark];
    
    _lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imgViewMark.frame), 0, 60, 44)];
    _lblTitle.textColor = [UIColor darkGrayColor];
    _lblTitle.font = [UIFont systemFontOfSize:14];
    [self addSubview:_lblTitle];
    
    _imgViewFlag = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_lblTitle.frame), 0, 44, 44)];
    _imgViewFlag.contentMode = UIViewContentModeCenter;
    [self addSubview:_imgViewFlag];
    
    _lblDetail = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width - 44 - 60, 0, 60, 44)];
    _lblDetail.textColor = [UIColor grayColor];
    _lblDetail.font = [UIFont systemFontOfSize:14];
//    _lblDetail.backgroundColor = [UIColor redColor];
    _lblDetail.textAlignment = NSTextAlignmentRight;
    [self addSubview:_lblDetail];
}

- (void)setTitle:(NSString *)title
          Detail:(NSString *)detail
            Flag:(ChoseMusicFlag)flag
          IsMark:(BOOL)isMark
   AccessoryType:(UITableViewCellAccessoryType)accessoryType
{
    if (isMark)
    {
        _imgViewMark.image = [UIImage imageNamed:@"icon_check"];
        _lblTitle.textColor = BaseButtonColor;
    }
    else
    {
        _imgViewMark.image = nil;
        _lblTitle.textColor = [UIColor darkGrayColor];
    }
    
    if (flag == ChoseMusicFlagNone)
    {
        _imgViewFlag.image = nil;
    }
    else if (flag == ChoseMusicFlagHot)
    {
        _imgViewFlag.image = [UIImage imageNamed:@"icon_hot"];
    }
    else if (flag == ChoseMusicFlagUpload)
    {
        _imgViewFlag.image = [UIImage imageNamed:@"icon-upload"];
    }
    
    _lblDetail.text = detail;
    
    _lblTitle.text = title;
    
    self.accessoryType = accessoryType;
    
    [self reSize];
}

- (void)reSize
{
    CGSize lblSize = [_lblTitle.text sizeWithAttributes:@{NSFontAttributeName:_lblTitle.font}];
    
    _lblTitle.frame = CGRectMake(_lblTitle.frame.origin.x, _lblTitle.frame.origin.y, lblSize.width, _lblTitle.frame.size.height);
    
    _imgViewFlag.frame = CGRectMake(CGRectGetMaxX(_lblTitle.frame), 0, 44, 44);
    
    _lblDetail.frame = CGRectMake(CGRectGetMaxX(_imgViewFlag.frame), 0, Screen_Width - CGRectGetMaxX(_imgViewFlag.frame) - 30, 44);
}

@end
