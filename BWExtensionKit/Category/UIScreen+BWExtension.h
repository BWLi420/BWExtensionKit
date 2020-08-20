//
//  UIScreen+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScreen (BWExtension)

+ (CGSize)bw_size;
+ (CGFloat)bw_width;
+ (CGFloat)bw_height;

/// 实际分辨率
+ (CGSize)bw_DPISize;

/// 转向大小
+ (CGSize)bw_turnSize;
/// 转向宽度
+ (CGFloat)bw_turnWidth;
/// 转向高度
+ (CGFloat)bw_turnHeight;
@end

NS_ASSUME_NONNULL_END
