//
//  XFScrollSegment.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/25.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "XFScrollSegment.h"


@interface XFScrollSegment()

@property (nonatomic, strong)UIView *line;

@end

@implementation XFScrollSegment

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
//        self.directionalLockEnabled = YES;
//        self.bounces = YES;
    }
    return self;
}

- (void)setItems:(NSArray *)items
{
    if (_items == nil)
    {
        _items = items;
        
        [self setupViews];
        
        _selectedIndex = 0;
    }
}

- (NSDictionary *)normalAttrDict
{
    if (_normalAttrDict == nil)
    {
        _normalAttrDict = @{NSFontAttributeName:[UIFont systemFontOfSize:15],
                            NSForegroundColorAttributeName:[UIColor darkGrayColor]};
    }
    return _normalAttrDict;
}

- (NSDictionary *)lightingAttrDict
{
    if (_lightingAttrDict == nil)
    {
        _lightingAttrDict = @{NSFontAttributeName:[UIFont systemFontOfSize:15],
                              NSForegroundColorAttributeName:BaseColor};
    }
    return _lightingAttrDict;
}

- (void)setupViews
{
    CGFloat posX = 0;
    
//    self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
    
    for (int i = 0; i < self.items.count; i++)
    {
        NSString *title = [self.items objectAtIndex:i];
        
        NSDictionary *attrDict = (i == 0 ? self.lightingAttrDict : self.normalAttrDict);
        
        CGSize lblSize = [title sizeWithAttributes:attrDict];
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(posX + SpaceX , 0, lblSize.width, self.frame.size.height)];
        lbl.attributedText = [[NSAttributedString alloc]initWithString:title attributes:attrDict];
        lbl.tag = i + 1;
        
        lbl.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapItem:)];
        
        [lbl addGestureRecognizer:tap];
        
        [self addSubview:lbl];
        
        posX = CGRectGetMaxX(lbl.frame);
//        if (posX + SpaceX > self.frame.size.width)
//        {
//            self.contentSize = CGSizeMake(posX + SpaceX, self.contentSize.height);
//        }
    }
    
    CGRect firstItemFrame = [self viewWithTag:1].frame;
    _line = [[UIView alloc]initWithFrame:CGRectMake(firstItemFrame.origin.x, self.frame.size.height - 2, firstItemFrame.size.width, 2)];
    _line.backgroundColor = BaseColor;
    _line.layer.cornerRadius = 1;
    [self addSubview:_line];
}

- (void)tapItem:(UITapGestureRecognizer *)tap
{
    UILabel *lbl = (UILabel *)tap.view;
    
    self.selectedIndex = lbl.tag - 1;
    
    NSLog(@"tap index: %ld", self.selectedIndex);
    
    if (self.segDelegate != nil && [self.segDelegate respondsToSelector:@selector(segment:didSelectedIndex:)])
    {
        [self.segDelegate segment:self didSelectedIndex:self.selectedIndex];
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    UILabel *lbl = [self viewWithTag:_selectedIndex + 1];
    if (lbl != nil)
    {
        lbl.attributedText = [[NSAttributedString alloc]initWithString:lbl.attributedText.string attributes:self.normalAttrDict];
    }
    
    _selectedIndex = selectedIndex;
    lbl = [self viewWithTag:_selectedIndex + 1];
    lbl.attributedText = [[NSAttributedString alloc]initWithString:[self.items objectAtIndex:selectedIndex] attributes:self.lightingAttrDict];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.line.frame = CGRectMake(lbl.frame.origin.x, self.frame.size.height - 2, lbl.frame.size.width, 2);
    }];
}

@end
