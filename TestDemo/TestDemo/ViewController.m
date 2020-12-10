//
//  ViewController.m
//  TestDemo
//
//  Created by BowenLi on 2020/8/19.
//  Copyright © 2020 BWLi420. All rights reserved.
//

#import "ViewController.h"
#import <BWExtensionKit.h>

@interface CustomView : UIView
@end
@implementation CustomView

- (CGSize)intrinsicContentSize {
    return CGSizeMake(200, 300);
}
@end

@interface ViewController ()

@property (nonatomic, strong) UIView *cusView;
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
        [UIDevice bw_idfa:^(NSString * _Nullable idfa) {
            NSLog(@"idfa --- %@", idfa);
        }];
        NSLog(@"idfv --- %@", [UIDevice bw_idfv]);
    });
    
    UIView *cus = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    cus.backgroundColor = [UIColor lightGrayColor];
    self.cusView = cus;
    [self.view addSubview:cus];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [BWMHUD showMessage:@"身边的魔法师包括身边的魔法师包括"];
//    [BWMHUD showActivityWithStyle:BWMHUDStyleBlack];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        UIImageView *cus = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"图片1"]];
        cus.backgroundColor = [UIColor lightGrayColor];
        [BWMHUD showCustomView:cus];
//        [BWMHUD hideHUD];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CustomView *cus = [[CustomView alloc] init];
        cus.backgroundColor = [UIColor lightGrayColor];
        [BWMHUD showCustomView:cus message:@"身边的魔法师包括身边的魔法师" postion:BWMHUDPositionBottom];
        
//        [BWMHUD showActivityMessage:@"身边的魔法师包括身边的魔法师" onView:self.cusView style:BWMHUDStyleCustom postion:BWMHUDPositionTop];
//        [BWMHUD showMessage:@"身边的魔法师包括身边的魔法师包括身边的魔法师包括" style:BWMHUDStyleBlack];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        CustomView *cus = [[CustomView alloc] init];
        cus.backgroundColor = [UIColor lightGrayColor];
        [BWMHUD showCustomView:cus message:@"身边的魔法师包括身边的魔法师" style:BWMHUDStyleBlack];
        
//        [BWMHUD hideHUDForView:self.cusView];
//        [BWMHUD showMessage:@"身边的魔法师包括身边的魔法师包括身边的魔法师包括" style:BWMHUDStyleCustom];
    });
    
}


@end
