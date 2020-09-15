//
//  UIBarButtonItem+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/9/15.
//

#import "UIBarButtonItem+BWExtension.h"

@implementation UIBarButtonItem (BWExtension)

+ (instancetype)bw_itemWithImage:(UIImage *)image highImage:(UIImage *)highImage selectImage:(UIImage *)selectImage target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    if (highImage) {
        [button setImage:highImage forState:UIControlStateHighlighted];        
    }
    if (selectImage) {
        [button setImage:selectImage forState:UIControlStateSelected];
    }
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // button 直接添加到 barButtonItem，会导致 button 的点击范围有问题（范围扩大）
    //使用 view 包装，可以防止这个问题
    UIView *view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (instancetype)bw_itemWithTitle:(NSString *)title selectTitle:(NSString *)selectTitle target:(id)target action:(SEL)action {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    if (selectTitle) {
        [button setTitle:selectTitle forState:UIControlStateSelected];
    }
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // button 直接添加到 barButtonItem，会导致 button 的点击范围有问题（范围扩大）
    //使用 view 包装，可以防止这个问题
    UIView *view = [[UIView alloc] initWithFrame:button.bounds];
    [view addSubview:button];
    
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

@end
