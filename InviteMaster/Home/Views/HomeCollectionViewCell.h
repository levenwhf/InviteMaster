//
//  HomeCollectionViewCell.h
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/10.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeCollectionViewCell;

@protocol HomeCellDelegate<NSObject>

- (void)clickCellIndexPath:(NSIndexPath *)indexPath Title:(NSString *)title;

@end


@interface HomeCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain)NSIndexPath *indexPath;

@property (nonatomic, assign)id<HomeCellDelegate> delegate;

- (void)setupInfoWithImage:(UIImage *)image
                     Title:(NSString *)title
                 ReadCount:(int)readCount
                  HotCount:(int)hotCount
                  Delegate:(id<HomeCellDelegate>)delegate
                 IndexPath:(NSIndexPath *)indexPath;

@end
