//
//  NSString+TimestampConvert.m
//  wushiye
//
//  Created by wushiye on 2019/11/18.
//  Copyright © 2019 Seven trees. All rights reserved.
//

#import "NSString+TimestampConvert.h"

@implementation NSString (TimestampConvert)

/**
 时间戳 -> 日期时间
 
 @param timestamp 无符号整数
 @param format "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd" or "yyyy年MM月dd日 HH时mm分ss秒" or "yyyy年MM月dd日 HH:mm:ss"
 @return timeString 时间字符串
 */
+ (NSString *)convertTimeFromTimestamp:(NSString *)timestamp dateformatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
//     parsed with format "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd".
    [formatter setDateFormat:format];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp.doubleValue / 1000.0];
    NSString *timeString = [formatter stringFromDate:confromTimesp];
    return timeString;
}

/**
 日期时间 -> 时间戳

 @param formatTime "2019-11-18 11:41:59"
 @param format "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd"
 @return timestamp 时间戳
 */
+ (NSUInteger)convertTimestampFromTime:(NSString *)formatTime dateformatter:(NSString *)format {

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    // parsed with format "yyyy-MM-dd'T'HH:mm:ssZ", "yyyy-MM-dd HH:mm:ss" or "yyyy-MM-dd".
    [formatter setDateFormat:format];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    NSUInteger timeSp = (NSUInteger)[date timeIntervalSince1970];
    return timeSp;
}


@end
