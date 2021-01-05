//
//  NSDictionary+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/30.
//

#import "NSDictionary+BWExtension.h"

@implementation NSDictionary (BWExtension)

- (NSString *)bw_toString {
    
    if (self == nil || self.allKeys.count == 0) {
        return @"";
    }
    
    NSError *error;
    NSString *jsonString;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    if (!jsonData) {
#ifdef DEBUG
        NSLog(@"%@",error);
#endif
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    //去掉空格
    NSRange range = {0, jsonString.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    //去掉换行符
    NSRange range2 = {0, mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return jsonString;
}

@end
