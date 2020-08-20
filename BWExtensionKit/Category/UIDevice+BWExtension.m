//
//  UIDevice+BWExtension.m
//  BWSelfKit
//
//  Created by BowenLi on 2020/8/18.
//

#import "UIDevice+BWExtension.h"
#import <sys/utsname.h>
#import <sys/mount.h>
#import <AdSupport/AdSupport.h>
#import <Security/Security.h>
#import "UIApplication+BWExtension.h"
#import "NSObject+BWExtension.h"

@implementation UIDevice (BWExtension)

+ (NSString *)bw_deviceName {
    
    // 查询地址 https://www.theiphonewiki.com/wiki/Models
    
    static NSString *deviceVersion = nil;
    if (deviceVersion == nil) {
        NSDictionary *deviceVersionNames = @{
            @"i386":@"Simulator",
            @"x86_64":@"Simulator",
            
            @"iPhone1,1":@"iPhone 1",
            @"iPhone1,2":@"iPhone 3",
            @"iPhone2,1":@"iPhone 3S",
            @"iPhone3,1":@"iPhone 4",
            @"iPhone3,2":@"iPhone 4",
            @"iPhone4,1":@"iPhone 4S",
            @"iPhone5,1":@"iPhone 5",
            @"iPhone5,2":@"iPhone 5",
            @"iPhone5,3":@"iPhone 5C",
            @"iPhone5,4":@"iPhone 5C",
            @"iPhone6,1":@"iPhone 5S",
            @"iPhone6,2":@"iPhone 5S",
            @"iPhone7,1":@"iPhone 6Plus",
            @"iPhone7,2":@"iPhone 6",
            @"iPhone8,1":@"iPhone 6S",
            @"iPhone8,2":@"iPhone 6SPlus",
            @"iPhone8,4":@"iPhone SE",
            @"iPhone9,1":@"iPhone 7",
            @"iPhone9,2":@"iPhone 7Plus",
            @"iPhone9,3":@"iPhone 7",
            @"iPhone9,4":@"iPHone 7Plus",
            @"iPhone10,3":@"iPhone X",
            @"iPhone10,6":@"iPhone X",
            @"iPhone11,8":@"iPhone XR",
            @"iPhone11,2":@"iPhone XS",
            @"iPhone11,4":@"iPhone XS Max",
            @"iPhone11,6":@"iPhone XS Max",
            @"iPhone12,1":@"iPhone 11",
            @"iPhone12,3":@"iPhone 11 Pro",
            @"iPhone12,5":@"iPhone 11 Pro Max",
            @"iPhone12,8":@"iPhone SE 2",
            
            
            @"iPod1,1":@"iPodTouch",
            @"iPod2,1":@"iPodTouch2",
            @"iPod3,1":@"iPodTouch3",
            @"iPod4,1":@"iPodTouch4",
            @"iPod5,1":@"iPodTouch5",
            @"iPod7,1":@"iPodTouch6",
            @"iPod9,1":@"iPodTouch7",
            
            
            @"iPad1,1":@"iPad 1",
            @"iPad2,1":@"iPad 2",
            @"iPad2,2":@"iPad 2",
            @"iPad2,3":@"iPad 2",
            @"iPad2,4":@"iPad 2",
            @"iPad2,5":@"iPad Mini",
            @"iPad2,6":@"iPad Mini",
            @"iPad2,7":@"iPad Mini",
            @"iPad3,1":@"iPad 3",
            @"iPad3,2":@"iPad 3",
            @"iPad3,3":@"iPad 3",
            @"iPad3,4":@"iPad 4",
            @"iPad3,5":@"iPad 4",
            @"iPad3,6":@"iPad 4",
            @"iPad4,1":@"iPad Air",
            @"iPad4,2":@"ipad Air",
            @"iPad4,3":@"iPad Air",
            @"iPad4,4":@"iPad Mini 2",
            @"iPad4,5":@"iPad Mini 2",
            @"iPad4,6":@"iPad Mini 2",
            @"iPad4,7":@"iPad Mini 3",
            @"iPad4,8":@"iPad Mini 3",
            @"iPad4,9":@"iPad Mini 3",
            @"iPad5,1":@"iPad Mini 4",
            @"iPad5,2":@"iPad Mini 4",
            @"iPad5,3":@"iPad Air 2",
            @"iPad5,4":@"iPad Air 2",
            @"iPad6,3":@"iPad Pro 9.7",
            @"iPad6,4":@"iPad Pro 9.7",
            @"iPad6,7":@"iPad Pro 12.9",
            @"iPad6,8":@"iPad Pro 12.9",
            @"iPad6,11":@"iPad 5",
            @"iPad6,12":@"iPad 5",
            @"iPad7,1":@"iPad Pro 12.9 2",
            @"iPad7,2":@"iPad Pro 12.9 2",
            @"iPad7,3":@"iPad Pro 10.5",
            @"iPad7,4":@"iPad Pro 10.5",
            @"iPad7,5":@"iPad 6",
            @"iPad7,6":@"iPad 6",
            @"iPad7,11":@"iPad 7",
            @"iPad7,12":@"iPad 7",
            @"iPad8,1":@"iPad Pro 11",
            @"iPad8,2":@"iPad Pro 11",
            @"iPad8,3":@"iPad Pro 11",
            @"iPad8,4":@"iPad Pro 11",
            @"iPad8,5":@"iPad Pro 12.9 3",
            @"iPad8,6":@"iPad Pro 12.9 3",
            @"iPad8,7":@"iPad Pro 12.9 3",
            @"iPad8,8":@"iPad Pro 12.9 3",
            @"iPad11,1":@"iPad Mini 5",
            @"iPad11,2":@"iPad Mini 5",
            @"iPad11,3":@"iPad Air 3",
            @"iPad11,4":@"iPad Air 3"
        };
        
        NSString *deviceVersionInfo = [self bw_deviceModel];
        deviceVersion = [deviceVersionNames valueForKey:deviceVersionInfo];
        if (!deviceVersion) {
            deviceVersion = deviceVersionInfo;
        }
    }
    
    return deviceVersion;
}

+ (NSString *)bw_deviceModel {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
}

+ (NSString *)bw_systemVersion {
    
    return [[self currentDevice] systemVersion];
}

+ (BOOL)bw_bangsScreen {
    
    if (@available(iOS 11.0, *)) {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            if ([UIApplication sharedApplication].delegate.window.safeAreaInsets.bottom > 0) {
                return YES;
            }
        }
    }
    
    return NO;
}

+ (long long)bw_freeDiskSpaceBytes {
    
    struct statfs buf;
    long long freespace;
    freespace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        freespace = (long long)buf.f_bsize * buf.f_bfree;
    }
    return freespace;
}

+ (long long)bw_totalDiskSpaceBytes {
    
    struct statfs buf;
    long long totalspace;
    totalspace = 0;
    if ( statfs("/private/var", &buf) >= 0 ) {
        totalspace = (long long)buf.f_bsize * buf.f_blocks;
    }
    return totalspace;
}

+ (NSString *)bw_idfa {
    
    if ([ASIdentifierManager sharedManager].isAdvertisingTrackingEnabled) {
        
        return [ASIdentifierManager sharedManager].advertisingIdentifier.UUIDString;
    }
    // 00000000-0000-0000-0000-000000000000
    return @"";
}

+ (NSString *)bw_idfv {
    
    return [self currentDevice].identifierForVendor.UUIDString;
}

+ (NSString *)bw_uuid {
    
    NSString *service = [[UIApplication bw_bundleID] stringByAppendingString:@".bwuuid"];
    if ([[self bw_getUUID:service] bw_isEmpty]) {
        
        NSString *uuid = [NSUUID UUID].UUIDString;
        [self bw_save:service value:uuid];
        return uuid;
    } else {
        
        return [NSString bw_cast:[self bw_getUUID:service]];
    }
}

#pragma mark -------- KeyChain --------
+ (NSMutableDictionary *)bw_getKeychainQuery:(NSString *)service {
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword, (id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible, nil];
}

+ (BOOL)bw_save:(NSString *)service value:(NSString *)value {
    
    NSMutableDictionary *keychainQuery = [self bw_getKeychainQuery:service];
    
    NSData *data = [value dataUsingEncoding:NSUTF8StringEncoding];
    [keychainQuery setObject:data forKey:(id)kSecValueData];
    
    OSStatus status = SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
    if (status == errSecSuccess) {
        return YES;
    }
    
    return NO;
}

+ (id)bw_getUUID:(NSString *)service {
    
    id ret  = nil;
    NSMutableDictionary *keychainQuery = [self bw_getKeychainQuery:service];
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *) &keyData) == noErr) {
        
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *exception) {
            
            NSLog(@"Unarchive of %@ failed: %@",service,exception);
        } @finally {
            
        }
    }
    
    return ret;
}

@end
