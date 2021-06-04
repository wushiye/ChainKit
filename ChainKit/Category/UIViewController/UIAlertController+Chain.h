//
//  UIAlertController+Chain.h
//  Chain-Master
//
//  Created by admin 2019/7/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (Chain)

+ (CACConfirmHandler)cac_alertControllerWithTitleDescrCancelConfirmCompleted;

+ (CACSheetTitleItemsActionHandler)cac_alertControllerWithTitleSheetNamesSelectedCompleted;

+ (CACInputTextFieldsHandler)cac_alertControllerWithTitlePlaceholdersForInputCompleted;

@end

NS_ASSUME_NONNULL_END
