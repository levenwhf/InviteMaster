//
//  CashCell.h
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/14.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CashCellDelegate<NSObject>

@end

@interface CashCell : UITableViewCell


@property(nonatomic, retain)NSString *fromName;
@property(nonatomic, retain)NSDate *dateTime;
@property(nonatomic, assign)CGFloat money;

@property(nonatomic, assign)id<CashCellDelegate> delegate;

@end
