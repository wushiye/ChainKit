//
//  UIAlertController+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/7/20.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIAlertController+Chain.h"

@implementation UIAlertController (Chain)

+ (CACConfirmHandler)cac_alertControllerWithTitleDescrCancelConfirmCompleted {
    
    return ^(NSString * title, NSString * descr, NSString *cancelTitle, NSString *confirmTitle, CHandleCallback confirmCallback) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:confirmTitle ?: @"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (confirmCallback) confirmCallback();
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:cancelTitle ?: @"取消" style:UIAlertActionStyleCancel handler:nil]];
        return alertController;
    };
}

+ (CACSheetTitleItemsActionHandler)cac_alertControllerWithTitleSheetNamesSelectedCompleted {
    
    return ^(NSString *title, NSArray<NSString *> *itemNames, CACSelectedSheetHandler selectedCallback) {

        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        for (NSUInteger idx = 0; idx < itemNames.count; idx++) {
            NSString *itemName = [itemNames[idx] copy];
            UIAlertAction *itemAction = [UIAlertAction actionWithTitle:itemName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (selectedCallback)  selectedCallback(idx);
                });
            }];
            [alertController addAction:itemAction];
        }
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        return alertController;
    };
}

+ (CACInputTextFieldsHandler)cac_alertControllerWithTitlePlaceholdersForInputCompleted {
    
    return ^(NSString *title, NSArray<NSString *> *placeholders, CACInputTextFieldTextsHandler inputCompleted) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
        for (NSString *placeholder in placeholders) {
            [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = [placeholder copy];
            }];
        }
        [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSMutableArray *mInputTexts = [NSMutableArray arrayWithCapacity:3];
            for (UITextField *textField in alertController.textFields) {
                [mInputTexts addObject:textField.text ?: @""];
            }
            if (inputCompleted)  inputCompleted([mInputTexts copy]);
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        
        return alertController;
    };
}

@end
