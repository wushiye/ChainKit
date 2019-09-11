//
//  UINavigationController+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UINavigationController+Chain.h"

@implementation UINavigationController (Chain)

+ (CNCInitRootVCHandleCallback)cnc_initWithRootViewController {
    return ^(UIViewController * _Nonnull controller) {
        return [[self alloc] initWithRootViewController:controller];
    };
}

- (void (^)(UIViewController * _Nonnull, BOOL))cnc_pushViewControllerDidAnimated {
    return ^(UIViewController * _Nonnull controller, BOOL isAnimated) {
        if ([self isKindOfClass:[UINavigationController class]]) {
            [self pushViewController:controller animated:isAnimated];
        }
    };
}

- (void (^)(NSString * _Nonnull, BOOL))cnc_pushClassNameDidAnimated {
    return ^(NSString * _Nonnull aClassName, BOOL isAnimated) {
        if ([self isKindOfClass:[UINavigationController class]]) {
            UIViewController *controller = [[NSClassFromString(aClassName) alloc] init];
            [self pushViewController:controller animated:isAnimated];
        }
    };
}

- (void (^)(BOOL))cnc_popViewControllerDidAnimated {
    return ^(BOOL isAnimated) {
        if ([self isKindOfClass:[UINavigationController class]]) {
            [self popViewControllerAnimated:isAnimated];
        }
    };
}

@end
