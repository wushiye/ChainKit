//
//  NSString+TimeConvert.h
//  wushiye
//
//  Created by wushiye on 2019/11/18.
//  Copyright © 2019 Seven trees. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TimeConvert)

/** NSData -> NSString */
+ (NSString * __nullable (^)(NSData *))cs_stringWithData;


/**
 * 毫秒转化为天小时分钟秒 (如：1天20小时50分钟30秒)
 *
 * @param ms (毫秒值)
 * @return FormatTime （如：countdownTime倒计时）
 */
+ (NSString *)convertFormatTimeByMsec:(long)ms;

@end

NS_ASSUME_NONNULL_END
