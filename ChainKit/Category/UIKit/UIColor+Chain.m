//
//  UIColor+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/28.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIColor+Chain.h"

@implementation UIColor (Chain)

+ (CColorRGBAHandleCallback)cc_colorByRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        return [self colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
    };
}

+ (CCHexColorHandleCallback)cc_colorByHexString {
    return ^(NSString * __nullable hexString) {
        NSCharacterSet *cSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *newStr = [hexString stringByTrimmingCharactersInSet:cSet];
        if ([newStr hasPrefix:@"#"] && newStr.length > 1) {
            newStr = [newStr substringFromIndex:1];
        }
        if ([newStr length] != 6) return [self blackColor];
        
        NSRange range;
        range.location = 0;
        range.length = 2;
        NSString *rString = [newStr substringWithRange:range];
        range.location = 2;
        NSString *gString = [newStr substringWithRange:range];
        range.location = 4;
        NSString *bString = [newStr substringWithRange:range];
        // Scan values
        unsigned int red, green, blue;
        [[NSScanner scannerWithString:rString] scanHexInt:&red];
        [[NSScanner scannerWithString:gString] scanHexInt:&green];
        [[NSScanner scannerWithString:bString] scanHexInt:&blue];
        UIColor *color = [self colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
        
        return color;
    };
}

@end
