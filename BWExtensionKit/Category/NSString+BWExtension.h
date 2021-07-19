//
//  NSString+BWExtension.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/9/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BWExtension)

/// 正常转换十六进制字符串
- (NSString *)bw_toHexString;
/// 十六进制字符串转换正常
- (NSString *)bw_hexToString;
/// 字符串转字典
- (NSDictionary *)bw_toDictionary;

/// URL编码
- (NSString *)bw_urlEncoded;

#pragma mark -------- MD5 --------
- (NSString *)md5_32;
- (NSString *)md5_16;
- (NSString *)hmacMD5:(NSString *)key;

#pragma mark -------- SHA --------
- (NSString *)SHA_1;
- (NSString *)SHA_224;
- (NSString *)SHA_256;
- (NSString *)SHA_384;
- (NSString *)SHA_512;

- (NSString *)hmacSHA_1:(NSString *)key;
- (NSString *)hmacSHA_224:(NSString *)key;
- (NSString *)hmacSHA_256:(NSString *)key;
- (NSString *)hmacSHA_384:(NSString *)key;
- (NSString *)hmacSHA_512:(NSString *)key;

#pragma mark -------- base64 --------
- (NSString *)base64Encrypt;
- (NSString *)base64Decrypt;

#pragma mark -------- AES、DES --------
- (NSString *)aes_128:(NSString *)key;
- (NSString *)aes_128Decrypt:(NSString *)key;

- (NSString *)aes_192:(NSString *)key;
- (NSString *)aes_192Decrypt:(NSString *)key;

- (NSString *)aes_256:(NSString *)key;
- (NSString *)aes_256Decrypt:(NSString *)key;

- (NSString *)desEncrypt:(NSString *)key;
- (NSString *)desDecrypt:(NSString *)key;

#pragma mark -------- RSA --------
- (NSString *)rsaEncryptPublicKeyPath:(NSURL *)keyPath;
- (NSString *)rsaDecryptPrivateKeyPath:(NSURL *)keyPath password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
