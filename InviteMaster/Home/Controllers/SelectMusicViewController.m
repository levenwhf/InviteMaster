//
//  SelectMusicViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/25.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "SelectMusicViewController.h"
#import "XFScrollSegment.h"

@interface SelectMusicViewController ()

@property (weak, nonatomic) IBOutlet XFScrollSegment *seg;

@end

@implementation SelectMusicViewController

+ (id)newSelectMusicVC
{
    SelectMusicViewController *selectMusicVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcSelectMusic"];
    
    return selectMusicVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - settle

- (void)setupUI
{
    self.title = @"选择音乐";
    
    [self.seg setItems:[NSArray arrayWithObjects:@"全部",@"华语",@"日韩",@"欧美",@"纯音乐", nil]];
}

@end
