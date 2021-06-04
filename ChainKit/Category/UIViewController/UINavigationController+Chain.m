//
//  UINavigationController+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UINavigationController+Chain.h"

@implementation UINavigationController (Chain)

+ (CNCInitRootVCHandleCallback)cnc_initWithRootViewController {
    return ^(UIViewController * _Nonnull controller) {
        return [[self alloc] initWithRootViewController:controller];
    };
}

- (void (^)(UIViewController *, BOOL))cnc_pushViewControllerDidAnimated {
    return ^(UIViewController *vc, BOOL isAnimated) {
        if ([self isKindOfClass:[UINavigationController class]]) {
            [self pushViewController:vc animated:isAnimated];
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
