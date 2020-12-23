//
//  BWLocation.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/22.
//

#import <Foundation/Foundation.h>
#import "BWLocationResult.h"

typedef void (^LocationResult)(BWLocationResult *result, NSError *error);

@interface BWLocation : NSObject

/// 实例化
+ (instancetype)share;

/// 开始定位
/// @param complateResult 结果回调
- (void)startLocation:(LocationResult)complateResult;

/// 根据 IP 地址获取地理位置
/// @param ip ip
/// @param complateResult 结果回调
- (void)getLocationWithIP:(NSString *)ip result:(LocationResult)complateResult;
@end

