# BWExtensionKit

[![CI Status](https://img.shields.io/travis/BWLi420/BWExtensionKit.svg?style=flat)](https://travis-ci.org/BWLi420/BWExtensionKit)
[![Version](https://img.shields.io/cocoapods/v/BWExtensionKit.svg?style=flat)](https://cocoapods.org/pods/BWExtensionKit)
[![License](https://img.shields.io/cocoapods/l/BWExtensionKit.svg?style=flat)](https://cocoapods.org/pods/BWExtensionKit)
[![Platform](https://img.shields.io/cocoapods/p/BWExtensionKit.svg?style=flat)](https://cocoapods.org/pods/BWExtensionKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

> 若找不到最新版，执行 **pod repo update** 更新索引

- 需要 Category

    ```ruby
    pod 'BWExtensionKit/Category'
    ```

- 需要 MBProgressHUD 封装

    ```ruby
    pod 'BWExtensionKit/MHud'
    ```

    - 支持全局配置及自定义样式，详情参考 BWMHudConfig 配置

    - 支持更改显示位置、字体大小

    - 支持根据显示内容自适应显示时长

    - 支持自定义延迟移除及回调

    - 方法示例，更多请查看 BWMHUD 中的类方法

        ```objective-c
        [BWMHUD showActivity]; // 常显弹框
        [BWMHUD showActivityMessage:@"常显文本"];
        [BWMHUD showMessage:@"普通文本"];
        
        [BWMHUD showInfoMessage:@"提示"];
        [BWMHUD showWarnMessage:@"警告"];
        [BWMHUD showSuccessMessage:@"成功"];
        [BWMHUD showErrorMessage:@"错误"];
        
        // 自定义视图，需重写 intrinsicContentSize 方法返回正确的 Size
        [BWMHUD showCustomView:[UIView new]];
        ```

- 需要 SVPregrossHUD 封装

    ```ruby
    pod 'BWExtensionKit/SHud'
    ```

    - 支持全局配置及自定义样式，详情参考 BWSHudConfig配置

    - 支持更改显示位置、字体大小

    - 支持根据显示内容自适应显示时长

    - 支持自定义延迟移除及回调

    - 使用链式语法

    - 方法示例，更多请查看 BWSHUD 中的属性

        ```objective-c
          [BWSHUD share].showInfo(@"文本")
          .position(BWSHudPositionBottom)
          .afterDelayTime(3)
          .dismissCompletion = ^{
            NSLog(@"123");
          };
        ```

        

## Author

@[BWLi420](https://github.com/BWLi420)

## License

BWExtensionKit is available under the MIT license. See the LICENSE file for more info.
