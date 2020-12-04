//
//  UIView+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BWExtension)

/// 顶部 Min Y
@property (nonatomic, assign) CGFloat bw_top;
/// 底部 Max Y
@property (nonatomic, assign) CGFloat bw_bottom;
/// 左侧 Min X
@property (nonatomic, assign) CGFloat bw_left;
/// 右侧 Max X
@property (nonatomic, assign) CGFloat bw_right;
/// 宽度 Width
@property (nonatomic, assign) CGFloat bw_width;
/// 高度 Height
@property (nonatomic, assign) CGFloat bw_height;
/// 大小 Size
@property (nonatomic, assign) CGSize bw_size;
/// 中心点 Center X
@property (nonatomic, assign) CGFloat bw_centerX;
/// 中心点 Center Y
@property (nonatomic, assign) CGFloat bw_centerY;

/// 设置圆角
/// @param radius 圆角大小
- (void)bw_setCornerRadius:(CGFloat)radius;

/// 指定位置圆角
/// @param radius 圆角大小
/// @param corners 位置（UIRectCorner）
- (void)bw_setCornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)corners;

/// 设置边框
/// @param color 颜色，默认宽度为 1
- (void)bw_setBorderClocor:(UIColor *)color;

/// 设置边框
/// @param width 宽度
/// @param color 颜色
- (void)bw_setBorderClocor:(UIColor *)color borderWidth:(CGFloat)width;

@end
 
NS_ASSUME_NONNULL_END
