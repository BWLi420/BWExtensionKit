//
//  UIBarButtonItem+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/9/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (BWExtension)

/// 使用图片创建 UIBarButtonItem
/// @param image 正常Image
/// @param highImage 高亮时Image
/// @param selectImage 选中时Image
+ (instancetype)bw_itemWithImage:(UIImage *)image
                       highImage:(UIImage * _Nullable)highImage
                     selectImage:(UIImage * _Nullable)selectImage
                          target:(id)target
                          action:(SEL)action;

/// 使用文字创建 UIBarButtonItem
/// @param title 正常文字
/// @param selectTitle 选中时文字
+ (instancetype)bw_itemWithTitle:(NSString *)title
                     selectTitle:(NSString * _Nullable)selectTitle
                          target:(id)target
                          action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
