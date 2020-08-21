//
//  UINavigationController+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/21.
//

#import "UINavigationController+BWExtension.h"

@implementation UINavigationController (BWExtension)

- (UIViewController *)bw_findViewController:(NSString *)className {
    
    for (UIViewController *viewController in self.viewControllers) {
        if ([viewController isKindOfClass:NSClassFromString(className)]) {
            return viewController;
        }
    }
    
    return nil;
}

- (void)bw_popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated {
    
    [self popToViewController:[self bw_findViewController:className] animated:animated];
}

- (NSArray *)bw_popToViewControllerWithLevel:(NSInteger)level animated:(BOOL)animated {
    
    NSInteger count = self.viewControllers.count;
    if (count > level) {
        
        NSInteger idx = count - level - 1;
        UIViewController *viewController = self.viewControllers[idx];
        return [self popToViewController:viewController animated:animated];
    } else {
        
        return [self popToRootViewControllerAnimated:animated];
    }
}

@end
