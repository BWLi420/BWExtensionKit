//
//  BWRegular.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BWRegular : NSObject

/// 验证身份证号码
/// @param idCardNumber 身份证号码，15位或18位
+ (BOOL)validateIDCardNumber:(NSString *)idCardNumber;

/// 验证手机号码
/// @param number 号码
+ (BOOL)validateMobilePhone:(NSString *)number;

/// 自定义正则验证
/// @param string 待验证
/// @param regular 正则表达式
+ (BOOL)validate:(NSString *)string regular:(NSString *)regular;
@end

NS_ASSUME_NONNULL_END
