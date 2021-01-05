//
//  BWNetworkManager.h
//  BWExtensionKit
//
//  Created by BowenLi on 2020/12/28.
//

#import <Foundation/Foundation.h>

/** 数据请求方式 */
typedef NS_ENUM(NSUInteger, BWNetworkMethod) {
    BWNetworkMethodGet,
    BWNetworkMethodPost,
    BWNetworkMethodPut
};

/** 数据请求格式 */
typedef NS_ENUM(NSUInteger, BWRequestSerializer) {
    BWRequestSerializerJSON,
    BWRequestSerializerHTTP
};

/** 数据返回格式 */
typedef NS_ENUM(NSUInteger, BWResponseSerializer) {
    BWResponseSerializerJSON,
    BWResponseSerializerHTTP
};

NS_ASSUME_NONNULL_BEGIN

@interface BWNetworkManager : NSObject



@end

NS_ASSUME_NONNULL_END
