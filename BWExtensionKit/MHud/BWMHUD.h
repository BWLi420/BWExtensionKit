//
//  BWMHUD.h
//  TestDemo
//
//  Created by BowenLi on 2020/12/9.
//  Copyright © 2020 BWLi420. All rights reserved.
//
//  基于 MBProgressHUD 封装

#import <UIKit/UIKit.h>
#import "BWMHudConfig.h"
#import <MBProgressHUD/MBProgressHUD.h>

/// 基于 MBProgressHUD 封装
@interface BWMHUD : NSObject

/// 全局配置，仅需设置一次
@property (nonatomic, strong) BWMHudConfig *config;
// 实例化
+ (instancetype)share;

#pragma mark -------- 隐藏HUD --------
/// 隐藏 keyWindow 或 viewController.view 的 HUD
+ (BOOL)hideHUD;
/// 隐藏自定义 view 的 HUD
+ (BOOL)hideHUDForView:(UIView *)view;

#pragma mark -------- 常显消息 --------
+ (MBProgressHUD *)showActivity;

+ (MBProgressHUD *)showActivityWithStyle:(BWMHudStyle)style;

+ (MBProgressHUD *)showActivityWithPostion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

/// 常显消息
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion;

#pragma mark -------- 文本消息 --------
+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (MBProgressHUD *)showMessage:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showMessage:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/// 文本消息
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
/// @param delay 延时移除时间，数值 <= 0 时常显不移除
+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay;

#pragma mark -------- 提示、警告、成功、失败 --------
// 图片在 BWMHudConfig 中配置

+ (MBProgressHUD *)showInfoMessage:(NSString *)message;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/// 事件提醒
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
/// @param delay 延时移除时间，数值 <= 0 时常显不移除
/// @param image 展示的图片
+ (MBProgressHUD *)showTipMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay tipImage:(UIImage *)image;

#pragma mark -------- 自定义视图消息 --------
+ (MBProgressHUD *)showCustomView:(UIView *)customView;

+ (MBProgressHUD *)showCustomView:(UIView *)customView style:(BWMHudStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message style:(BWMHudStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/// 自定义视图消息
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
/// @param delay 延时移除时间，数值 <= 0 时常显不移除
/// @param customView 自定义视图，若视图大小显示有误，需重写 intrinsicContentSize 方法返回正确的 Size
+ (MBProgressHUD *)showCustomMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay customView:(UIView *)customView;

@end
