//
//  BWLocation.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/22.
//

#import "BWLocation.h"

@interface BWLocation ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *clManager;
@property (nonatomic, assign) BOOL isDone;

@property (nonatomic, copy) LocationResult locationResult;
@end

@implementation BWLocation

+ (instancetype)share {
    
    static BWLocation *loc;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        loc = [[BWLocation alloc] init];
    });
    return loc;
}

- (void)startLocation:(LocationResult)complateResult {
    
    if (complateResult) {
        self.locationResult = complateResult;
    }
    
    if ([CLLocationManager locationServicesEnabled]) {
        
        [self systemLocation];
    } else {
        
        [self apiLocation];
    }
}

#pragma mark -------- 系统定位 --------
- (void)systemLocation {
    
    if (self.clManager == nil) {
        self.clManager = [[CLLocationManager alloc] init];
    }
    
    self.clManager.delegate = self;
    self.clManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
    self.clManager.distanceFilter = 500.f;
    [self.clManager requestWhenInUseAuthorization];
    
    [self.clManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    [manager stopUpdatingLocation];
    
    CLLocation *cl = locations.lastObject;
    [self reverseGeoCoder:cl];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    [manager stopUpdatingLocation];
    
    [self apiLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    
    NSLog(@"%d", status);
}

#pragma mark -------- API定位 --------
- (void)apiLocation {
    
    NSURL *url = [NSURL URLWithString:@"https://ip.nf/me.json"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 3;
    config.timeoutIntervalForResource = 8;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            [self apiSpareLocation];
        } else {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil][@"ip"];
            
            CLLocationDegrees lat = [dict[@"latitude"] doubleValue];
            CLLocationDegrees lon = [dict[@"longitude"] doubleValue];
            
            BWLocationResult *res = [[BWLocationResult alloc] init];
            res.location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
            res.region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(lat, lon) radius:100.00 identifier:[NSString stringWithFormat:@"<%@%f,%@%f> radius 100.00", lat>0?@"+":@"", lat, lon>0?@"+":@"", lon]];
            res.timeZone = [NSTimeZone timeZoneWithName:dict[@"timezone"]];
            res.country = dict[@"country"];
            res.countryCode = dict[@"country_code"];
            res.locality = dict[@"city"];
            
            [self finalData:res error:nil];
        }
    }];
    [task resume];
}

/// 备用定位
- (void)apiSpareLocation {
    
    // 每分钟45次限制
    NSURL *url = [NSURL URLWithString:@"http://ip-api.com/json/?fields=57811"];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 3;
    config.timeoutIntervalForResource = 8;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            [self finalData:nil error:error];
        } else {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            CLLocationDegrees lat = [dict[@"lat"] doubleValue];
            CLLocationDegrees lon = [dict[@"lon"] doubleValue];
            
            BWLocationResult *res = [[BWLocationResult alloc] init];
            res.location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
            res.region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(lat, lon) radius:100.00 identifier:[NSString stringWithFormat:@"<%@%f,%@%f> radius 100.00", lat>0?@"+":@"", lat, lon>0?@"+":@"", lon]];
            res.timeZone = [NSTimeZone timeZoneWithName:dict[@"timezone"]];
            res.country = dict[@"country"];
            res.countryCode = dict[@"countryCode"];
            res.locality = dict[@"city"];
            
            [self finalData:res error:nil];
        }
    }];
    [task resume];
}

#pragma mark -------- 反地理编码 --------
- (void)reverseGeoCoder:(CLLocation *)location {
    
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        if (error) {
            
            [self apiLocation];
        } else {
            
            CLPlacemark *pla = placemarks.firstObject;
            
            BWLocationResult *res = [[BWLocationResult alloc] init];
            res.location = pla.location;
            res.region = pla.region;
            res.timeZone = pla.timeZone;
            res.country = pla.country;
            res.countryCode = pla.ISOcountryCode;
            res.locality = pla.locality;
            
            [self finalData:res error:nil];
        }
    }];
}

- (void)finalData:(BWLocationResult *)result error:(NSError *)err {
    
    if (self.locationResult) {
        self.locationResult(result, err);
    }
}

#pragma mark -------- ip 获取地理位置 --------
- (void)getLocationWithIP:(NSString *)ip result:(LocationResult)complateResult {
    
    if (ip == nil) {
        if (complateResult) {
            complateResult(nil, [NSError errorWithDomain:NSURLErrorDomain code:404 userInfo:@{NSLocalizedDescriptionKey: @"ip地址为空"}]);
        }
    }
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://ip.nf/%@.json", ip]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 3;
    config.timeoutIntervalForResource = 8;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            [self spareLocationWithIP:ip result:complateResult];
        } else {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil][@"ip"];
            
            CLLocationDegrees lat = [dict[@"latitude"] doubleValue];
            CLLocationDegrees lon = [dict[@"longitude"] doubleValue];
            
            BWLocationResult *res = [[BWLocationResult alloc] init];
            res.location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
            res.region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(lat, lon) radius:100.00 identifier:[NSString stringWithFormat:@"<%@%f,%@%f> radius 100.00", lat>0?@"+":@"", lat, lon>0?@"+":@"", lon]];
            res.timeZone = [NSTimeZone timeZoneWithName:dict[@"timezone"]];
            res.country = dict[@"country"];
            res.countryCode = dict[@"country_code"];
            res.locality = dict[@"city"];
            
            if (complateResult) {
                complateResult(res, nil);
            }
        }
    }];
    [task resume];
}

/// 备用
- (void)spareLocationWithIP:(NSString *)ip result:(LocationResult)complateResult {
    
    // 每分钟45次限制
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://ip-api.com/json/%@?fields=57811", ip]];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 3;
    config.timeoutIntervalForResource = 8;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            
            if (complateResult) {
                complateResult(nil, error);
            }
        } else {
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            CLLocationDegrees lat = [dict[@"lat"] doubleValue];
            CLLocationDegrees lon = [dict[@"lon"] doubleValue];
            
            BWLocationResult *res = [[BWLocationResult alloc] init];
            res.location = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
            res.region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(lat, lon) radius:100.00 identifier:[NSString stringWithFormat:@"<%@%f,%@%f> radius 100.00", lat>0?@"+":@"", lat, lon>0?@"+":@"", lon]];
            res.timeZone = [NSTimeZone timeZoneWithName:dict[@"timezone"]];
            res.country = dict[@"country"];
            res.countryCode = dict[@"countryCode"];
            res.locality = dict[@"city"];
            
            if (complateResult) {
                complateResult(res, nil);
            }
        }
    }];
    [task resume];
}

@end
