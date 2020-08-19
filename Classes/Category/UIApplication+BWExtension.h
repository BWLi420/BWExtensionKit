//
//  UIApplication+BWExtension.h
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/18.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BWCheakUpdateType) {
    // 不需要更新
    BWCheakUpdateNotUpdate,
    // 需要更新
    BWCheakUpdateCanUpdate,
    // 正在审核
    BWCheakUpdateUnderReview
};
 
/**
检测结果回调

@param storeUrl 跳转到应用商店的地址
@param updateMsg 更新内容
@param type 是否可升级
*/
typedef void(^bwCheakAppUpdateResult)(NSString * _Nullable storeUrl, NSString * _Nullable updateMsg, BWCheakUpdateType type);

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (BWExtension)

/// 名称
+ (NSString *)bw_appName;

/// 版本号
+ (NSString *)bw_appVersion;

/// 构建版本
+ (NSString *)bw_buildVersion;

/// 唯一标识
+ (NSString *)bw_bundleID;

/// 检测 App 是否可升级
/// @param cheakResult 结果回调
+ (void)bw_cheakAppCanUpdate:(bwCheakAppUpdateResult)cheakResult;

@end

NS_ASSUME_NONNULL_END
