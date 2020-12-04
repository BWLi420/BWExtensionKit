//
//  UIWindow+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIWindow (BWExtension)

/// 当前展示的顶层视图
- (UIViewController *)bw_currentViewController;
@end

NS_ASSUME_NONNULL_END
