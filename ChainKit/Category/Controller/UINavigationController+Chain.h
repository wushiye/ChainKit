//
//  UINavigationController+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Chain)

typedef UINavigationController* _Nonnull (^CNCInitRootVCHandleCallback)(UIViewController * _Nonnull);

+ (CNCInitRootVCHandleCallback)cnc_initWithRootViewController;

- (void (^)(UIViewController * _Nonnull, BOOL))cnc_pushViewControllerDidAnimated;

- (void (^)(NSString * _Nonnull, BOOL))cnc_pushClassNameDidAnimated;

- (void (^)(BOOL))cnc_popViewControllerDidAnimated;

@end

NS_ASSUME_NONNULL_END
