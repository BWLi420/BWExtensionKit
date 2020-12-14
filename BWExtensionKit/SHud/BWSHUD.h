//
//  BWSHUD.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/10.
//
//  基于 SVProgressHUD 封装

#import <UIKit/UIKit.h>
#import "BWSHudConfig.h"
#import <SVProgressHUD/SVProgressHUD.h>

// 基于 SVProgressHUD 封装，链式语法
@interface BWSHUD : NSObject

/// 全局配置，仅需设置一次
@property (nonatomic, strong) BWSHudConfig *config;

// 实例化
+ (instancetype)share;

#pragma mark -------- 由于 SVProgressHUD 使用了单例，请按 1，2，3 序列顺序调用，错误顺序可能导致设置失败 --------

#pragma mark -------- 第 1 序列，调用时显示为全局配置样式 --------
/// 常显 提示
@property (nonatomic, copy, readonly) BWSHUD *(^showActivity)(void);
/// 常显 文本
@property (nonatomic, copy, readonly) BWSHUD *(^showActivityStatus)(NSString *);
/// 提示文本
@property (nonatomic, copy, readonly) BWSHUD *(^showInfo)(NSString *);
/// 成功文本
@property (nonatomic, copy, readonly) BWSHUD *(^showSuccess)(NSString *);
/// 失败文本
@property (nonatomic, copy, readonly) BWSHUD *(^showError)(NSString *);
/// 图片弹框
@property (nonatomic, copy, readonly) BWSHUD *(^showImage)(UIImage *, NSString *);
/// 常显 进度提示
@property (nonatomic, copy, readonly) BWSHUD *(^showProgress)(CGFloat);
/// 常显 进度+文字
@property (nonatomic, copy, readonly) BWSHUD *(^showProgressAndStatus)(CGFloat, NSString *);
/// 更新文字，当弹框显示时可调用
@property (nonatomic, copy, readonly) BWSHUD *(^updateStatus)(NSString *);

#pragma mark -------- 第 2 序列，调用时仅单次更新对应样式，不调用则显示全局配置样式 --------

/// 单次提示图片，图片默认 28*28，自定义大小请设置 imageSzie
@property (nonatomic, copy, readonly) BWSHUD *(^infoImage)(UIImage *);
/// 单次成功图片，图片默认 28*28，自定义大小请设置 imageSzie
@property (nonatomic, copy, readonly) BWSHUD *(^successImage)(UIImage *);
/// 单次失败图片，图片默认 28*28，自定义大小请设置 imageSzie
@property (nonatomic, copy, readonly) BWSHUD *(^errorImage)(UIImage *);
/// 自定义设置图片的 imageSize
@property (nonatomic, copy, readonly) BWSHUD *(^imageSzie)(CGSize);

/// 单次样式
@property (nonatomic, copy, readonly) BWSHUD *(^style)(BWSHudStyle);
/// 单次位置
@property (nonatomic, copy, readonly) BWSHUD *(^position)(BWSHudPosition);
/// 单次文本大小
@property (nonatomic, copy, readonly) BWSHUD *(^font)(CGFloat);
/// 单次震动反馈
@property (nonatomic, copy, readonly) BWSHUD *(^hapticsEnabled)(BOOL);

#pragma mark -------- 第 3 序列，移除相关配置 --------

/// 移除延时，默认根据文本长度自适应，0:默认，>0:延时时间，<0:常显不移除
@property (nonatomic, copy, readonly) BWSHUD *(^afterDelayTime)(CGFloat);
/// 移除弹框回调
@property (nonatomic, copy) void (^dismissCompletion)(void);

/// 直接移除
+ (void)dismiss;
/// 直接移除
/// @param completion 回调
+ (void)dismissAndCompletion:(void(^)(void))completion;

@end

