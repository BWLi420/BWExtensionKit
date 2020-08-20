//
//  UIScreen+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import "UIScreen+BWExtension.h"

@implementation UIScreen (BWExtension)

+ (CGSize)bw_size {
    
    return [self mainScreen].bounds.size;
}

+ (CGFloat)bw_width {
    
    return [self mainScreen].bounds.size.width;
}

+ (CGFloat)bw_height {
    
    return [self mainScreen].bounds.size.height;
}

+ (CGSize)bw_DPISize {
    
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}

+ (CGSize)bw_turnSize {
    
    BOOL isLand = UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    if (isLand) {
        return CGSizeMake([self mainScreen].bounds.size.height, [self mainScreen].bounds.size.width);
    }
    return [self mainScreen].bounds.size;
}

+ (CGFloat)bw_turnWidth {
    
    return [self bw_turnSize].width;
}

+ (CGFloat)bw_turnHeight {
    
    return [self bw_turnSize].height;
}

@end
