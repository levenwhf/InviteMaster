//
//  BaseViewController.h
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/8.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TitleWidth 180

@interface BaseViewController : UIViewController

@property (strong, nonatomic) UIView *navView;
@property (strong, nonatomic) UILabel *lblTitle;
@property (strong, nonatomic) UIButton *btnLeft;
@property (nonatomic, strong) UIButton *rightButton;

- (void)setRightButtonTitle:(NSString *)rightButtonTitle Target:(id)target Action:(SEL)action;

@property (nonatomic, retain) UIColor *navTintColor;

@end
