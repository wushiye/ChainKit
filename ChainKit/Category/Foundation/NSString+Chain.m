//
//  NSString+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/4/9.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSString+Chain.h"

@implementation NSString (Chain)

- (NSString * __nullable (^)(void))cs_encodedString {
    return ^(void) {
        NSString *encodedString = self;
        if ([self respondsToSelector:@selector(stringByAddingPercentEncodingWithAllowedCharacters:)]) {
            encodedString = [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        }
        return encodedString;
    };
}

+ (NSString * __nullable (^)(char *))cs_stringWithCString {
    return ^(char *cString) {
        return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    };
}

+ (NSString * __nullable (^)(NSData *))cs_stringWithData {
    return ^(NSData *data) {
        return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    };
}

@end
