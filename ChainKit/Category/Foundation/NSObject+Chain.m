//
//  NSObject+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSObject+Chain.h"
#import <objc/runtime.h>

@implementation NSObject (Chain)

- (COMethodSignatureHandleCallback)co_performSelectorByArguments {
    
    return ^(SEL selector, NSArray * __nullable arguments) {
        if (!selector) {
//            DLog(@"Runtime生成方法签名失败错误：selector(nil)空了，动态添加的方法签名前对应的消息找不到 %@", NSStringFromSelector(selector));
            return ;
        }
        // 方法签名(方法的描述)
        NSMethodSignature *signature = [[self class] instanceMethodSignatureForSelector:selector];
        if (!signature) {
//          @throw [NSException exceptionWithName:@"Runtime错误: 动态添加的方法签名(nil)空了" reason:@"对应方法signature找不到" userInfo:nil];
//          [NSException raise:@"Runtime错误：动态添加的方法签名(nil)空了，对应的消息找不到" format:@"[%@]", NSStringFromSelector(selector)];
//            DLog(@"Runtime生成方法签名失败错误：动态添加的方法签名(nil)空了，对应的消息找不到 %@", NSStringFromSelector(selector));
            return ;
        }
        
        /// NSInvocation : 利用一个NSInvocation对象包装一次方法调用（方法调用者、方法名、方法参数、方法返回值）
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        invocation.target = self;
        invocation.selector = selector;
        
        NSInteger argumentCount = signature.numberOfArguments - 2; // 减去self、_cmd以外的参数个数
        /// 设置方法参数
        if (argumentCount) {
            for (NSInteger i = 0; i < argumentCount; i++) {
                id argument = arguments[i];
                [invocation setArgument:&argument atIndex:i + 2];
            }
        }
        // 调用方法
        [invocation invoke];
        
//        id returnValue = nil; // 方法返回值
//        /// 获取返回值 (异常)
//        if (signature.methodReturnLength) [invocation getReturnValue:&returnValue];
//        return returnValue;
        
        // NSInvocation基本使用
        // https://blog.csdn.net/yhawaii/article/details/8306637
        // https://blog.csdn.net/SSIrreplaceable/article/details/53375972
        
        return;
    };
}

- (COJudgeClassKindCallback)co_isKindOfClass {
    return ^(Class __nullable class) {
        if ([self isKindOfClass:class]) return YES;
        return NO;
    };
}

- (COIsKindOfClassHandleCallback)co_isKindOfClassName {
    return ^(NSString * __nullable aClassName) {
        if ([self isKindOfClass:NSClassFromString(aClassName)]) {
            return YES;
        }
        return NO;
    };
}

+ (COClassNameBlock)co_className {
    return ^() {
        return NSStringFromClass(self);
    };
}

- (COClassNameBlock)co_className {
    return ^() {
        return [NSString stringWithUTF8String:class_getName([self class])];
    };
}

@end
