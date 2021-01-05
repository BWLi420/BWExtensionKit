//
//  UIImage+BWExtension.m
//  BWExtensionKit
//
//  Created by BowenLi on 2020/8/17.
//

#import "UIImage+BWExtension.h"
#import <Photos/Photos.h>

@implementation UIImage (BWExtension)

+ (UIImage *)bw_imageWithColor:(UIColor *)color {
    
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (instancetype)bw_imageWithOriginalName:(NSString *)name {
    
    UIImage *img = [UIImage imageNamed:name];
    [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return img;
}

- (UIColor *)bw_pixelColorAtLocation:(CGPoint)point {
    
    UIColor *color = nil;
    CGImageRef inImage = self.CGImage;
    CGContextRef contexRef = [self ARGBBitmapContextFromImage:inImage];
    if (contexRef == NULL) return nil;
    
    size_t w = CGImageGetWidth(inImage);
    size_t h = CGImageGetHeight(inImage);
    CGRect rect = {{0,0},{w,h}};
    
    // Draw the image to the bitmap context. Once we draw, the memory
    // allocated for the context for rendering will then contain the
    // raw image data in the specified color space.
    CGContextDrawImage(contexRef, rect, inImage);
    
    // Now we can get a pointer to the image data associated with the bitmap
    // context.
    unsigned char* data = CGBitmapContextGetData (contexRef);
    if (data != NULL) {
        //offset locates the pixel in the data from x,y.
        //4 for 4 bytes of data per pixel, w is width of one row of data.
        int offset = 4*((w*round(point.y))+round(point.x));
        int alpha =  data[offset];
        int red = data[offset+1];
        int green = data[offset+2];
        int blue = data[offset+3];
        //        NSLog(@"offset: %i colors: RGB A %i %i %i  %i",offset,red,green,blue,alpha);
        color = [UIColor colorWithRed:(red/255.0f) green:(green/255.0f) blue:(blue/255.0f) alpha:(alpha/255.0f)];
    }
    
    // When finished, release the context
    CGContextRelease(contexRef);
    // Free image data memory for the context
    if (data) { free(data); }
    
    return color;
}

- (CGContextRef)ARGBBitmapContextFromImage:(CGImageRef) inImage {
    
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    NSInteger             bitmapByteCount;
    NSInteger             bitmapBytesPerRow;
    
    // Get image width, height. We'll use the entire image.
    size_t pixelsWide = CGImageGetWidth(inImage);
    size_t pixelsHigh = CGImageGetHeight(inImage);
    
    // Declare the number of bytes per row. Each pixel in the bitmap in this
    // example is represented by 4 bytes; 8 bits each of red, green, blue, and
    // alpha.
    bitmapBytesPerRow   = (pixelsWide * 4);
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    // Use the generic RGB color space.
    //colorSpace = CGColorSpaceCreateWithName(kCGColorSpaceGenericRGB);  //deprecated
    colorSpace = CGColorSpaceCreateDeviceRGB();
    if (colorSpace == NULL)
    {
        fprintf(stderr, "Error allocating color space\n");
        return NULL;
    }
    
    // Allocate memory for image data. This is the destination in memory
    // where any drawing to the bitmap context will be rendered.
    bitmapData = malloc( bitmapByteCount );
    if (bitmapData == NULL)
    {
        fprintf (stderr, "Memory not allocated!");
        CGColorSpaceRelease( colorSpace );
        return NULL;
    }
    
    // Create the bitmap context. We want pre-multiplied ARGB, 8-bits
    // per component. Regardless of what the source image format is
    // (CMYK, Grayscale, and so on) it will be converted over to the format
    // specified here by CGBitmapContextCreate.
    context = CGBitmapContextCreate (bitmapData,
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    if (context == NULL)
    {
        free (bitmapData);
        fprintf (stderr, "Context not created!");
    }
    
    // Make sure and release colorspace before returning
    CGColorSpaceRelease( colorSpace );
    
    return context;
}

- (void)saveToAlbum:(NSString *)album complation:(void (^)(BOOL, NSError * _Nullable))complationHandler {
    
    if (album == nil) {
        if (complationHandler) {
            complationHandler(NO, [NSError errorWithDomain:NSNetServicesErrorDomain code:404 userInfo:@{NSLocalizedDescriptionKey: @"自定义相册名称不能为空"}]);
        }
    }
    
    if (@available(iOS 14, *)) {
        
        if ([PHPhotoLibrary authorizationStatusForAccessLevel:PHAccessLevelAddOnly] == PHAuthorizationStatusNotDetermined) {
            
            [PHPhotoLibrary requestAuthorizationForAccessLevel:PHAccessLevelAddOnly handler:^(PHAuthorizationStatus status) {
                
                if (status == PHAuthorizationStatusAuthorized
                    || status == PHAuthorizationStatusLimited) {
                    
                    [self saveImageToAlbum:album complation:complationHandler];
                } else {
                    
                    if (complationHandler) {
                        complationHandler(NO, [NSError errorWithDomain:NSNetServicesErrorDomain code:404 userInfo:@{NSLocalizedDescriptionKey: @"用户拒绝访问相册"}]);
                    }
                }
            }];
        } else {
            
            [self saveImageToAlbum:album complation:complationHandler];
        }
    } else {
        
        if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusNotDetermined) {
            
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                
                if (status == PHAuthorizationStatusAuthorized) {
                    
                    [self saveImageToAlbum:album complation:complationHandler];
                } else {
                    
                    if (complationHandler) {
                        complationHandler(NO, [NSError errorWithDomain:NSNetServicesErrorDomain code:404 userInfo:@{NSLocalizedDescriptionKey: @"用户拒绝访问相册"}]);
                    }
                }
            }];
        } else {
            
            [self saveImageToAlbum:album complation:complationHandler];
        }
    }
}

- (void)saveImageToAlbum:(NSString *)album complation:(void (^)(BOOL, NSError * _Nullable))complationHandler {
    
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        
        //判断之前是否有相同的相册
        PHAssetCollection *oldCollection = [self fetchAssetColletion:album];
        
        PHAssetCollectionChangeRequest *assetCollection = nil;
        if (oldCollection) {
            assetCollection = [PHAssetCollectionChangeRequest changeRequestForAssetCollection:oldCollection];
        }else {
            //创建自定义相册
            assetCollection = [PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:album];
        }
        
        //保存图片到系统相册
        PHAssetChangeRequest *assetChange = [PHAssetChangeRequest creationRequestForAssetFromImage:self];
        //将保存的图片添加到自定义相册
        PHObjectPlaceholder *placeholder = [assetChange placeholderForCreatedAsset];
        [assetCollection addAssets:@[placeholder]];
        
    } completionHandler:complationHandler];
}

/// 查找相册
- (PHAssetCollection *)fetchAssetColletion:(NSString *)albumTitle {
    
    PHFetchResult *fetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    
    for (PHAssetCollection *assetCollection in fetchResult) {
        if ([assetCollection.localizedTitle isEqualToString:albumTitle]) {
            return assetCollection;
        }
    }
    return nil;
}

- (UIImage *)bw_compressFromLuban {
    
    if (self == nil) {
#ifdef DEBUG
        NSLog(@"压缩图片不能为空");
#endif
        return nil;
    }
    
    CGFloat w = self.size.width;
    CGFloat h = self.size.height;
    NSData *rawData = UIImageJPEGRepresentation(self, 1);
    CGFloat rawKB = rawData.length / 1024.0;
    
#ifdef DEBUG
    NSLog(@"图片压缩之前 == %f KB", rawKB);
#endif
    
    BOOL vertical = w < h;
    CGFloat scale = vertical ? (w / h) : (h / w);
    CGFloat newSize = 0;
    
    CGFloat thumbW = w;
    CGFloat thumbH = h;
    CGFloat maxLong = vertical ? h : w;
    
    if (scale > 0.5625) { // 16:9 ~ 1:1
        
        if (maxLong < 1664) {
            
            if (rawKB < 60) {
                return [UIImage imageWithData:rawData];
            }
            
            newSize = w * h / pow(1664, 2) * 150;
            newSize = newSize < 60 ? 60 : newSize;
        } else if (maxLong < 4990) {
            
            if (rawKB < 60) {
                return [UIImage imageWithData:rawData];
            }
            
            thumbW /= 2;
            thumbH /= 2;
            newSize = thumbW * thumbH / pow(4990, 2) * 300;
            newSize = newSize < 60 ? 60 : newSize;
        } else {
            
            if (rawKB < 100) {
                return [UIImage imageWithData:rawData];
            }
        
            CGFloat multiple = (int)h / 1280;
            thumbW /= multiple;
            thumbH /= multiple;
            newSize = thumbW * thumbH / pow(1280 * multiple, 2) * 300;
            newSize = newSize < 100 ? 100 : newSize;
        }
    } else if (scale > 0.5) { // 2:1 ~ 16:9
        
        if (rawKB < 100) {
            return [UIImage imageWithData:rawData];
        }
        
        CGFloat multiple = h < 1280 ? 1 : (int)h / 1280;
        thumbW /= multiple;
        thumbH /= multiple;
        newSize = (thumbW * thumbH) / (1440 * 2560)  * 200;
        newSize = newSize < 100 ? 100 : newSize;
    } else { // <= 2:1
        
        if (rawKB < 100) {
            return [UIImage imageWithData:rawData];
        }
        
        CGFloat multiple = h < 1280 ? 1 : (int)h / 1280;
        thumbW /= multiple;
        thumbH /= multiple;
        newSize = (thumbW * thumbH) / (1280 * (1280 / scale)) * 500;
        newSize = newSize < 100 ? 100 : newSize;
    }
    
    return [self resizeToWidth:thumbW height:thumbH targetSize:newSize];
}

- (UIImage *)resizeToWidth:(CGFloat)width height:(CGFloat)height targetSize:(CGFloat)target {
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [self drawInRect:CGRectMake(0, 0, width, height)];
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [newImg compressToTarget:target];
}

- (UIImage *)compressToTarget:(CGFloat)target {
    
    UIImage *thumbImage = [self fixOrientation];
    
    CGFloat qualityCompress = 0.1;
    NSData *imageData = UIImageJPEGRepresentation(thumbImage, qualityCompress);
    CGFloat kb = imageData.length / 1024.0;
    
    while (kb > target && qualityCompress <= 0.8) {
        qualityCompress += 0.1;

        imageData = UIImageJPEGRepresentation(thumbImage, qualityCompress);
        kb = imageData.length / 1024.0;
        thumbImage = [UIImage imageWithData:imageData];
    }
    
#ifdef DEBUG
    NSLog(@"图片压缩之后 == %f KB", kb);
    // Debug下临时存放
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"temp.jpg"];
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:imageData attributes:nil];
#endif
    
    return thumbImage;
}

- (UIImage *)fixOrientation {
    
    if (self.imageOrientation == UIImageOrientationUp) {
        return self;
    }
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
            
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        default:
            break;
    }
    
    switch (self.imageOrientation) {
            
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        default:
            break;
    }
    
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    
    switch (self.imageOrientation) {
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            
            CGContextDrawImage(ctx, CGRectMake(0, 0, self.size.height, self.size.width), self.CGImage);
            break;
        default:
            CGContextDrawImage(ctx, CGRectMake(0, 0, self.size.width, self.size.height), self.CGImage);
            break;
    }
    
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *fixImg = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    
    return fixImg;
}

@end
