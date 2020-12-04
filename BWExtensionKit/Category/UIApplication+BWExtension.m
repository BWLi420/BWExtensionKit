//
//  UIApplication+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/18.
//

#import "UIApplication+BWExtension.h"

@implementation UIApplication (BWExtension)

+ (CGFloat)bw_statusHeight {
    
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (NSString *)bw_appName {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

+ (NSString *)bw_appVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)bw_buildVersion {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString *)bw_bundleID {
    
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (void)bw_cheakAppCanUpdate:(bwCheakAppUpdateResult)cheakResult {
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/lookup"]];
    request.HTTPShouldHandleCookies = NO;
    request.HTTPMethod = @"POST";
    request.HTTPBody = [[NSString stringWithFormat:@"bundleId=%@", [self bw_bundleID]] dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"检测失败，原因：\n%@",error);
            if (cheakResult) {
                cheakResult(nil, nil, BWCheakUpdateNotUpdate);
            }
            return;
        }
        
        NSDictionary *appInfoDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([appInfoDic[@"resultCount"] integerValue] == 0) {
            NSLog(@"检测出未上架的APP或者查询不到");
            if (cheakResult) {
                cheakResult(nil, nil, BWCheakUpdateNotUpdate);
            }
            return;
        }
        
        NSString *newVersion = appInfoDic[@"results"][0][@"version"];
        BWCheakUpdateType result = [self bw_compareVersion:newVersion];
        
        if (cheakResult) {
            cheakResult(appInfoDic[@"results"][0][@"trackViewUrl"], appInfoDic[@"results"][0][@"releaseNotes"], result);
        }
    }];
    [task resume];
}

+ (BWCheakUpdateType)bw_compareVersion:(NSString *)newVersion {
    
    NSString *curVersion = [self bw_appVersion];
    NSLog(@"判断：当前版本号%@, 商店版本号%@", curVersion, newVersion);
    
    // 都为空，相等
    if (!curVersion && !newVersion) {
        return BWCheakUpdateNotUpdate;
    }
    
    // v1为空，v2不为空
    if (!curVersion && newVersion) {
        return BWCheakUpdateCanUpdate;
    }
    
    // v2为空，v1不为空
    if (curVersion && !newVersion) {
        return BWCheakUpdateUnderReview;
    }
    
    // 获取版本号字段
    NSArray *v1Array = [curVersion componentsSeparatedByString:@"."];
    NSArray *v2Array = [newVersion componentsSeparatedByString:@"."];
    // 取字段最少的，进行循环比较
    NSInteger smallCount = (v1Array.count > v2Array.count) ? v2Array.count : v1Array.count;
    
    for (int i = 0; i < smallCount; i++) {
        NSInteger value1 = [[v1Array objectAtIndex:i] integerValue];
        NSInteger value2 = [[v2Array objectAtIndex:i] integerValue];
        if (value1 > value2) {
            // v1版本字段大于v2版本字段
            return BWCheakUpdateUnderReview;
        } else if (value1 < value2) {
            // v2版本字段大于v1版本字段，返回1
            return BWCheakUpdateCanUpdate;
        }
        // 版本相等，继续循环。
    }
    
    // 版本可比较字段相等，则字段多的版本高于字段少的版本。
    if (v1Array.count > v2Array.count) {
        return BWCheakUpdateUnderReview;
    } else if (v1Array.count < v2Array.count) {
        return BWCheakUpdateCanUpdate;
    } else {
        return BWCheakUpdateNotUpdate;
    }
    
    return BWCheakUpdateNotUpdate;
}

@end
