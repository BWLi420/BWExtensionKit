//
//  ViewController.m
//  TestDemo
//
//  Created by BowenLi on 2020/8/19.
//  Copyright © 2020 BWLi420. All rights reserved.
//

#import "ViewController.h"
#import <BWExtensionKit/BWExtensionKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn1 = [UIButton bw_setTitle:@"哈哈哈哈" image:@"图片1"];
    [btn1 bw_setImagePosition:BWImagePositionTop spacing:0];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn1.frame = CGRectMake(100, 50, 100, 25);
    [self.view addSubview:btn1];
    
    [btn1 bw_actionBlock:^(UIButton * _Nonnull btn) {
        NSLog(@"%@", btn);
    }];
    
    NSLog(@"uuid --- %@", [UIDevice bw_uuid]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"uuid --- %@", [UIDevice bw_uuid]);
        NSLog(@"idfa --- %@", [UIDevice bw_idfa]);
        NSLog(@"idfv --- %@", [UIDevice bw_idfv]);
    });
    
    
    
}


@end
