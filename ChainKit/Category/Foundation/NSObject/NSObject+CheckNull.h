//
//  NSObject+CheckNull.h
//  Chain-Master
//
//  Created by admin 2019/4/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CheckNull)

/**
 检测对象是否为nil或NSNull，若是则返回替补对象
 e.g.
 NSObject *object = [NSObject objectCheckNull:obj replaceObject:@""];
 
 @param obj 可为nil / null
 @param beObj 不为nil / null
 */
+ (id)objectCheckNull:(id __nullable)obj replaceObject:(id _Nonnull)beObj;

@end

NS_ASSUME_NONNULL_END
