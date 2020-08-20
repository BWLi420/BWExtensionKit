//
//  UIButton+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BWImagePosition) {
    
    BWImagePositionLeft, // 图片在左，文字在右，默认
    BWImagePositionRight, // 图片在右，文字在左
    BWImagePositionTop, // 图片在上，文字在下
    BWImagePositionBottom // 图片在下，文字在上
};

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (BWExtension)

/// 设置额外区域
@property (nonatomic, assign) UIEdgeInsets bw_touchAreaInsets;

/// 更改图片文字位置（⚠️1.需先设置图片和文字再调用此方法，2.按钮理论上应不小于 图片大小 + 文字大小 + spacing）
/// @param position 图片位置枚举
/// @param spacing 间隔大小
- (void)bw_setImagePosition:(BWImagePosition)position spacing:(CGFloat)spacing;

/// 设置图片及文字
/// @param title 文字
/// @param image 图片名称 或 UIImage
/// @param state 状态
- (void)bw_setTitle:(NSString *)title image:(id)image forState:(UIControlState)state;

/// 创建 UIButton
/// @param title 文字
/// @param image 图片名称 或 UIImage
+ (instancetype)bw_setTitle:(NSString *)title image:(id)image;

@end

NS_ASSUME_NONNULL_END
