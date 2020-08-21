//
//  UITableViewCell+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (BWExtension)

/// 加载同类名的 Nib
+ (UINib *)bw_loadNib;
@end

NS_ASSUME_NONNULL_END
