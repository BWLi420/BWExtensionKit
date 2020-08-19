//
//  BWCategory.h
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#if __has_include(<BWExtensionKit/Category.h>)

//Foundation
#import <BWExtensionKit/NSObject+BWExtension.h>
#import <BWExtensionKit/NSArray+BWExtension.h>
//UIKit
#import <BWExtensionKit/UIView+BWExtension.h>
#import <BWExtensionKit/UIColor+BWExtension.h>
#import <BWExtensionKit/UIImage+BWExtension.h>
#import <BWExtensionKit/UIApplication+BWExtension.h>
#import <BWExtensionKit/UIDevice+BWExtension.h>

#else

//Foundation
#import "NSObject+BWExtension.h"
#import "NSArray+BWExtension.h"
//UIKit
#import "UIView+BWExtension.h"
#import "UIColor+BWExtension.h"
#import "UIImage+BWExtension.h"
#import "UIApplication+BWExtension.h"
#import "UIDevice+BWExtension.h"
#endif
