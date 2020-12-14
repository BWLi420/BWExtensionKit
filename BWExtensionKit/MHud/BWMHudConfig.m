//
//  BWMHudConfig.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/14.
//

#import "BWMHudConfig.h"

@implementation BWMHudConfig

+ (instancetype)defaultConfig {
    
    BWMHudConfig *config = [[BWMHudConfig alloc] init];
    config.style = BWMHudStyleDefault;
    config.postion = BWMHudPositionCenter;
    config.fontSize = 16;
    config.autoTime = YES;
    
    return config;
}

@end
