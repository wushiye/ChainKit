//
//  NSString+TimeConvert.m
//  wushiye
//
//  Created by wushiye on 2019/11/18.
//  Copyright © 2019 Seven trees. All rights reserved.
//

#import "NSString+TimeConvert.h"

@implementation NSString (TimeConvert)

+ (NSString * __nullable (^)(NSData *))cs_stringWithData {
    return ^(NSData *data) {
        return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    };
}

/**
 * 毫秒转化为天小时分钟秒
 *
 * @param ms (毫秒值)
 * @return countdown time （倒计时时间）
 */
+ (NSString *)convertFormatTimeByMsec:(long)ms {
    int ss = 1000;
    int mi = ss * 60;
    int hh = mi * 60;
    int dd = hh * 24;
    
    long day = ms / dd;
    long hour = (ms - day * dd) / hh;
    long minute = (ms - day * dd - hour * hh)/ mi;
//    long second = (ms - day * dd - hour * hh - minute * mi) * 1.0 / ss;
    // long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;
    if (day > 0) {
        return [NSString stringWithFormat:@"%ld%@%ld%@%ld%@", day, @"天", hour, @"小时", minute, @"分"];
    } else if (hour > 0) {
        return [NSString stringWithFormat:@"%ld%@%ld%@", hour, @"小时", minute, @"分"];
    } else if (minute > 0) {
        return [NSString stringWithFormat:@"%ld%@",minute, @"分"];
    }/* else if (second > 0) {
        return [NSString stringWithFormat:@"%ld%@", second, @"秒"];
    }*/ else {
        return [NSString stringWithFormat:@"%d%@%d%@", 0, @"小时", 0, @"分"];
    }
}

/**
 * 毫秒转化为天小时分钟秒
 *
 * @param ms (毫秒值)
 * @return countdown time （倒计时时间）
 */
/*
NSString * formatTimeMsec(long ms) {
    int ss = 1000;
    int mi = ss * 60;
    int hh = mi * 60;
    int dd = hh * 24;
    
    long day = ms / dd;
    long hour = (ms - day * dd) / hh;
    long minute = (ms - day * dd - hour * hh)/ mi;
    long second = (ms - day * dd - hour * hh - minute * mi) * 1.0 / ss;
    // long milliSecond = ms - day * dd - hour * hh - minute * mi - second * ss;
    if (day > 0) {
        return [NSString stringWithFormat:@"%ld%@%ld%@%ld%@", day, @"天", hour, @"小时", minute, @"分"];
    } else if (hour > 0) {
        return [NSString stringWithFormat:@"%ld%@%ld%@", hour, @"小时", minute, @"分"];
    } else if (minute > 0) {
        return [NSString stringWithFormat:@"%ld%@",minute, @"分"];
    } else if (second > 0) {
        return [NSString stringWithFormat:@"%ld%@", second, @"秒"];
    } else {
        return [NSString stringWithFormat:@"%d%@%d%@", 0, @"小时", 0, @"分"];
    }
}
*/
 
@end
