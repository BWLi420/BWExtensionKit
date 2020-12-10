//
//  BWMHUD.h
//  TestDemo
//
//  Created by BowenLi on 2020/12/9.
//  Copyright © 2020 BWLi420. All rights reserved.
//
//  基于 MBProgressHUD 封装

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

typedef NS_ENUM(NSInteger, BWMHUDPosition) {
    BWMHUDPositionCenter = 0, // 默认，居中
    BWMHUDPositionTop = 1, // 顶部
    BWMHUDPositionBottom = 2 // 底部
};

typedef NS_ENUM(NSInteger, BWMHUDStyle) {
    BWMHUDStyleDefault = 0, // 默认，白底黑字
    BWMHUDStyleBlack = 1, // 黑底白字
    BWMHUDStyleCustom = 2 // 自定义样式，使用自定义时，请实现 BWMHUDConfig 中的颜色配置
};

/// 全局统一配置
@interface BWMHUDConfig : NSObject

/// 样式，默认白底黑字
@property (nonatomic, assign) BWMHUDStyle style;
/// 位置，默认居中
@property (nonatomic, assign) BWMHUDPosition postion;
/// 字体大小，默认16
@property (nonatomic, assign) CGFloat fontSize;

// 以下根据需求，不需要则不必配置

/// 自定义样式下背景颜色，使用 BWMHUDStyleCustom 时必须设置
@property (nonatomic, strong) UIColor *customBackgrandColor;
/// 自定义样式下内容颜色，使用 BWMHUDStyleCustom 时必须设置
@property (nonatomic, strong) UIColor *customContentColor;
// 图片请自行放到 Assets.xcassets 中
/// 提示图片名称
@property (nonatomic, copy) NSString *infoImageName;
/// 警告图片名称
@property (nonatomic, copy) NSString *warnImageName;
/// 成功图片名称
@property (nonatomic, copy) NSString *successImageName;
/// 失败图片名称
@property (nonatomic, copy) NSString *errorImageName;

/// 单例
+ (instancetype)share;
@end

/// 基于 MBProgressHUD 封装
@interface BWMHUD : NSObject

#pragma mark -------- 隐藏HUD --------
/// 隐藏 keyWindow 或 viewController.view 的 HUD
+ (BOOL)hideHUD;
/// 隐藏自定义 view 的 HUD
+ (BOOL)hideHUDForView:(UIView *)view;

#pragma mark -------- 常显消息 --------
+ (MBProgressHUD *)showActivity;

+ (MBProgressHUD *)showActivityWithStyle:(BWMHUDStyle)style;

+ (MBProgressHUD *)showActivityWithPostion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

/// 常显消息
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style postion:(BWMHUDPosition)postion;

#pragma mark -------- 文本消息 --------
+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (MBProgressHUD *)showMessage:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showMessage:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/// 文本消息
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
/// @param delay 延时移除时间，数值 <= 0 时常显不移除
+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style postion:(BWMHUDPosition)postion afterDelay:(NSTimeInterval)delay;

#pragma mark -------- 提示、警告、成功、失败 --------
// 图片在 BWMHUDConfig 中配置

+ (MBProgressHUD *)showInfoMessage:(NSString *)message;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/// 事件提醒
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
/// @param delay 延时移除时间，数值 <= 0 时常显不移除
/// @param imageName 展示的图片名称，需在 Assets.xcassets 中存在
+ (MBProgressHUD *)showTipMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style postion:(BWMHUDPosition)postion afterDelay:(NSTimeInterval)delay tipImageName:(NSString *)imageName;

#pragma mark -------- 自定义视图消息 --------
+ (MBProgressHUD *)showCustomView:(UIView *)customView;

+ (MBProgressHUD *)showCustomView:(UIView *)customView style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message afterDelay:(NSTimeInterval)delay;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view postion:(BWMHUDPosition)postion;

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay;

/// 自定义视图消息
/// @param message 文本
/// @param view 父视图，传 nil 时使用 keyWindow
/// @param style 样式
/// @param postion 位置
/// @param delay 延时移除时间，数值 <= 0 时常显不移除
/// @param customView 自定义视图，若视图大小显示有误，需重写 intrinsicContentSize 方法返回正确的 Size
+ (MBProgressHUD *)showCustomMessage:(NSString *)message onView:(UIView *)view style:(BWMHUDStyle)style postion:(BWMHUDPosition)postion afterDelay:(NSTimeInterval)delay customView:(UIView *)customView;

@end
