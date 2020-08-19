//
//  UIImage+BWExtension.h
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (BWExtension)

/// 根据颜色生成图片
/// @param color 传入颜色
+ (UIImage *)bw_imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
