//
//  UINavigationController+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (BWExtension)

/// 寻找指定 viewController
/// @param className 要寻找的类
- (UIViewController *)bw_findViewController:(NSString *)className;

/// 返回到指定页
/// @param className 返回的类
/// @param animated 是否动画
- (void)bw_popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated;

/// 返回 n层界面
/// @param level n层
/// @param animated 是否动画
- (NSArray *)bw_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
