//
//  LocationViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/21.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "LocationViewController.h"

#import <MapKit/MapKit.h>

@interface LocationViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *btnSave;
@property (weak, nonatomic) IBOutlet UIView *resultView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, retain)NSMutableArray *resultList;

@end

@implementation LocationViewController

+ (id)newLocationVC
{
    LocationViewController *locationVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcLocation"];
    
    return locationVC;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.view bringSubviewToFront:_searchBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - settle

- (void)setupUI
{
    [self setRightButtonTitle:@"搜索" Target:self Action:@selector(clickRight)];
    [self configSearchBar];
    
    self.tableView.hidden = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _btnSave.layer.cornerRadius = 10;
    _btnSave.layer.shadowColor = [UIColor blackColor].CGColor;
    _btnSave.layer.shadowOpacity = 0.5;
    _btnSave.layer.shadowRadius = 10.0f;
    _btnSave.layer.shadowOffset = CGSizeMake(0,2);
}

- (void)configSearchBar
{    
    UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
    searchField.clearButtonMode = UITextFieldViewModeNever;
    searchField.font = [UIFont systemFontOfSize:15];
    [searchField setValue:[UIColor colorWithWhite:0.85 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];
    
    UIImageView *imgView = (UIImageView *)searchField.leftView;
    imgView.tintColor = [UIColor whiteColor];
    imgView.image = [imgView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    _searchBar.delegate = self;
}

- (NSMutableArray *)resultList
{
    if (_resultList == nil)
    {
        _resultList = [NSMutableArray arrayWithCapacity:8];
    }
    return _resultList;
}

#pragma mark - event

- (void)clickRight
{
    NSString *title = [self.rightButton titleForState:UIControlStateNormal];
    if ([title isEqualToString:@"取消"])
    {
        [self.view endEditing:YES];
        self.tableView.hidden = YES;
        
        [self.rightButton setTitle:@"搜索" forState:UIControlStateNormal];
    }
    else
    {
        [self.searchBar becomeFirstResponder];
        
        [self.rightButton setTitle:@"取消" forState:UIControlStateNormal];
    }
}

#pragma mark - event

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.rightButton setTitle:@"取消" forState:UIControlStateNormal];
    
    self.tableView.hidden = NO;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.resultList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.resultList objectAtIndex:indexPath.row];
    
    return cell;
}

@end
