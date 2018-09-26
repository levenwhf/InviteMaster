//
//  XFScrollSegment.h
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/25.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define BaseColor [UIColor colorWithRed:255/255.f green:34/255.f blue:105/255.f alpha:1]
#define SpaceX 20

@class XFScrollSegment;

@protocol XFScrollSegmentDelegate<NSObject>

- (void)segment:(XFScrollSegment *)seg didSelectedIndex:(NSInteger)index;

@end


@interface XFScrollSegment : UIView

@property (nonatomic, retain)NSArray *items;

@property (nonatomic, retain)NSDictionary *normalAttrDict;
@property (nonatomic, retain)NSDictionary *lightingAttrDict;

@property (nonatomic, assign)NSInteger selectedIndex;

@property (nonatomic, assign)id<XFScrollSegmentDelegate> segDelegate;

@end
