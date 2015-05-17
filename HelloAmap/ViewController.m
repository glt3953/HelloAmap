//
//  ViewController.m
//  HelloAmap
//
//  Created by ningxia on 15/5/10.
//  Copyright (c) 2015年 ningxia. All rights reserved.
//

#import "ViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "UIImage+NingXia.h"

#define APIKey @"2f8447dea339f146fbdde7d53016f902"

@interface ViewController ()<MAMapViewDelegate, AMapSearchDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) AMapSearchAPI *search;

@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) UIButton *locationButton;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *pois;
@property (nonatomic, strong) NSMutableArray *annotations;

@end

@implementation ViewController

#pragma mark - Init

- (void)initTableView {
    CGFloat halfHeight = CGRectGetHeight(self.view.bounds) * 0.5;
    
    _tableView = [[UITableView alloc] initWithFrame:(CGRect){0, halfHeight, CGRectGetWidth(self.view.bounds), halfHeight} style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];
}

- (void)initAttributes {
    _annotations = [NSMutableArray array];
    _pois = nil;
}

- (void)initControls {
    _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_locationButton setFrame:(CGRect){20, CGRectGetHeight(_mapView.bounds) - 80, 40, 40}];
    _locationButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [_locationButton setBackgroundColor:[UIColor whiteColor]];
    _locationButton.layer.cornerRadius = 5;
    [_locationButton addTarget:self action:@selector(locateAction) forControlEvents:UIControlEventTouchUpInside];
    [_locationButton setImage:[self getLocationImageByStatus:MAUserTrackingModeNone] forState:UIControlStateNormal];
    [_mapView addSubview:_locationButton];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [searchButton setFrame:(CGRect){80, CGRectGetHeight(_mapView.bounds) - 80, 40, 40}];
    searchButton.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
    [searchButton setBackgroundColor:[UIColor whiteColor]];
    searchButton.layer.cornerRadius = 5;
    [searchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [searchButton setImage:[UIImage nx_makeImageFromText:@"\ue61d"
                                                       font:[UIFont fontWithName:@"app-icon" size:24.f]
                                                      color:[UIColor grayColor]] forState:UIControlStateNormal];
    [_mapView addSubview:searchButton];
}

- (UIImage *)getLocationImageByStatus:(MAUserTrackingMode)mode {
    if (mode == MAUserTrackingModeNone) {
        return [UIImage nx_makeImageFromText:@"\ue611"
                                 font:[UIFont fontWithName:@"app-icon" size:24.f]
                                color:[UIColor grayColor]];
    } else {
        return [UIImage nx_makeImageFromText:@"\ue610"
                                        font:[UIFont fontWithName:@"app-icon" size:24.f]
                                       color:[UIColor greenColor]];
    }
}

- (void)initSearch {
    _search = [[AMapSearchAPI alloc] initWithSearchKey:APIKey Delegate:self];
}

#pragma mark - Action
- (void)searchAction {
    if (_currentLocation == nil || _search == nil) {
        NSLog(@"search failed");
        return;
    }
    
    AMapPlaceSearchRequest *request = [[AMapPlaceSearchRequest alloc] init];
    request.searchType = AMapSearchType_PlaceAround;
    request.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
    request.keywords = @"餐饮";
    
    [_search AMapPlaceSearch:request];
}

- (void)locateAction {
    if (_mapView.userTrackingMode != MAUserTrackingModeFollow) {
        [_mapView setUserTrackingMode:MAUserTrackingModeFollow animated:YES];
    }
}

- (void)reGeoAction {
    if (_currentLocation) {
        AMapReGeocodeSearchRequest *request = [[AMapReGeocodeSearchRequest alloc] init];
        
        request.location = [AMapGeoPoint locationWithLatitude:_currentLocation.coordinate.latitude longitude:_currentLocation.coordinate.longitude];
        
        [_search AMapReGoecodeSearch:request];
    }
}

#pragma mark - Search Delegate
- (void)searchRequest:(id)request didFailWithError:(NSError *)error {
    NSLog(@"request: %@, error: %@", request, error);
}

- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response {
    NSLog(@"response: %@", response);
    
    NSString *title = response.regeocode.addressComponent.city;
    if (title.length == 0) {
        title = response.regeocode.addressComponent.province;
    }
    
    _mapView.userLocation.title = title;
    _mapView.userLocation.subtitle = response.regeocode.formattedAddress;
}

- (void)onPlaceSearchDone:(AMapPlaceSearchRequest *)request response:(AMapPlaceSearchResponse *)response {
    NSLog(@"request: %@", request);
    NSLog(@"response: %@", response);
    
    if (response.pois.count > 0) {
        _pois = response.pois;
        
        [_tableView reloadData];
        
        //清空标注
        [_mapView removeAnnotations:_annotations];
        [_annotations removeAllObjects];
    }
}

#pragma mark - map delegate

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]) {
        static NSString *reuseIdentifier = @"annotationReuseIdentifier";
        MAPinAnnotationView *annotationView = (MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIdentifier];
        if (annotationView == nil) {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
        }
        
        annotationView.canShowCallout = YES;
        
        return annotationView;
    }
    
    return nil;
}

- (void)mapView:(MAMapView *)mapView didChangeUserTrackingMode:(MAUserTrackingMode)mode animated:(BOOL)animated {
    // 修改按钮定位状态
    [_locationButton setImage:[self getLocationImageByStatus:mode] forState:UIControlStateNormal];
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    NSLog(@"userLocation: %@", userLocation.location);
    _currentLocation = userLocation.location;
}

- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view {
    // 选中定位annotation的时候进行逆地理编码查询
    if ([view.annotation isKindOfClass:[MAUserLocation class]]) {
        [self reGeoAction];
    }
}

- (void)initMapView {
    [MAMapServices sharedServices].apiKey = APIKey;
    
    _mapView = [[MAMapView alloc] initWithFrame:(CGRect){self.view.bounds.origin, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2}];
    _mapView.delegate = self;
    _mapView.compassOrigin = CGPointMake(_mapView.compassOrigin.x, 22);
    _mapView.scaleOrigin = CGPointMake(_mapView.scaleOrigin.x, 22);
    _mapView.showsUserLocation = YES;
    
    [self.view addSubview:_mapView];
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initMapView];
    [self initControls];
    [self initSearch];
    [self initTableView];
    [self initAttributes];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _pois.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    AMapPOI *poi = _pois[indexPath.row];
    
    [cell.textLabel setText:poi.name];
    [cell.detailTextLabel setText:poi.address];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 为点击的poi点添加标注
    AMapPOI *poi = _pois[indexPath.row];
    
    MAPointAnnotation *annotation = [[MAPointAnnotation alloc] init];
    annotation.coordinate = CLLocationCoordinate2DMake(poi.location.latitude, poi.location.longitude);
    annotation.title = poi.name;
    annotation.subtitle = poi.address;
    
    [_annotations addObject:annotation];
    [_mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
