//
//  NSObject+CheckNull.m
//  Chain-Master
//
//  Created by FMMac on 2019/4/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSObject+CheckNull.h"

@implementation NSObject (CheckNull)

+ (id)objectCheckNull:(id __nullable)obj replaceObject:(id _Nonnull)beObj {
    if (!beObj || [beObj isKindOfClass:[NSNull class]]) {
        [NSException raise:@"Runtime CheckNull异常：替补对象replaceObject空了，(nil)或是NSNull对象" format:@"[%@]", NSStringFromSelector(@selector(objectCheckNull:replaceObject:))];
    }
    
    if (obj == nil) return beObj;
    
    if ([obj isKindOfClass:[NSNull class]]) return beObj;
    
    if ([obj class] == [beObj class]) return obj;
    
    if ([obj isMemberOfClass:[beObj class]]) return obj;
    
    if ([obj isKindOfClass:[beObj class]]) return obj;
    
    if ([obj isKindOfClass:[beObj superclass]]) return obj;
    
    
    if ([beObj isKindOfClass:[NSString class]]) {
        if ([obj isKindOfClass:[NSString class]]) return obj;
        
    } else if ([beObj isKindOfClass:[NSArray class]]) {
        if ([obj isKindOfClass:[NSArray class]]) return obj;
        
    } else if ([beObj isKindOfClass:[NSDictionary class]]) {
        if ([obj isKindOfClass:[NSDictionary class]]) return obj;
        
    } else if ([beObj isKindOfClass:[NSSet class]]) {
        if ([obj isKindOfClass:[NSSet class]]) return obj;
        
    } else if ([beObj isKindOfClass:[NSNumber class]]) {
        if ([obj isKindOfClass:[NSNumber class]]) return obj;
        
    } else if ([beObj isKindOfClass:[NSData class]]) {
        if ([obj isKindOfClass:[NSData class]]) return obj;
        
    } else if ([beObj isKindOfClass:[NSDate class]]) {
        if ([obj isKindOfClass:[NSDate class]]) return obj;
    }  // else if () code..
    
    return obj;
}

@end
