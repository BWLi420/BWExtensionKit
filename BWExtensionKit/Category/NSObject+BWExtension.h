//
//  NSObject+BWExtension.h
//  BWSelfKit
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

/// 是否为空值
- (BOOL)bw_isEmpty;

@end

NS_ASSUME_NONNULL_END
