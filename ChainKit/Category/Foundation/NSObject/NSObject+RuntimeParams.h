//
//  NSObject+RuntimeParams.h
//  Route-Demo
//
//  Created by Fm on 20/3/29.
//  Copyright © 2020年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (RuntimeParams)

- (instancetype _Nonnull)initWithParams:(NSDictionary * _Nullable)params;

- (NSDictionary * _Nullable)params;

- (void)setParams:(NSDictionary * _Nullable)params;

@end
