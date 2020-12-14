//
//  BWSHudConfig.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/11.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BWSHudStyle) {
    BWSHudStyleDefault, // 默认，白底黑字
    BWSHudStyleBlack, // 黑底白字
    BWSHudStyleCustom // 自定义样式，使用自定义时，请实现 BWSHudConfig 中的颜色配置
};

typedef NS_ENUM(NSInteger, BWSHudPosition) {
    BWSHudPositionCenter = 0, // 默认，居中
    BWSHudPositionTop, // 顶部
    BWSHudPositionBottom // 底部
};

/// 全局统一配置
@interface BWSHudConfig : NSObject

/// 实例化，获取默认配置
+ (instancetype)defaultConfig;

/// 样式，默认白底黑字
@property (nonatomic, assign) BWSHudStyle style;
/// 位置，默认居中
@property (nonatomic, assign) BWSHudPosition postion;
/// 字体大小，默认 16
@property (nonatomic, assign) CGFloat fontSize;
/// 根据文字长度自适应显示时间，默认 YES，手动设置 afterDelayTime 时，此配置无效
@property (nonatomic, assign) BOOL autoTime;

/// 自定义样式下背景颜色，使用 BWSHudStyleCustom 时必须设置
@property (nonatomic, strong) UIColor *customBackgrandColor;
/// 自定义样式下内容颜色，使用 BWSHudStyleCustom 时必须设置
@property (nonatomic, strong) UIColor *customContentColor;

/// 提示图片
@property (nonatomic, strong) UIImage *infoImage;
/// 成功图片
@property (nonatomic, strong) UIImage *successImage;
/// 失败图片
@property (nonatomic, strong) UIImage *errorImage;

/// 震动反馈，默认 NO
@property (nonatomic, assign) BOOL hapticsEnabled;

@end
