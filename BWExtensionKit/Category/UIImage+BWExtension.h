//
//  UIImage+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (BWExtension)

/// 根据颜色生成图片
/// @param color 传入颜色
+ (UIImage *)bw_imageWithColor:(UIColor *)color;

/// 非渲染加载图片
/// @param name 图片名
+ (instancetype)bw_imageWithOriginalName:(NSString *)name;

/// 获取某个像素的颜色
/// @param point 像素点
- (UIColor *)bw_pixelColorAtLocation:(CGPoint)point;

/// 保存图片到相册。需添加相册访问权限
/// @param album 自定义相册名称，一般为应用名
/// @param complationHandler 结果回调
- (void)saveToAlbum:(NSString *)album complation:(void(^)(BOOL success, NSError * _Nullable error))complationHandler;

/// 仿鲁班算法压缩图片
- (UIImage * _Nullable)bw_compressFromLuban;
@end

NS_ASSUME_NONNULL_END
