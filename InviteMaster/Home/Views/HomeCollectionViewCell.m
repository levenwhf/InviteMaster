//
//  HomeCollectionViewCell.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/10.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btnReadCount;
@property (weak, nonatomic) IBOutlet UIButton *btnHotCount;


@end

@implementation HomeCollectionViewCell

- (void)layoutSubviews
{
    _btn1.layer.cornerRadius = _btn1.frame.size.height / 2;
    _btn2.layer.cornerRadius = _btn2.frame.size.height / 2;
    _btn3.layer.cornerRadius = _btn3.frame.size.height / 2;
    _btn4.layer.cornerRadius = _btn4.frame.size.height / 2;
    
    self.layer.borderColor = [[UIColor groupTableViewBackgroundColor]CGColor];
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
}


- (void)setupInfoWithImage:(UIImage *)image
                     Title:(NSString *)title
                 ReadCount:(int)readCount
                  HotCount:(int)hotCount
                  Delegate:(id<HomeCellDelegate>)delegate
                 IndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)clickBtn1:(id)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(clickCellIndexPath:Title:)])
    {
        [self.delegate clickCellIndexPath:self.indexPath Title:@""];
    }
}

- (IBAction)clickBtn2:(id)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(clickCellIndexPath:Title:)])
    {
        [self.delegate clickCellIndexPath:self.indexPath Title:@""];
    }
}

- (IBAction)clickBtn3:(id)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(clickCellIndexPath:Title:)])
    {
        [self.delegate clickCellIndexPath:self.indexPath Title:@""];
    }
    
}

- (IBAction)clickBtn4:(id)sender
{
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(clickCellIndexPath:Title:)])
    {
        [self.delegate clickCellIndexPath:self.indexPath Title:@""];
    }
    
}

@end
