//
//  BWSHUD.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/10.
//

#import "BWSHUD.h"

static const NSTimeInterval delayTime = 1.2;

@interface BWSHUD ()
@property (nonatomic, assign) NSTimeInterval delay;
@end

@implementation BWSHUD

+ (instancetype)share {
    
    static BWSHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[BWSHUD alloc] init];
        hud.delay = 0;
        
        hud.config = [BWSHudConfig defaultConfig];
    });
    return hud;
}

#pragma mark -------- 1 --------

- (BWSHUD *(^)(void))showActivity {
    
    return ^(void) {
        [SVProgressHUD show];
        [self setUpUserConfig];
        self.delay = -1;
        [self addCompletion:@""];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(NSString *))showActivityStatus {
    
    return ^(NSString *status) {
        [SVProgressHUD showWithStatus:status];
        [self setUpUserConfig];
        self.delay = -1;
        [self addCompletion:status];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(NSString *))showInfo {
    
    return ^(NSString *status) {
        [SVProgressHUD showInfoWithStatus:status];
        [self setUpUserConfig];
        self.delay = 0;
        [self addCompletion:status];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(NSString *))showSuccess {
    
    return ^(NSString *status) {
        [SVProgressHUD showSuccessWithStatus:status];
        [self setUpUserConfig];
        self.delay = 0;
        [self addCompletion:status];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(NSString *))showError {
    
    return ^(NSString *status) {
        [SVProgressHUD showErrorWithStatus:status];
        [self setUpUserConfig];
        self.delay = 0;
        [self addCompletion:status];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(UIImage *, NSString *))showImage {
    
    return ^(UIImage *img, NSString *status) {
        [SVProgressHUD showImage:img status:status];
        [self setUpUserConfig];
        self.delay = 0;
        [self addCompletion:status];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(CGFloat))showProgress {
    
    return ^(CGFloat pro) {
        [SVProgressHUD showProgress:pro];
        [self setUpUserConfig];
        self.delay = -1;
        [self addCompletion:@""];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(CGFloat, NSString *))showProgressAndStatus {
    
    return ^(CGFloat pro, NSString *status) {
        [SVProgressHUD showProgress:pro status:status];
        [self setUpUserConfig];
        self.delay = -1;
        [self addCompletion:status];
        
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(NSString *))updateStatus {
    
    return ^(NSString *status) {
        [SVProgressHUD setStatus:status];
        [self setUpUserConfig];
        self.delay = -1;
        [self addCompletion:@""];
        
        return [BWSHUD share];
    };
}

#pragma mark -------- 2 --------

- (BWSHUD *(^)(UIImage *))infoImage {
    
    return ^(UIImage *img) {
        [SVProgressHUD setInfoImage:img];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(UIImage *))successImage {
    
    return ^(UIImage *img) {
        [SVProgressHUD setSuccessImage:img];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(UIImage *))errorImage {
    
    return ^(UIImage *img) {
        [SVProgressHUD setErrorImage:img];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(CGSize))imageSzie {
    
    return ^(CGSize size) {
        [SVProgressHUD setImageViewSize:size];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(BWSHudStyle))style {
    
    return ^(BWSHudStyle sty) {
        [self changeStyle:sty];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(BWSHudPosition))position {
    
    return ^(BWSHudPosition pst) {
        [self changePostion:pst];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(CGFloat))font {
    
    return ^(CGFloat font) {
        [SVProgressHUD setFont:[UIFont systemFontOfSize:font]];
        return [BWSHUD share];
    };
}

- (BWSHUD *(^)(BOOL))hapticsEnabled {
    
    return ^(BOOL enable) {
        [SVProgressHUD setHapticsEnabled:enable];
        return [BWSHUD share];
    };
}

#pragma mark -------- 3 --------

- (BWSHUD *(^)(CGFloat))afterDelayTime {
    
    return ^(CGFloat time) {
        [SVProgressHUD dismissWithDelay:time];
        self.delay = time;
        
        return [BWSHUD share];
    };
}

+ (void)dismiss {
    
    [SVProgressHUD dismiss];
}

+ (void)dismissAndCompletion:(void (^)(void))completion {
    
    [SVProgressHUD dismissWithCompletion:^{
        if (completion) {
            completion();
        }
    }];
}

#pragma mark -------- 延迟设置 --------
- (void)setUpUserConfig {
    
    [self changeStyle:self.config.style];
    [self changePostion:self.config.postion];
    [SVProgressHUD setFont:[UIFont systemFontOfSize:self.config.fontSize]];
    [SVProgressHUD setHapticsEnabled:self.config.hapticsEnabled];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}

- (void)delaySetUp:(SEL)method {
    
    [BWSHUD cancelPreviousPerformRequestsWithTarget:self selector:method object:@"BWSHUD-Delay"];
    [[BWSHUD share] performSelector:method withObject:@"BWSHUD-Delay" afterDelay:0.1];
}

- (void)addCompletion:(NSString *)msg {
    
    if (self.delay == 0) {
        if (self.config.autoTime) {
            self.delay = msg.length * 0.06 + 0.5;
        } else {
            self.delay = delayTime;
        }
    } else if (self.delay < 0) {
        self.delay = CGFLOAT_MAX;
    }
    
    [self delaySetUp:@selector(delayDismiss)];
}

- (void)delayDismiss {
    
    [SVProgressHUD dismissWithDelay:self.delay completion:^{
        
        if (self.dismissCompletion) {
            self.dismissCompletion();
        }
        self.dismissCompletion = nil;
    }];
    
    self.delay = 0;
}

- (void)changeStyle:(BWSHudStyle)style {
    
    switch (style) {
        case BWSHudStyleBlack:
            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
            break;
        case BWSHudStyleCustom:
            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
            [SVProgressHUD setBackgroundColor:self.config.customBackgrandColor];
            [SVProgressHUD setForegroundColor:self.config.customContentColor];
            break;
        default:
            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
            break;
    }
}

- (void)changePostion:(BWSHudPosition)pst {
    
    switch (pst) {
        case BWSHudPositionTop:
            [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, -[self getMaxOffect])];
            break;
        case BWSHudPositionBottom:
            [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, [self getMaxOffect])];
            break;
        default:
            [SVProgressHUD setOffsetFromCenter:UIOffsetZero];
            break;
    }
}

/// 获取偏移量
- (CGFloat)getMaxOffect {
    
    CGFloat offect = 0;
    UIWindow *window = [self getKeyWindow];
    
    if (@available(iOS 11.0, *)) {
        offect = (window.bounds.size.height - window.safeAreaInsets.top - window.safeAreaInsets.bottom) / 2.5;
    } else {
        offect = window.bounds.size.height / 2.5;
    }
    
    return offect;
}

- (UIWindow *)getKeyWindow {
    
    UIWindow *window = [UIApplication sharedApplication].delegate.window;
    
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    }
    
    return window;
}

@end
