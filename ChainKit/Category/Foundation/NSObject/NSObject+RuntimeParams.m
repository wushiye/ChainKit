//
//  NSObject+RuntimeParams.m
//  Route-Demo
//
//  Created by Fm on 20/3/29.
//  Copyright © 2020年 apple. All rights reserved.
//

#import "NSObject+RuntimeParams.h"
#import <objc/runtime.h>

#define kSetAssociatedObject(params) \
(objc_setAssociatedObject(self, c_paramsKey, params, OBJC_ASSOCIATION_COPY_NONATOMIC))

@implementation NSObject (RuntimeParams)

#pragma mark ——— params

static const void *c_paramsKey = & c_paramsKey;

- (instancetype _Nonnull)initWithParams:(NSDictionary * _Nullable)params {
    if (self = [self init]) {
        kSetAssociatedObject(params);
    }
    return self;
}

- (void)setParams:(NSDictionary * _Nullable)params {
    kSetAssociatedObject(params);
}

- (NSDictionary * _Nullable)params {
    return objc_getAssociatedObject(self, c_paramsKey);
}

@end
