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
}


@end
