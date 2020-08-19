//
//  UIColor+BWExtension.m
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#import "UIColor+BWExtension.h"

@implementation UIColor (BWExtension)

+ (UIColor *)bw_hexColor:(long)hexValue {
    
    return [self bw_hexColor:hexValue alpha:1.0];
}

+ (UIColor *)bw_hexColor:(long)hexValue alpha:(float)alpha {
    
    return [self colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:alpha];
}

+ (UIColor *)bw_Red:(float)red Green:(float)green Blue:(float)blue {
    
    return [self bw_Red:red Green:green Blue:blue alpha:1.0];
}

+ (UIColor *)bw_Red:(float)red Green:(float)green Blue:(float)blue alpha:(float)alpha {
    
    return [self colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

@end
