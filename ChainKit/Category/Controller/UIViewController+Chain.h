//
//  UIViewController+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Chain)

+ (UIViewController* (^)(void))cvc_controller;

- (CVCModalControllerHandleCallback)cvc_presentVCAnimatedCompletion;

- (void (^)(BOOL, CVCModalHandleCompletion __nullable))cvc_dismissVCAnimatedCompletion;

- (UIViewController* (^)(NSString * __nullable))cvc_title;

- (void (^ __nullable)(BOOL))cvc_automaticallyAdjustsScrollViewInsets;

@end

NS_ASSUME_NONNULL_END
