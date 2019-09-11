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

- (UIViewController* (^)(BOOL))cvc_hidesBottomBarWhenPushed;


#pragma mark - UIAlertController

/**
 e.g.
 self.cvc_showAlertControllerByTitleDescrConfirmCompleted(@"AlertVC", @"descr..", @"confirm", ^{
 
 });
 */
- (CVCAlertConfrimHandler)cvc_showAlertControllerByTitleDescrConfirmCompleted;

/**
 e.g.
 self.cvc_showSheetControllerByTitleNamesCompleted(@"SheetAlertVC", @[@"第0项", @"第1项", @"第2项"], ^(NSUInteger index) {
    DLog(@"index == %lu", index);
 });
 */
- (CVCAlertTitleSheetItemsActionHandler)cvc_showSheetControllerByTitleNamesCompleted;

/**
 e.g.
 self.cvc_showInputControllerByTitlePlaceholdersCompleted(@"TextFields AlertVC", @[@"请输入第0项", @"请输入第1项", @"请输入第2项"], ^(NSArray<NSString *> * texts) {
    DLog(@"input texts == %@", texts);
 });
 */
- (CVCAlertInputTextsHandler)cvc_showInputControllerByTitlePlaceholdersCompleted;

@end

NS_ASSUME_NONNULL_END
