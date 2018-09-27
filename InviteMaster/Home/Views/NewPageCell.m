//
//  NewPageCell.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/27.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "NewPageCell.h"


@interface NewPageCell()

@property (nonatomic, strong)UIImageView *imgView;

@end


@implementation NewPageCell

- (void)setImg:(UIImage *)img
{
    if (_imgView == nil)
    {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_imgView];
    }
    _imgView.image = img;
}

@end
