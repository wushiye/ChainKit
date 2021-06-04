//
//  NSTimer+Chain.h
//  Chain-Master
//
//  Created by admin 2019/4/5.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Chain)

typedef void (^CTTimerHandleCallback)(NSTimer *);

typedef NSTimer* _Nonnull (^CTSetTimerActionCallback)(NSTimeInterval, BOOL, CTTimerHandleCallback __nullable);


+ (CTSetTimerActionCallback)ct_timerWithTimeIntervalRepeatsCallback;

+ (CTSetTimerActionCallback)ct_scheduledTimerWithTimeIntervalRepeatsCallback;

@end

NS_ASSUME_NONNULL_END
