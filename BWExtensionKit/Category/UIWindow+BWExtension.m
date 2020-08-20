//
//  UIWindow+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/20.
//

#import "UIWindow+BWExtension.h"

@implementation UIWindow (BWExtension)

- (UIViewController *)bw_currentViewController {
    
    UIViewController *curVC = self.rootViewController;
    
    while (1) {
        
        if (curVC.presentedViewController) {
            
            curVC = curVC.presentedViewController;
        } else if ([curVC isKindOfClass:[UITabBarController class]]) {
            
            curVC = ((UITabBarController*)curVC).selectedViewController;
        } else if ([curVC isKindOfClass:[UINavigationController class]]) {
            
            curVC = ((UINavigationController*)curVC).visibleViewController;
        } else {
            break;
        }
    }
    
    return curVC;
}
@end
