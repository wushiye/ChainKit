//
//  NSString+TimestampConvert.h
//  wushiye
//
//  Created by wushiye on 2019/11/18.
//  Copyright © 2019 Seven trees. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TimestampConvert)

/**
 时间戳 -> 日期时间
 
 @param timestamp 无符号整数
 @param format "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd"
 @return timeString 时间字符串
 */
+ (NSString *)convertTimeFromTimestamp:(NSString *)timestamp dateformatter:(NSString *)format;

/**
 日期时间 -> 时间戳
 
 @param formatTime "2019-11-18 11:41:59"
 @param format "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd"
 @return timestamp 时间戳
 */
+ (NSUInteger)convertTimestampFromTime:(NSString *)formatTime dateformatter:(NSString *)format;

@end
