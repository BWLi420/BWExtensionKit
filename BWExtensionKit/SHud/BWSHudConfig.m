//
//  BWSHudConfig.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/11.
//

#import "BWSHudConfig.h"

@implementation BWSHudConfig

+ (instancetype)defaultConfig {
    
    BWSHudConfig *config = [[BWSHudConfig alloc] init];
    config.style = BWSHudStyleDefault;
    config.postion = BWSHudPositionCenter;
    config.fontSize = 16;
    config.autoTime = YES;
    config.hapticsEnabled = NO;
    
    return config;
}

@end
