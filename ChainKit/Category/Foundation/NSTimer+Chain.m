//
//  NSTimer+Chain.m
//  Chain-Master
//
//  Created by admin 2019/4/5.
//  Copyright © 2019 apple. All rights reserved.
//

#import "NSTimer+Chain.h"
//#import "YYWeakProxy.h" // test

@implementation NSTimer (Chain)

+ (CTSetTimerActionCallback)ct_timerWithTimeIntervalRepeatsCallback {
    return self.ct_initTimerForIsScheduled(NO);
}

+ (CTSetTimerActionCallback)ct_scheduledTimerWithTimeIntervalRepeatsCallback {
    return self.ct_initTimerForIsScheduled(YES);
}


#pragma mark ——— <Private Interface>

+ (CTSetTimerActionCallback (^)(BOOL))ct_initTimerForIsScheduled {
    return ^(BOOL isScheduled) {
        // [YYWeakProxy proxyWithTarget:self]
        SEL action = @selector(ct_timerTaskAction:);
        __block NSTimer *timer = nil;
        if (isScheduled) {
            return ^(NSTimeInterval timeInterval, BOOL repeats, CTTimerHandleCallback __nullable callback) {
                NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:timeInterval target:[self class] selector:action userInfo:[callback copy] repeats:repeats];
                timer.ct_verifyBindRunloopByTimer(timer);
                return timer;
            };
        } else {
            return ^(NSTimeInterval timeInterval, BOOL repeats, CTTimerHandleCallback __nullable callback) {
                
                timer = [NSTimer timerWithTimeInterval:timeInterval target:[self class] selector:action userInfo:[callback copy] repeats:repeats];
                timer.ct_verifyBindRunloopByTimer(timer);
                return timer;
            };
        }
    };
}

+ (void)ct_timerTaskAction:(NSTimer *)timer {
    if (!timer.userInfo) return;
    
    CTTimerHandleCallback handleCallback = (CTTimerHandleCallback)[timer.userInfo copy];
    !handleCallback ?: handleCallback(timer);
}

- (void (^)(NSTimer *))ct_verifyBindRunloopByTimer {
    return ^(NSTimer *timer) {
        if (![NSThread isMainThread]) { // 是子线程
            [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
            [[NSRunLoop currentRunLoop] run];
        } else { // 是UI主线程
            [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        }
    };
}

@end
