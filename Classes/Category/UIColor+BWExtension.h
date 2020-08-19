//
//  UIColor+BWExtension.h
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <UIKit/UIKit.h>

#define BW_RGB(r, g, b) [UIColor bw_Red:r Green:g Blue:b]

#define BW_RGBA(r, g, b, a) [UIColor bw_Red:r Green:g Blue:b alpha:a]

#define BW_HexColor(hexValue) [UIColor bw_hexColor:hexValue]

#define BW_HexColorA(hexValue, alpha) [UIColor bw_hexColor:hexValue alpha:alpha]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (BWExtension)

/// 十六进制颜色
/// @param hexValue 值 例：0x123456
+ (UIColor *)bw_hexColor:(long)hexValue;

/// 十六进制颜色
/// @param hexValue 值 例：0x123456
/// @param alpha 透明度 0～1
+ (UIColor *)bw_hexColor:(long)hexValue alpha:(float)alpha;

/// RGB 颜色 0～255
/// @param red 红
/// @param green 绿
/// @param blue 蓝
+ (UIColor *)bw_Red:(float)red Green:(float)green Blue:(float)blue;

/// RGB 颜色 0～255
/// @param red 红
/// @param green 绿
/// @param blue 蓝
/// @param alpha 透明度 0～1
+ (UIColor *)bw_Red:(float)red Green:(float)green Blue:(float)blue alpha:(float)alpha;

@end

NS_ASSUME_NONNULL_END
