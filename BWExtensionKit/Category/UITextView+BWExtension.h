//
//  UITextView+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (BWExtension)

/// 占位符
@property (nonatomic, copy) NSString *bw_placeHolder;
/// 占位符颜色 默认：灰色
@property (nonatomic, strong) UIColor *bw_placeHolderColor;
/// IQKeyboardManager 等第三方框架会读取placeholder属性，创建 UIToolbar 展示
//@property (nonatomic, copy) NSString *placeholder;

/// 选中所有文本
- (void)bw_selectAllText;

/// 选中指定范围文本
/// @param range 范围
- (void)bw_selectTextWithRange:(NSRange)range;

/// 选中文本的位置
- (NSRange)bw_selectRange;
@end

NS_ASSUME_NONNULL_END
