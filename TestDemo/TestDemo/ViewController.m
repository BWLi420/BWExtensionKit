//
//  ViewController.m
//  TestDemo
//
//  Created by BowenLi on 2020/8/19.
//  Copyright © 2020 BWLi420. All rights reserved.
//

#import "ViewController.h"
#import <BWCategoryHeader.h>
#import <BWMHUD.h>
#import <BWSHUD.h>
#import <BWLocation.h>

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
    
    BWSHudConfig *config = [BWSHudConfig defaultConfig];
    config.customBackgrandColor = [UIColor orangeColor];
    config.customContentColor = [UIColor greenColor];
    [BWSHUD share].config = config;
    
    UIImage *img2 = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fclubimg.club.vmall.com%2Fdata%2Fattachment%2Fforum%2F202007%2F17%2F232123momgketgdekbqtvl.jpg&refer=http%3A%2F%2Fclubimg.club.vmall.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1612335677&t=6789c4fe2b14f82ce19ed4a8728d03ae"]]];
    UIImage *new2 = [img2 bw_compressFromLuban];
    NSLog(@"%@", new2);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [[UIImage imageNamed:@"图片1"] saveToAlbum:@"自定义相册名" complation:^(BOOL success, NSError * _Nullable error) {
//        NSLog(@"success - %d \n error - %@", success, error);
//    }];
//
//    [[BWLocation share] startLocation:^(BWLocationResult *result, NSError *error) {
//        NSLog(@"result = %@ \n error = %@", result, error);
//    }];
//
//    [[BWLocation share] getLocationWithIP:@"119.57.32.103" result:^(BWLocationResult *result, NSError *error) {
//        NSLog(@"result = %@ \n error = %@", result, error);
//    }];
    
//    [BWMHUD showMessage:@"身边的魔法师包括身边的魔法师包括"];
//    [BWMHUD showActivityWithStyle:BWMHUDStyleBlack];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        [BWSHUD share].showActivity().afterDelayTime(2).style(BWSHudStyleBlack).position(BWSHudPositionBottom).dismissCompletion = ^{
//            NSLog(@"123");
//        };
//        [BWSHUD share].showError(@"山东黄金繁花似锦护肤开始看").dismissCompletion = ^{
//            NSLog(@"123");
//        };
//        [BWMHUD hideHUD];
//    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        CustomView *cus = [[CustomView alloc] init];
//        cus.backgroundColor = [UIColor lightGrayColor];
//        [BWMHUD showCustomView:cus message:@"身边的魔法师包括身边的魔法师" postion:BWMHUDPositionBottom];
        
//        [BWSHUD share].showActivityStatus(@"哈哈哈哈哈哈哈").afterDelayTime(2).style(BWSHudStyleCustom).dismissCompletion = ^{
//            NSLog(@"456");
//        };
        
//        [BWSHUD share].message(@"1234");
        
//        [BWMHUD showActivityMessage:@"身边的魔法师包括身边的魔法师" onView:self.cusView style:BWMHUDStyleCustom postion:BWMHUDPositionTop];
//        [BWMHUD showMessage:@"身边的魔法师包括身边的魔法师包括身边的魔法师包括" style:BWMHUDStyleBlack];
//    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(9 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        CustomView *cus = [[CustomView alloc] init];
//        cus.backgroundColor = [UIColor lightGrayColor];
//        [BWMHUD showCustomView:cus message:@"身边的魔法师包括身边的魔法师" style:BWMHUDStyleBlack];
        
//        [BWSHUD share].showSuccess(@"1234567890123").position(BWSHudPositionTop).afterDelayTime(3).dismissCompletion = ^{
//            NSLog(@"789");
//        };
        
//        [BWMHUD hideHUDForView:self.cusView];
//        [BWMHUD showMessage:@"身边的魔法师包括身边的魔法师包括身边的魔法师包括" style:BWMHUDStyleCustom];
//    });
    
}


@end
