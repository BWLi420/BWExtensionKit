//
//  UIDevice+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (BWExtension)

/// 设备标识 例：iPhone1,1
+ (NSString *)bw_deviceModel;

/// 设备名称 例：iPhoneX
+ (NSString *)bw_deviceName;

/// 系统版本号
+ (NSString *)bw_systemVersion;

/// 是否为刘海屏
+ (BOOL)bw_bangsScreen;

/// 剩余空间大小，字节
+ (long long)bw_freeDiskSpaceBytes;

/// 总空间大小，字节
+ (long long)bw_totalDiskSpaceBytes;

/// 广告唯一标识（可能为空）
+ (void)bw_idfa:(void(^)(NSString * _Nullable idfa))comption;

/// 开发者应用标识（1.同一账号下的App，同一设备相同，不同设备不同；2.不同账号不同）
+ (NSString *)bw_idfv;

/// 设备唯一标识（第一次获取成功后保存到 KeyChain，后续从 KeyChain 中取值）
+ (NSString *)bw_uuid;

@end

NS_ASSUME_NONNULL_END
