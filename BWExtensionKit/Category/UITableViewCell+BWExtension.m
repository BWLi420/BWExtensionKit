//
//  UITableViewCell+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/21.
//

#import "UITableViewCell+BWExtension.h"

@implementation UITableViewCell (BWExtension)

+ (UINib *)bw_loadNib {
    
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}

@end
