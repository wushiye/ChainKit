//
//  NSString+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/4/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Chain)

/** 对包含中文String做UTF8编码 */
- (NSString * __nullable (^)(void))cs_encodedString;

/** CString -> NSString */
+ (NSString * __nullable (^)(char *))cs_stringWithCString;

/** NSData -> NSString */
+ (NSString * __nullable (^)(NSData *))cs_stringWithData;

@end

NS_ASSUME_NONNULL_END
