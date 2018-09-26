//
//  ChoseMusicCell.h
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/26.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ChoseMusicFlag)
{
    ChoseMusicFlagNone = 0,
    ChoseMusicFlagHot,
    ChoseMusicFlagUpload
};

@interface ChoseMusicCell : UITableViewCell

@property (nonatomic, strong)UIImageView *imgViewMark;
@property (nonatomic, strong)UILabel *lblTitle;
@property (nonatomic, strong)UILabel *lblDetail;
@property (nonatomic, strong)UIImageView *imgViewFlag;

- (void)setTitle:(NSString *)title
          Detail:(NSString *)detail
            Flag:(ChoseMusicFlag)flag
          IsMark:(BOOL)isMark
   AccessoryType:(UITableViewCellAccessoryType)accessoryType;

@end
