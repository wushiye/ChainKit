//
//  NSArray+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/31.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSArray+Chain.h"

@implementation NSArray (Chain)

- (id)ca_objectCheckAtIndex:(NSUInteger)index {
    id object = nil;
    
    if (index >= self.count) return object;
    
    object = [self objectAtIndex:index];
    
    if (object == [NSNull null] || [object isKindOfClass:[NSNull class]]) return object = nil;
    
    return object;
}

@end
