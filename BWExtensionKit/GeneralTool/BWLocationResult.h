//
//  BWLocationResult.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/22.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface BWLocationResult : NSObject

@property (nonatomic, strong) CLLocation *location;
@property (nonatomic, strong) CLRegion *region;
@property (nonatomic, strong) NSTimeZone *timeZone;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *locality;

@end

