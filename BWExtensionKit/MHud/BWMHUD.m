//
//  BWMHUD.m
//  TestDemo
//
//  Created by BowenLi on 2020/12/9.
//  Copyright © 2020 BWLi420. All rights reserved.
//

#import "BWMHUD.h"

static const CGFloat delayTime = 1.2;
/// 显示时长
#define kGetDelayTime(msg) [self getDelayTime:msg]
/// 默认样式白底黑字
#define kBWMHudStyle [BWMHUD share].config.style
/// 默认位置居中
#define kBWMHudPostion [BWMHUD share].config.postion
/// 默认字体大小
#define kHudFontSize [BWMHUD share].config.fontSize

@implementation BWMHUD

+ (instancetype)share {
    
    static BWMHUD *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        hud = [[BWMHUD alloc] init];
        hud.config = [BWMHudConfig defaultConfig];
    });
    return hud;
}

#pragma mark -------- 常显消息 --------
+ (MBProgressHUD *)showActivity {
    
    return [self showActivityMessage:nil onView:nil style:kBWMHudStyle postion:kBWMHudPostion];
}

+ (MBProgressHUD *)showActivityWithStyle:(BWMHudStyle)style {
    
    return [self showActivityMessage:nil onView:nil style:style postion:kBWMHudPostion];
}

+ (MBProgressHUD *)showActivityWithPostion:(BWMHudPosition)postion {
    
    return [self showActivityMessage:nil onView:nil style:kBWMHudStyle postion:postion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message {
    
    return [self showActivityMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showActivityMessage:message onView:nil style:style postion:kBWMHudPostion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showActivityMessage:message onView:nil style:kBWMHudStyle postion:postion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view {
    
    return [self showActivityMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showActivityMessage:message onView:view style:style postion:kBWMHudPostion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showActivityMessage:message onView:view style:kBWMHudStyle postion:postion];
}

+ (MBProgressHUD *)showActivityMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion {
    
    return [self createHudOnView:view showMessage:message style:style postion:postion afterDelay:0 mode:MBProgressHUDModeIndeterminate customView:nil];
}

#pragma mark -------- 文字消息 --------
+ (MBProgressHUD *)showMessage:(NSString *)message {
    
    return [self showMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message)];
}

+ (MBProgressHUD *)showMessage:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showMessage:message onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message)];
}

+ (MBProgressHUD *)showMessage:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showMessage:message onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message)];
}

+ (MBProgressHUD *)showMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    return [self showMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay];
}

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view {
    
    return [self showMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message)];
}

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showMessage:message onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message)];
}

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showMessage:message onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message)];
}

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay];
}

+ (MBProgressHUD *)showMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay {
    
    return [self createHudOnView:view showMessage:message style:style postion:postion afterDelay:delay mode:MBProgressHUDModeText customView:nil];
}

#pragma mark -------- 提示、警告、成功、失败 --------
+ (MBProgressHUD *)showInfoMessage:(NSString *)message {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showInfoMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.infoImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showWarnMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.warnImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showSuccessMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.successImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showTipMessage:message onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showErrorMessage:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showTipMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay tipImage:[BWMHUD share].config.errorImage];
}

+ (MBProgressHUD *)showTipMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay tipImage:(UIImage *)image {
    
    return [self createHudOnView:view showMessage:message style:style postion:postion afterDelay:delay mode:MBProgressHUDModeCustomView customView:[[UIImageView alloc] initWithImage:image]];
}

#pragma mark -------- 自定义视图消息 --------
+ (MBProgressHUD *)showCustomView:(UIView *)customView {
    
    return [self showCustomMessage:nil onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(@"") customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView style:(BWMHudStyle)style {
    
    return [self showCustomMessage:nil onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(@"") customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView postion:(BWMHudPosition)postion {
    
    return [self showCustomMessage:nil onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(@"") customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView afterDelay:(NSTimeInterval)delay {
    
    return [self showCustomMessage:nil onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view {
    
    return [self showCustomMessage:nil onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(@"") customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showCustomMessage:nil onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(@"") customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showCustomMessage:nil onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(@"") customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showCustomMessage:nil onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message {
    
    return [self showCustomMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message style:(BWMHudStyle)style {
    
    return [self showCustomMessage:message onView:nil style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message postion:(BWMHudPosition)postion {
    
    return [self showCustomMessage:message onView:nil style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message afterDelay:(NSTimeInterval)delay {
    
    return [self showCustomMessage:message onView:nil style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view {
    
    return [self showCustomMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:kGetDelayTime(message) customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style {
    
    return [self showCustomMessage:message onView:view style:style postion:kBWMHudPostion afterDelay:kGetDelayTime(message) customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view postion:(BWMHudPosition)postion {
    
    return [self showCustomMessage:message onView:view style:kBWMHudStyle postion:postion afterDelay:kGetDelayTime(message) customView:customView];
}

+ (MBProgressHUD *)showCustomView:(UIView *)customView message:(NSString *)message onView:(UIView *)view afterDelay:(NSTimeInterval)delay {
    
    return [self showCustomMessage:message onView:view style:kBWMHudStyle postion:kBWMHudPostion afterDelay:delay customView:customView];
}

+ (MBProgressHUD *)showCustomMessage:(NSString *)message onView:(UIView *)view style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay customView:(UIView *)customView {
    
    return [self createHudOnView:view showMessage:message style:style postion:postion afterDelay:delay mode:MBProgressHUDModeCustomView customView:customView];
}

#pragma mark -------- 隐藏HUD --------
+ (BOOL)hideHUD {
    
    BOOL res1 = [self hideHUDForView:[self getKeyWindow]];
    BOOL res2 = [self hideHUDForView:[self getCurrentViewController].view];
    return res1 || res2;
}

+ (BOOL)hideHUDForView:(UIView *)view {
    
    return [MBProgressHUD hideHUDForView:view animated:YES];
}

#pragma mark -------- 统一创建 --------
/// 统一创建提示框对象
+ (MBProgressHUD *)createHudOnView:(UIView  *)view showMessage:(NSString *)message style:(BWMHudStyle)style postion:(BWMHudPosition)postion afterDelay:(NSTimeInterval)delay mode:(MBProgressHUDMode)mode customView:(UIView *)customView {
    
    [self hideHUD];
    
    if (view == nil) {
        view = [self getKeyWindow];
    }
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.backgroundView.color = [UIColor clearColor];
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.removeFromSuperViewOnHide = YES;
    hud.mode = mode;
    
    hud.label.numberOfLines = 0;
    hud.label.font = [UIFont systemFontOfSize:kHudFontSize];
    hud.label.text = message;
    
    switch (style) {
        case BWMHudStyleBlack:
            hud.bezelView.color = [UIColor colorWithRed:25/255.0 green:25/255.0 blue:25/255.0 alpha:1.0];
            hud.contentColor = [UIColor whiteColor];
            break;
        case BWMHudStyleCustom:
            hud.bezelView.color = [BWMHUD share].config.customBackgrandColor;
            hud.contentColor = [BWMHUD share].config.customContentColor;
            break;
        default:
            hud.bezelView.color = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
            hud.contentColor = [UIColor blackColor];
            break;
    }
    
    switch (postion) {
        case BWMHudPositionTop:
//            hud.offset = CGPointMake(0, -MBProgressMaxOffset);
            hud.offset = CGPointMake(0, -[self getMaxOffectWithView:view]);
            break;
        case BWMHudPositionBottom:
//            hud.offset = CGPointMake(0, MBProgressMaxOffset);
            hud.offset = CGPointMake(0, [self getMaxOffectWithView:view]);
            break;
        default:
            hud.offset = CGPointMake(0, 0);
            break;
    }
    
    if (customView) {
        hud.customView = customView;
    }
    
    if (delay > 0) {
        [hud hideAnimated:YES afterDelay:delay];
    }
    
    return hud;
}

/// 获取当前 keyWindow
+ (UIWindow *)getKeyWindow {
    
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

/// 获取当前 ViewController
+ (UIViewController *)getCurrentViewController {
    
    UIViewController *curVC = [self getKeyWindow].rootViewController;
    
    while (1) {
        
        if (curVC.presentedViewController) {
            
            curVC = curVC.presentedViewController;
        } else if ([curVC isKindOfClass:[UITabBarController class]]) {
            
            curVC = ((UITabBarController *)curVC).selectedViewController;
        } else if ([curVC isKindOfClass:[UINavigationController class]]) {
            
            curVC = ((UINavigationController *)curVC).visibleViewController;
        } else {
            break;
        }
    }
    
    return curVC;
}

/// 获取偏移量
+ (CGFloat)getMaxOffectWithView:(UIView *)view {
    
    CGFloat offect = view.bounds.size.height / 2.5;
    
    UIWindow *window = [self getKeyWindow];
    if ([view isEqual:window]) {
        
        if (@available(iOS 11.0, *)) {
            
            offect = (window.bounds.size.height - window.safeAreaInsets.top - window.safeAreaInsets.bottom) / 2.5;
        }
    } else {
        
        if (view.bounds.size.height == 0) {
            offect = window.bounds.size.height / 2.5;
        }
    }
    
    return offect;
}

/// 获取时长
+ (CGFloat)getDelayTime:(NSString *)msg {
    
    CGFloat time = delayTime;
    if ([BWMHUD share].config.autoTime) {
        CGFloat new = msg.length * 0.06 + 0.5;
        if (new > time) {
            time = new;
        }
    }
    return time;
}

@end
