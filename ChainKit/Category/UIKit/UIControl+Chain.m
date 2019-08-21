//
//  UIControl+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIControl+Chain.h"

#import <objc/runtime.h>

@implementation UIControl (Chain)

#pragma mark ——— <Public Interface>

+ (UIControl* (^)(void))cc_control {
    return ^() {
        return [[self alloc] init];
    };
}

- (CCActionEventsHandleCallback)cc_addTargetActionEvents {
    return ^(UIControl * __nullable target, NSString * _Nonnull action, UIControlEvents controlEvents) {
        if ([self isKindOfClass:[UIControl class]] && action) {
            [self addTarget:target action:NSSelectorFromString([action copy]) forControlEvents:controlEvents];
        }
        return self;
    };
}

- (CCActionEventsHandleCallback)cc_removeTargetActionEvents {
    return ^(UIControl * __nullable target, NSString * _Nonnull action, UIControlEvents controlEvents) {
        if ([self isKindOfClass:[UIControl class]] && action) {
            [self removeTarget:target action:NSSelectorFromString([action copy]) forControlEvents:controlEvents];
        }
        return self;
    };
}

- (CCSetActionEventsCompleted)cc_setActionEventsCallback {
    return ^(UIControlEvents controlEvents, CCActionEventsCallback __nullable actionEventsCallback) {
        if (![self isKindOfClass:[UIControl class]]) return;
        
        objc_setAssociatedObject(self, @selector(cc_setActionEventsCallback), actionEventsCallback, OBJC_ASSOCIATION_COPY);
        
        if (actionEventsCallback) {
//            [self cc_removeTargetActionForControlEvents:[self cc_previousEvents]];
            [self cc_addTargetActionForControlEvents:controlEvents];
            [self cc_setPreviousEvents:controlEvents];
        } else {
//            [self cc_removeTargetActionForControlEvents:[self cc_previousEvents]];
        }
    };
}

- (UIControl* (^)(BOOL))cc_enabled {
    return ^(BOOL enabled) {
        self.enabled = enabled;
        return self;
    };
}

- (UIControl* (^)(BOOL))cc_selected {
    return ^(BOOL selected) {
        self.selected = selected;
        return self;
    };
}

#pragma mark ——— <Private Interface>

- (void)cc_addTargetActionForControlEvents:(UIControlEvents)controlEvents {
    if (controlEvents == 0) return;
    [self addTarget:self action:@selector(cc_controlEventsAction:) forControlEvents:controlEvents];
}

- (void)cc_removeTargetActionForControlEvents:(UIControlEvents)controlEvents {
    if (controlEvents == 0) return;
    [self removeTarget:self action:@selector(cc_controlEventsAction:) forControlEvents:controlEvents];
}

- (void)cc_controlEventsAction:(UIControl *)control {
    if (![self isKindOfClass:[UIControl class]]) return;
    CCActionEventsCallback actionEventsCallback = objc_getAssociatedObject(self, @selector(cc_setActionEventsCallback));
    !actionEventsCallback ?: actionEventsCallback(control);
    
//    NSLog(@"\n actionEventsCallback == %p \n @selector(cc_setActionEventsCallback) == %p \n",\
//          &actionEventsCallback, @selector(cc_setActionEventsCallback));
}

- (UIControlEvents)cc_previousEvents {
    NSNumber *previousEventsNumber = objc_getAssociatedObject(self, @selector(cc_previousEvents));
    return previousEventsNumber.unsignedIntegerValue;
}

- (void)cc_setPreviousEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, @selector(cc_previousEvents), @(controlEvents), OBJC_ASSOCIATION_ASSIGN);
}

@end
