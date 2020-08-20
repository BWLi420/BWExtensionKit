//
//  UIView+BWExtension.h
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (BWExtension)

/// 顶部 Y
@property (nonatomic, assign) CGFloat bw_top;
/// 底部 Y
@property (nonatomic, assign) CGFloat bw_bottom;
/// 左侧 X
@property (nonatomic, assign) CGFloat bw_left;
/// 右侧 X
@property (nonatomic, assign) CGFloat bw_right;
/// 宽度
@property (nonatomic, assign) CGFloat bw_width;
/// 高度
@property (nonatomic, assign) CGFloat bw_height;
/// 大小
@property (nonatomic, assign) CGSize bw_size;
/// 中心点 X
@property (nonatomic, assign) CGFloat bw_centerX;
/// 中心点 X
@property (nonatomic, assign) CGFloat bw_centerY;

/// 设置圆角
/// @param radius 圆角大小
- (void)bw_setCornerRadius:(CGFloat)radius;

/// 指定位置圆角
/// @param radius 圆角大小
/// @param corners 位置（UIRectCorner）
- (void)bw_setCornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)corners;

@end
 
NS_ASSUME_NONNULL_END
