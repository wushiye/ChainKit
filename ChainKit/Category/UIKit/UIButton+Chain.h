//
//  UIButton+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Chain)

+ (UIButton* (^)(void))cb_button;

+ (UIButton* (^)(UIButtonType))cb_buttonWithType;

- (CBStringHandleCallback)cb_title;

- (CBStringHandleCallback)cb_imageOfNamed;

- (CBRGBColorHandleCallback)cb_titleColorRGB;

- (CBColorHandleCallback)cb_titleColor;

- (CBValueHandleCallback)cb_fontSize;

- (CBActionHandleCallback)cb_addTargetAction;

- (CBBOOLValueHandleCallback)cb_enabled;

- (CBBOOLValueHandleCallback)cb_selected;

@end

NS_ASSUME_NONNULL_END
