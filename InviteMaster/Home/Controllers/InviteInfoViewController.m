//
//  InviteInfoViewController.m
//  InviteMaster
//
//  Created by 韦洪方 on 2018/9/19.
//  Copyright © 2018年 Leven Wei. All rights reserved.
//

#import "InviteInfoViewController.h"
#import "LocationViewController.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface InviteInfoViewController ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong)UITextField *txtWeChatTitle;
@property (nonatomic, strong)UITextField *txtWeChatDesc;
@property (nonatomic, strong)UITextField *txtPwd;
@property (nonatomic, strong)UITextField *txtPhone1;
@property (nonatomic, strong)UITextField *txtPhone2;
@property (nonatomic, strong)UITextField *txtLink;
@property (nonatomic, strong)UILabel *lblDate;
@property (nonatomic, strong)UITextView *txtViewAddr;

@property (nonatomic, strong)UIButton *btnLocation;

@property (strong, nonatomic) MKMapView *mapView;

@property(nonatomic,strong)CLLocationManager *locMgr;

@property(nonatomic,retain)CLLocation *loc;

@end

@implementation InviteInfoViewController

+ (id)newInviteInfoVC
{
    InviteInfoViewController *inviteInfoVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"vcInviteInfo"];
    
    return inviteInfoVC;
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
    self.title = @"请帖信息";
    [self setRightButtonTitle:@"保存" Target:self Action:@selector(clickSave)];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self configLoc];
}

- (CLLocationManager *)locMgr
{
    if (_locMgr==nil)
    {
        self.locMgr=[[CLLocationManager alloc]init];
        
        self.locMgr.delegate=self;
    }
    return _locMgr;
}

- (void)configLoc
{
    if ([CLLocationManager locationServicesEnabled])
    {
        NSLog(@"定位服务已经打开");
    }
    //如果没有授权则请求用户授权
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
    {
        [self.locMgr requestWhenInUseAuthorization];
    }
    else if([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        self.locMgr = [[CLLocationManager alloc]init];
        [self.locMgr requestAlwaysAuthorization ];
        [self.locMgr  requestWhenInUseAuthorization];
        self.locMgr.delegate = self;
        self.locMgr.desiredAccuracy = kCLLocationAccuracyBest;//精准度
        //    定位精度，枚举类型：
        //    kCLLocationAccuracyBest：最精确定位
        //    CLLocationAccuracy kCLLocationAccuracyNearestTenMeters：十米误差范围
        //kCLLocationAccuracyHundredMeters:百米误差范围
        //kCLLocationAccuracyKilometer:千米误差范围
        //kCLLocationAccuracyThreeKilometers:三千米误差范围
        self.locMgr.distanceFilter = 1.0;//移动十米定位一次
        //    位置信息更新最小距离，只有移动大于这个距离才更新位置信息，默认为kCLDistanceFilterNone：不进行距离限制
        [self.locMgr startUpdatingLocation];
    }
}

#pragma mark - event

- (void)clickSave
{
    
}

- (void)clickLocation
{
    LocationViewController *vc = [LocationViewController newLocationVC];
//    SearchAddrViewController *vc = [[SearchAddrViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
     //locations数组里边存放的是CLLocation对象，一个CLLocation对象就代表着一个位置
    CLLocation *loc = [locations firstObject];

     //维度：loc.coordinate.latitude
     //经度：loc.coordinate.longitude
     NSLog(@"纬度=%f，经度=%f",loc.coordinate.latitude,loc.coordinate.longitude);
    NSLog(@"%lu",(unsigned long)locations.count);

     //停止更新位置（如果定位服务不需要实时更新的话，那么应该停止位置的更新）
 //    [self.locMgr stopUpdatingLocation];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 4)
    {
        return 240;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 3;
    }
    else if (section == 1)
    {
        return 2;
    }
    else if (section == 2)
    {
        return 1;
    }
    else if (section == 3)
    {
        return 1;
    }
    else if (section == 4)
    {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellWeChatTitle" forIndexPath:indexPath];
            if (_txtWeChatTitle == nil)
            {
                _txtWeChatTitle = [cell viewWithTag:2];
            }
        }
        else if (indexPath.row == 1)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellWeChatDesc" forIndexPath:indexPath];
            
            if (_txtWeChatDesc == nil)
            {
                _txtWeChatDesc = [cell viewWithTag:2];
            }
        }
        else if (indexPath.row == 2)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPwd" forIndexPath:indexPath];
            
            if (_txtPwd == nil)
            {
                _txtPwd = [cell viewWithTag:2];
            }
        }
    }
    else if (indexPath.section == 1)
    {
        if (indexPath.row == 0)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPhone1" forIndexPath:indexPath];
            
            if (_txtPhone1 == nil)
            {
                _txtPhone1 = [cell viewWithTag:2];
            }
        }
        else if (indexPath.row == 1)
        {
            cell = [tableView dequeueReusableCellWithIdentifier:@"cellPhone2" forIndexPath:indexPath];
            
            if (_txtPhone2 == nil)
            {
                _txtPhone2 = [cell viewWithTag:2];
            }
        }
    }
    else if (indexPath.section == 2)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellLink" forIndexPath:indexPath];
        
        if (_txtLink == nil)
        {
            _txtLink = [cell viewWithTag:2];
        }
    }
    else if (indexPath.section == 3)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellDate" forIndexPath:indexPath];
        
        if (_lblDate == nil)
        {
            _lblDate = [cell viewWithTag:2];
        }
    }
    else if (indexPath.section == 4)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellAddr" forIndexPath:indexPath];
        
        if (_txtViewAddr == nil)
        {
            _txtViewAddr = [cell viewWithTag:2];
        }
        if (_btnLocation == nil)
        {
            _btnLocation = [cell viewWithTag:3];
            [_btnLocation addTarget:self action:@selector(clickLocation) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]init];
        
        if (_mapView == nil)
        {
            
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 3 && indexPath.row == 0)
    {
        NSLog(@"select date cell");
    }
}

@end
