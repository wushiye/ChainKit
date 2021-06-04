//
//  UITextField+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Chain)

+ (CTFHandleCallback)ctf_textField;

- (CTFTextHandleCallback)ctf_text;

- (CTFTextColorRGBAHandleCallback)ctf_textColorRGBA;

- (CTFTextColorHandleCallback)ctf_textColor;

- (CTFFontSizeHandleCallback)ctf_fontSize;

- (CTFFontHandleCallback)ctf_font;

- (CTFAttributedStringHandleCallback)ctf_attributedText;

- (CTFTextHandleCallback)ctf_placeholder;

- (CTFTextColorHandleCallback)ctf_placeholderTextColor;

- (CTFTextColorRGBAHandleCallback)ctf_placeholderTextColorRGBA;

//- (CTFFontSizeHandleCallback)ctf_placeholderFontSize;

- (CTFBorderStyleHandleCallback)ctf_borderStyle;

- (CTFHasTextHandleCallback)ctf_hasText;

- (CTFClearModeHandleCallback)ctf_clearButtonMode;

- (CTFReturnKeyTypeHandleCallback)ctf_returnKeyType;

- (CTFKeyboardTypeHandleCallback)ctf_keyboardType;

- (CTFHandleCallback)ctf_becomeFirstResponder;

- (CTFHandleCallback)ctf_resignFirstResponder;


- (CTFAddActionHandleCompleted)ctf_editBeginCallback;

- (CTFAddActionHandleCompleted)ctf_editEndCallback;

- (CTFAddActionHandleCompleted)ctf_editEndOnExitCallback;

typedef void (^CTFTextDidChangeCallback)(NSString *);
typedef UITextField* _Nonnull (^CTFAddEditingChangedActionCompleted)(CTFTextDidChangeCallback __nullable);

- (CTFAddEditingChangedActionCompleted)ctf_textDidChangeCallback;

@end

NS_ASSUME_NONNULL_END
