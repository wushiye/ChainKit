//
//  UIButton+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Chain)

+ (UIButton* (^)(void))cb_button;

+ (UIButton* (^)(UIButtonType))cb_buttonWithType;

- (CBStringHandleCallback)cb_title;

- (CBContentForStateHandle)cb_setTitleForState;

- (CBStringHandleCallback)cb_imageOfNamed;

- (CBContentForStateHandle)cb_setImageOfNamedForState;

- (CBRGBColorHandleCallback)cb_titleColorRGB;

- (CBRGBColorForStateHandle)cb_setTitleColorOfRGBForState;

- (CBColorHandleCallback)cb_titleColor;

- (CBColorForStateHandle)cb_setTitleColorForState;

- (CBValueHandleCallback)cb_fontSize;

- (CBActionHandleCallback)cb_addTargetAction;

- (CBBOOLValueHandleCallback)cb_enabled;

- (CBBOOLValueHandleCallback)cb_selected;

@end

NS_ASSUME_NONNULL_END
