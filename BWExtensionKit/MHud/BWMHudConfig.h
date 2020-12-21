//
//  BWMHudConfig.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/14.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BWMHudStyle) {
    BWMHudStyleDefault = 0, // 默认，白底黑字
    BWMHudStyleBlack = 1, // 黑底白字
    BWMHudStyleCustom = 2 // 自定义样式，使用自定义时，请实现 BWMHudConfig 中的颜色配置
};

typedef NS_ENUM(NSInteger, BWMHudPosition) {
    BWMHudPositionCenter = 0, // 默认，居中
    BWMHudPositionTop = 1, // 顶部
    BWMHudPositionBottom = 2 // 底部
};

@interface BWMHudConfig : NSObject

/// 实例化，获取默认配置
+ (instancetype)defaultConfig;

/// 样式，默认白底黑字
@property (nonatomic, assign) BWMHudStyle style;
/// 位置，默认居中
@property (nonatomic, assign) BWMHudPosition postion;
/// 字体大小，默认16
@property (nonatomic, assign) CGFloat fontSize;
/// 根据文字长度自适应显示时间，默认 YES，手动设置 afterDelayTime 时，此配置无效
@property (nonatomic, assign) BOOL autoTime;

// 以下根据需求，不需要则不必配置

/// 自定义样式下背景颜色，使用 BWMHUDStyleCustom 时必须设置
@property (nonatomic, strong) UIColor *customBackgrandColor;
/// 自定义样式下内容颜色，使用 BWMHUDStyleCustom 时必须设置
@property (nonatomic, strong) UIColor *customContentColor;

/// 提示图片
@property (nonatomic, strong) UIImage *infoImage;
/// 警告图片
@property (nonatomic, strong) UIImage *warnImage;
/// 成功图片
@property (nonatomic, strong) UIImage *successImage;
/// 失败图片
@property (nonatomic, strong) UIImage *errorImage;

@end
