//
//  NSObject+BWExtension.m
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#import "NSObject+BWExtension.h"

@implementation NSObject (BWExtension)

+ (BOOL)bw_has:(id)object {
    
    if (!object) {
        return NO;
    }
    return [object isKindOfClass:self];
}

+ (instancetype)bw_cast:(id)object {
    
    if (!object) {
        return nil;
    }
    
    if ([object isKindOfClass:self]) {
        return object;
    } else {
        NSLog(@"类型转换失败. 无法将%@转换为%@", NSStringFromClass([object class]), NSStringFromClass(self));
    }
    return nil;
}

+ (NSString *)bw_className {
    
    return NSStringFromClass([self class]);
}

- (NSString *)bw_className {
    
    return NSStringFromClass([self class]);
}

+ (NSString *)bw_superClassName {
    
    return NSStringFromClass([self superclass]);
}

- (NSString *)bw_superClassName {
    
    return NSStringFromClass([self superclass]);
}

- (BOOL)bw_isEmpty {
    
    if (self == nil) {
        return YES;
    } else if ([NSNull bw_has:self]) {
        return YES;
    } else if ([self respondsToSelector:@selector(length)]) {
        if ([(id)self length] == 0) {
            return YES;
        }
    } else if ([self respondsToSelector:@selector(count)]) {
        if ([(id)self count] == 0) {
            return YES;
        }
    }
    
   return NO;
}

@end
