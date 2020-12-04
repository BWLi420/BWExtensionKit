//
//  NSObject+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (BWExtension)

/// 类型归属
/// @param object 对象是否为子类
+ (BOOL)bw_has:(id)object;

/// 类型转换
/// @param object 需转换的对象
+ (instancetype)bw_cast:(id)object;

/// 类名
+ (NSString *)bw_className;
/// 类名
- (NSString *)bw_className;
/// 父类名
+ (NSString *)bw_superClassName;
/// 父类名
- (NSString *)bw_superClassName;

/// 方法交换
/// @param systemMethod 系统方法
/// @param newMethod 自定义方法
- (BOOL)bw_swizzleSystemMethod:(SEL)systemMethod newMethod:(SEL)newMethod;

/// 是否为空值
//- (BOOL)bw_isEmpty;

@end

NS_ASSUME_NONNULL_END
