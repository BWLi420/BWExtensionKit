//
//  UIColor+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/17.
//

#import "UIColor+BWExtension.h"

@implementation UIColor (BWExtension)

+ (UIColor *)bw_hexColor:(UInt32)hexValue {
    
    return [self bw_hexColor:hexValue alpha:1.0];
}

+ (UIColor *)bw_hexColor:(UInt32)hexValue alpha:(CGFloat)alpha {
    
    return [self colorWithRed:((CGFloat)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((CGFloat)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((CGFloat)(hexValue & 0xFF)) / 255.0 alpha:alpha];
}

+ (UIColor *)bw_Red:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue {
    
    return [self bw_Red:red Green:green Blue:blue alpha:1.0];
}

+ (UIColor *)bw_Red:(CGFloat)red Green:(CGFloat)green Blue:(CGFloat)blue alpha:(CGFloat)alpha {
    
    return [self colorWithRed:(red / 255.0) green:(green / 255.0) blue:(blue / 255.0) alpha:alpha];
}

+ (UIColor *)bw_randomColor {
    
    NSInteger red = arc4random() % 255;
    NSInteger green = arc4random() % 255;
    NSInteger biue = arc4random() % 255;
    return [self bw_Red:red Green:green Blue:biue];
}

+ (UIColor *)bw_gradientFromColor:(UIColor *)c1 toColor:(UIColor *)c2 withSize:(CGSize)size style:(BWGradientStyle)style {
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    NSArray *colors = [NSArray arrayWithObjects:(id)c1.CGColor, (id)c2.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorspace, (__bridge CFArrayRef)colors, NULL);
    
    switch (style) {
        case BWGradientTopToBottom:
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(0, size.height), 0);
            break;
        case BWGradientLeftToRight:
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(size.width, 0), 0);
            break;
        case BWGradientTopLeftToBottomRight:
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0, 0), CGPointMake(size.width, size.height), 0);
            break;
        case BWGradientBottomLeftToTopRight:
            CGContextDrawLinearGradient(context, gradient, CGPointMake(0, size.height), CGPointMake(size.width, 0), 0);
            break;
        default:
            break;
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorspace);
    UIGraphicsEndImageContext();
    
    return [self colorWithPatternImage:image];
}

@end
