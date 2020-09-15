//
//  NSDictionary+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/9/15.
//

#import "NSDictionary+BWExtension.h"

@implementation NSDictionary (BWExtension)

- (void)bw_printPropertyCode {
    
    // 根据字典中有多少个 key，就生成多少个属性
    NSMutableString *codes = [NSMutableString string];
    //遍历字典
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
       
        NSString *code = nil;
        
        //判断类型
        if ([value isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, copy) NSString *%@", key];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@", key];
        }else if ([value isKindOfClass:[NSNumber class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) NSInteger %@", key];
        }else if ([value isKindOfClass:[NSArray class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@", key];
        }else if ([value isKindOfClass:[NSDictionary class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSDictionary *%@", key];
        }
        
        //拼接
        [codes appendFormat:@"\n%@\n", code];
    }];
    
    NSLog(@"Property属性代码：\n%@", codes);
}

@end
