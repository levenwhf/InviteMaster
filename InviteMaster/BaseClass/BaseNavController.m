//
//  BaseNavController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/12.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "BaseNavController.h"

@interface BaseNavController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseNavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        self.interactivePopGestureRecognizer.delegate = weakSelf;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 开始接收到手势的代理方法
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 判断是否是侧滑相关的手势
    if (gestureRecognizer == self.interactivePopGestureRecognizer)
    {
        // 如果当前展示的控制器是根控制器就不让其响应
        if (self.viewControllers.count < 2 ||
            self.visibleViewController == [self.viewControllers objectAtIndex:0])
        {
            return NO;
        }
    }
    return YES;
}

// 接收到多个手势的代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    // 判断是否是侧滑相关手势
    if (gestureRecognizer == self.interactivePopGestureRecognizer &&
        [gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]])
    {
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self.view];
        // 如果是侧滑相关的手势，并且手势的方向是侧滑的方向就让多个手势共存
        if (point.x > 0)
        {
            return YES;
        }
    }
    return NO;
}

@end
