//
//  UIView+BWExtension.m
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/17.
//

#import "UIView+BWExtension.h"
#import "NSObject+BWExtension.h"

@implementation UIView (BWExtension)

- (void)setBw_left:(CGFloat)bw_left {
    
    CGRect frame = self.frame;
    frame.origin.x = bw_left;
    self.frame = frame;
}

- (CGFloat)bw_left {
    
    return self.frame.origin.x;
}

- (void)setBw_right:(CGFloat)bw_right {
    
    CGRect frame = self.frame;
    frame.origin.x = bw_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bw_right {
    
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setBw_top:(CGFloat)bw_top {
    
    CGRect frame = self.frame;
    frame.origin.y = bw_top;
    self.frame = frame;
}

- (CGFloat)bw_top {
    
    return self.frame.origin.y;
}

- (void)setBw_bottom:(CGFloat)bw_bottom {
    
    CGRect frame = self.frame;
    frame.origin.y = bw_bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)bw_bottom {
    
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBw_width:(CGFloat)bw_width {
    
    CGRect frame = self.frame;
    frame.size.width = bw_width;
    self.frame = frame;
}

- (CGFloat)bw_width {
    
    return self.frame.size.width;
}

- (void)setBw_height:(CGFloat)bw_height {
    
    CGRect frame = self.frame;
    frame.size.height = bw_height;
    self.frame = frame;
}

- (CGFloat)bw_height {
    
    return self.frame.size.height;
}

- (void)setBw_size:(CGSize)bw_size {
    
    CGRect frame = self.frame;
    frame.size = bw_size;
    self.frame = frame;
}

- (CGSize)bw_size {
    
    return self.frame.size;
}

- (void)setBw_centerX:(CGFloat)bw_centerX {
    
    CGPoint center = self.center;
    center.x = bw_centerX;
    self.center = center;
}

- (CGFloat)bw_centerX {
    
    return self.center.x;
}

- (void)setBw_centerY:(CGFloat)bw_centerY {
    
    CGPoint center = self.center;
    center.y = bw_centerY;
    self.center = center;
}

- (CGFloat)bw_centerY {
    
    return self.center.y;
}

- (void)bw_setCornerRadius:(CGFloat)radius {
    
    if (@available(iOS 11.0, *)) {
        
        [self bw_setCornerRadius:radius roundingCorners:UIRectCornerAllCorners];
    } else {
        
        if (self.bw_width == 0 || self.bw_height == 0) {
            
            self.layer.cornerRadius = radius;
            self.layer.masksToBounds = YES;
        } else {
            
            CGRect rect = self.bounds;
            
            if ([UIImageView bw_has:self]) {
                
                UIImageView *imageView = [UIImageView bw_cast:self];
                
                UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
                CGContextRef contextRef = UIGraphicsGetCurrentContext();
                UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radius, radius)];
                CGContextAddPath(contextRef, path.CGPath);
                CGContextClip(contextRef);
                [self drawRect:rect];
                CGContextDrawPath(contextRef, kCGPathFillStroke);
                UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                imageView.image = image;
            } else {
                
                self.layer.cornerRadius = radius;
                self.layer.masksToBounds = YES;
            }
        }
    }
}

- (void)bw_setCornerRadius:(CGFloat)radius roundingCorners:(UIRectCorner)corners {
    
    if (@available(iOS 11.0, *)) {
        
//        UIRectCornerTopLeft     = 1 << 0,     1
//        UIRectCornerTopRight    = 1 << 1,     2
//        UIRectCornerBottomLeft  = 1 << 2,     4
//        UIRectCornerBottomRight = 1 << 3,     8
        
        self.layer.cornerRadius = radius;
        switch (corners) {
            case UIRectCornerAllCorners:
            case 15:
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
                break;
            case 1: // TopLeft
                self.layer.maskedCorners = kCALayerMinXMinYCorner;
                break;
            case 2: // TopRight
                self.layer.maskedCorners = kCALayerMaxXMinYCorner;
                break;
            case 4: // BottomLeft
                self.layer.maskedCorners = kCALayerMinXMaxYCorner;
                break;
            case 8: // BottomRight
                self.layer.maskedCorners = kCALayerMaxXMaxYCorner;
                break;
            case 3: // TopLeft TopRight
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
                break;
            case 5: // TopLeft BottomLeft
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner;
                break;
            case 9: // TopLeft BottomRight
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMaxYCorner;
                break;
            case 6: // TopRight BottomLeft
                self.layer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner;
                break;
            case 10: // TopRight BottomRight
                self.layer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
                break;
            case 12: // BottomLeft BottomRight
                self.layer.maskedCorners = kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
                break;
            case 7: // TopLeft TopRight BottomLeft
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner;
                break;
            case 11: // TopLeft TopRight BottomRight
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner | kCALayerMaxXMaxYCorner;
                break;
            case 13: // TopLeft BottomLeft BottomRight
                self.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
                break;
            case 14: // TopRight BottomLeft BottomRight
                self.layer.maskedCorners = kCALayerMaxXMinYCorner | kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
                break;
            default:
                break;
        }
    } else {
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *layer = [CAShapeLayer new];
        layer.frame = self.bounds;
        layer.path = path.CGPath;
        self.layer.mask = layer;
    }
}

@end
