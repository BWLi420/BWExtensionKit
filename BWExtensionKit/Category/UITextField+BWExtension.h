//
//  UITextField+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (BWExtension)

/// 占位文本颜色
@property (nonatomic, strong) UIColor *bw_PlaceholderColor;

/// 选中所有文本
- (void)bw_selectAllText;

/// 选中指定范围文本
/// @param range 范围
- (void)bw_selectTextWithRange:(NSRange)range;

/// 选中文本的位置
- (NSRange)bw_selectRange;

@end

NS_ASSUME_NONNULL_END
