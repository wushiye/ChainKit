//
//  UIViewController+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIViewController+Chain.h"
#import "UIAlertController+Chain.h"

@implementation UIViewController (Chain)

+ (UIViewController* (^)(void))cvc_controller {
    return ^{
        return [[self alloc] init];
    };
}

- (CVCModalControllerHandleCallback)cvc_presentVCAnimatedCompletion {
    return ^(UIViewController *controller, BOOL isAnimated, CVCModalHandleCompletion __nullable completion) {
        self.cvc_modalViewControllerHandleCompletionForIsPresent(YES, controller, isAnimated, completion);
    };
}

- (void (^)(BOOL, CVCModalHandleCompletion __nullable))cvc_dismissVCAnimatedCompletion {
    return ^(BOOL isAnimated, CVCModalHandleCompletion __nullable completion) {
        self.cvc_modalViewControllerHandleCompletionForIsPresent(NO, nil, isAnimated, completion);
    };
}

- (void (^)(BOOL, UIViewController *, BOOL, CVCModalHandleCompletion __nullable))cvc_modalViewControllerHandleCompletionForIsPresent {
    return ^(BOOL isPresent, UIViewController *controller, BOOL isAnimated, CVCModalHandleCompletion __nullable completion) {
        if ([self isKindOfClass:[UIViewController class]]) {
            if (isPresent) {
                [self presentViewController:controller animated:isAnimated completion:completion];
            } else {
                [self dismissViewControllerAnimated:isAnimated completion:completion];
            }
        }
    };
}

- (UIViewController* (^)(NSString * __nullable))cvc_title {
    return ^(NSString * __nullable title) {
        self.title = title;
        return self;
    };
}

- (void (^ __nullable)(BOOL))cvc_automaticallyAdjustsScrollViewInsets {
    if (![self isKindOfClass:[UIViewController class]]) return nil;
    
    return ^(BOOL isAdjusts) {
        if ([self isKindOfClass:[UIViewController class]]) {
            self.automaticallyAdjustsScrollViewInsets = isAdjusts;
        }
    };
}

#pragma mark - UIAlertController

- (CVCAlertConfrimHandler)cvc_showAlertControllerByTitleDescrConfirmCompleted {
    return ^ (NSString * __nullable title, NSString * __nullable descr, NSString * __nullable confirmTitle, CHandleCallback __nullable confirmCallback) {
        UIAlertController *alertController = UIAlertController.cac_alertControllerWithTitleDescrCancelConfirmCompleted(title, descr, nil, confirmTitle, confirmCallback);
        self.cvc_presentVCAnimatedCompletion(alertController, YES, nil);
    };
}

- (CVCAlertTitleSheetItemsActionHandler)cvc_showSheetControllerByTitleNamesCompleted {
    return ^ (NSString * __nullable title, NSArray<NSString *> * _Nonnull itemNames, CACSelectedSheetHandler __nullable selectedHandler) {
        UIAlertController *alertController = UIAlertController.cac_alertControllerWithTitleSheetNamesSelectedCompleted(title, itemNames, selectedHandler);
        self.cvc_presentVCAnimatedCompletion(alertController, YES, nil);
    };
}

- (CVCAlertInputTextsHandler)cvc_showInputControllerByTitlePlaceholdersCompleted {
    return ^ (NSString * __nullable title, NSArray<NSString *> * _Nonnull placeholders, CACInputTextFieldTextsHandler __nullable inputComplete) {
        UIAlertController *alertController = UIAlertController.cac_alertControllerWithTitlePlaceholdersForInputCompleted(title, placeholders, inputComplete);
        self.cvc_presentVCAnimatedCompletion(alertController, YES, nil);
    };
}

@end
