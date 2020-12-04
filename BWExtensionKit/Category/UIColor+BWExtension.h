//
//  UIColor+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <UIKit/UIKit.h>

/// RGB 颜色 0～255
#define BW_RGB(r, g, b) [UIColor bw_Red:r Green:g Blue:b]
/// RGB 颜色 0～255 透明度 0～1
#define BW_RGBA(r, g, b, a) [UIColor bw_Red:r Green:g Blue:b alpha:a]
/// 十六进制颜色 例:0xFFFFFF
#define BW_HexColor(hexValue) [UIColor bw_hexColor:hexValue]
/// 十六进制颜色 透明度 0～1 例:(0xFFFFFF, 0.5)
#define BW_HexColorA(hexValue, alpha) [UIColor bw_hexColor:hexValue alpha:alpha]

typedef NS_ENUM(NSInteger, BWGradientStyle) {
    BWGradientTopToBottom, // 上 -> 下
    BWGradientLeftToRight, // 左 -> 右
    BWGradientTopLeftToBottomRight, // 上左 -> 下右
    BWGradientBottomLeftToTopRight // 下左 -> 上右
};

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (BWExtension)

/// 十六进制颜色
/// @param hexValue 值 例：0x123456
+ (UIColor *)bw_hexColor:(UInt32)hexValue;

/// 十六进制颜色
/// @param hexValue 值 例：0x123456
/// @param alpha 透明度 0～1
+ (UIColor *)bw_hexColor:(UInt32)hexValue alpha:(CGFloat)alpha;

/// RGB 颜色 0～255
/// @param red 红
/// @param green 绿
/// @param blue 蓝
+ (UIColor *)bw_Red:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue;

/// RGB 颜色 0～255
/// @param red 红
/// @param green 绿
/// @param blue 蓝
/// @param alpha 透明度 0～1
+ (UIColor *)bw_Red:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue alpha:(CGFloat)alpha;

/// 随机颜色
+ (UIColor *)bw_randomColor;

/// 线性渐变颜色
/// @param c1 开始颜色
/// @param c2 结束颜色
/// @param size 大小，一般情况下保持与view相同
/// @param style 样式枚举
+ (UIColor *)bw_gradientFromColor:(UIColor *)c1 toColor:(UIColor *)c2 withSize:(CGSize)size style:(BWGradientStyle)style;

@end

NS_ASSUME_NONNULL_END
