//
//  UITextField+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UITextField+Chain.h"
#import <objc/runtime.h>

#import "NSObject+Chain.h"
#import "UIControl+Chain.h"

@implementation UITextField (Chain)

#pragma mark - <Public Interface>

+ (CTFHandleCallback)ctf_textField {
    return ^() {
        return [[self alloc] init];
    };
}

- (CTFTextHandleCallback)ctf_text {
    return ^(NSString * __nullable text) {
        self.text = text;
        return self;
    };
}

- (CTFTextColorHandleCallback)ctf_textColor {
    return ^(UIColor * __nullable textColor) {
        self.textColor = textColor;
        return self;
    };
}

- (CTFTextColorRGBAHandleCallback)ctf_textColorRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        if ([self ctf_isKindClassUITextField]) {
            self.textColor = self.ctf_colorByRGBA(red, green, blue, alpha);
        }
        return self;
    };
}

- (CTFTextHandleCallback)ctf_placeholder {
    return ^(NSString * __nullable placeholder) {
        self.placeholder = placeholder;
        return self;
    };
}

- (CTFFontSizeHandleCallback)ctf_fontSize {
    return ^(CGFloat fontSize) {
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (CTFFontHandleCallback)ctf_font {
    return ^(UIFont * __nullable font) {
        self.font = font;
        return self;
    };
}

- (CTFAttributedStringHandleCallback)ctf_attributedText {
    return ^(NSAttributedString * __nullable attributedText) {
        self.attributedText = attributedText;
        return self;
    };
}

- (CTFTextColorHandleCallback)ctf_placeholderTextColor {
    return ^(UIColor * __nullable color) {
        if ([self ctf_isKindClassUITextField]) {
            [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
        }
        return self;
    }; 
}

- (CTFTextColorRGBAHandleCallback)ctf_placeholderTextColorRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        if ([self ctf_isKindClassUITextField]) {
            [self setValue:self.ctf_colorByRGBA(red, green, blue, alpha) forKeyPath:@"_placeholderLabel.textColor"];
        }
        return self;
    };
}

- (CTFFontSizeHandleCallback)ctf_placeholderFontSize {
    return ^(CGFloat fontSize) {
        if ([self ctf_isKindClassUITextField]) {
            [self setValue:[UIFont boldSystemFontOfSize:fontSize] forKeyPath:@"_placeholderLabel.font"];
        }
        return self;
    };
}

- (CTFHasTextHandleCallback)ctf_hasText {
    return ^{
        return self.hasText;
    };
}

- (CTFSecureTextEntryHandler)ctf_secureTextEntry {
    return ^(BOOL isSecure) {
        self.secureTextEntry = isSecure;
        return self;
    };
}

- (CTFBorderStyleHandleCallback)ctf_borderStyle {
    return ^(UITextBorderStyle borderStyle) {
        if ([self ctf_isKindClassUITextField]) {
            self.borderStyle = borderStyle;
        }
        return self;
    };
}

- (CTFClearModeHandleCallback)ctf_clearButtonMode {
    return ^(UITextFieldViewMode clearButtonMode) {
        if ([self ctf_isKindClassUITextField]) {
            self.clearButtonMode = clearButtonMode;
        }
        return self;
    };
}

- (CTFReturnKeyTypeHandleCallback)ctf_returnKeyType {
    return ^(UIReturnKeyType returnKeyType) {
        if ([self ctf_isKindClassUITextField]) {
            self.returnKeyType = returnKeyType;
        }
        return self;
    };
}

- (CTFKeyboardTypeHandleCallback)ctf_keyboardType {
    return ^(UIKeyboardType keyboardType) {
        if ([self ctf_isKindClassUITextField]) {
            self.keyboardType = keyboardType;
        }
        return self;
    };
}

- (CTFHandleCallback)ctf_becomeFirstResponder {
    return ^() {
        if ([self ctf_isKindClassUITextField]) {
            [self becomeFirstResponder];
        }
        return self;
    };
}

- (CTFHandleCallback)ctf_resignFirstResponder {
    return ^() {
        if ([self ctf_isKindClassUITextField]) {
            [self resignFirstResponder];
        }
        return self;
    };
}

/*************************************************** 编辑中文本变化 >> ***************************************************/
#pragma mark ——— 编辑中文本变化

- (CTFAddEditingChangedActionCompleted)ctf_textDidChangeCallback {
//    if ([self ctf_isKindClassUITextField]) return nil;
    return ^(CTFTextDidChangeCallback __nullable textChangeCallback) {
        if ([self ctf_isKindClassUITextField]) {
            [self ctf_setTargetActionForTextChangeCallback:textChangeCallback];
        }
        return self;
    };
}

- (void)ctf_setTargetActionForTextChangeCallback:(CTFTextDidChangeCallback __nullable)textChangeCallback {
    SEL callbackKey = @selector(ctf_textDidChangeCallback);
    objc_setAssociatedObject(self, callbackKey, textChangeCallback, OBJC_ASSOCIATION_COPY);
    NSString *actionName = @"ctf_textDidChange:";
    UIControlEvents controlEvent = UIControlEventEditingChanged;
    if (textChangeCallback) {
        self.cc_addTargetActionEvents(self, actionName, controlEvent);
    } else {
//        self.cc_removeTargetActionEvents(self, actionName, controlEvent);
    }
}

- (void)ctf_textDidChange:(UITextField *)textField {
    if (![self ctf_isKindClassUITextField]) return;
    
    CTFTextDidChangeCallback textChangeCallback = objc_getAssociatedObject(self, @selector(ctf_textDidChangeCallback));
    !textChangeCallback ?: textChangeCallback(textField.text);
}

/*************************************************** << 编辑中文本变化 ***************************************************/


/*************************************************** 编辑开始 >> ***************************************************/
#pragma mark ——— 编辑开始

- (CTFAddActionHandleCompleted)ctf_editBeginCallback {
    return ^(CTFControlEventCallback __nullable editBeginCallback) {
        if ([self ctf_isKindClassUITextField]) {
            SEL callbackKey = @selector(ctf_textDidChangeCallback);
            objc_setAssociatedObject(self, callbackKey, editBeginCallback, OBJC_ASSOCIATION_COPY);
            
            NSString *actionName = @"ctf_editingDidBegin:";
            UIControlEvents controlEvent = UIControlEventEditingDidBegin;
            if (editBeginCallback) {
                self.cc_addTargetActionEvents(self, actionName, controlEvent);
            } else {
                //                self.cc_removeTargetActionEvents(self, actionName, controlEvent);
            }
        }
        return self;
    };
}

- (void)ctf_editingDidBegin:(UITextField *)textField {
    if (![self ctf_isKindClassUITextField]) return;
    
    CTFControlEventCallback editBeginCallback = objc_getAssociatedObject(self, @selector(ctf_editBeginCallback));
    !editBeginCallback ?: editBeginCallback(textField);
}

/*************************************************** << 编辑开始 ***************************************************/


/*************************************************** 编辑结束 >> ***************************************************/
#pragma mark ——— 编辑结束

//static const void * ctf_editEndCallbackKey = &ctf_editEndCallbackKey;

- (CTFAddActionHandleCompleted)ctf_editEndCallback {
    
    return ^(CTFControlEventCallback __nullable editEndCallback) {
        if ([self ctf_isKindClassUITextField]) {
            SEL callbackKey = @selector(ctf_editEndCallback);
            objc_setAssociatedObject(self, callbackKey, editEndCallback, OBJC_ASSOCIATION_COPY);
            
            NSString *actionName = @"ctf_editingDidEnd:";
            UIControlEvents controlEvent = UIControlEventEditingDidEnd;
            if (editEndCallback) {
                self.cc_addTargetActionEvents(self, actionName, controlEvent);
            } else {
//                self.cc_removeTargetActionEvents(self, actionName, controlEvent);
            }
        }
        return self;
    };
}

- (void)ctf_editingDidEnd:(UITextField *)textField {
    if (![self ctf_isKindClassUITextField]) return;
    
    CTFControlEventCallback editEndCallback = objc_getAssociatedObject(self, @selector(ctf_editEndCallback));
    !editEndCallback ?: editEndCallback(textField);
}

/*************************************************** << 编辑结束 ***************************************************/


/*************************************************** 编辑结束退出 >> ***************************************************/
#pragma mark ——— 编辑结束退出

- (CTFAddActionHandleCompleted)ctf_editEndOnExitCallback {
    
    return ^(CTFControlEventCallback __nullable editEndOnExitCallback) {
        if ([self ctf_isKindClassUITextField]) {
            SEL callbackKey = @selector(ctf_editEndOnExitCallback);
            objc_setAssociatedObject(self, callbackKey, editEndOnExitCallback, OBJC_ASSOCIATION_COPY);
            
            NSString *actionName = @"ctf_editingDidEndOnExit:";
            UIControlEvents controlEvent = UIControlEventEditingDidEndOnExit;
            if (editEndOnExitCallback) {
                self.cc_addTargetActionEvents(self, actionName, controlEvent);
                self.ctf_returnKeyType(UIReturnKeyDone);
            } else {
//                self.cc_removeTargetActionEvents(self, actionName, controlEvent);
            }
        }
        return self;
    };
}

- (void)ctf_editingDidEndOnExit:(UITextField *)textField {
    if (![self ctf_isKindClassUITextField]) return;
    
    CTFControlEventCallback editEndOnExitCallback = objc_getAssociatedObject(self, @selector(ctf_editEndOnExitCallback));
    !editEndOnExitCallback ?: editEndOnExitCallback(textField);
}

/*************************************************** << 编辑结束退出 ***************************************************/

#pragma mark - <Private Interface>

- (BOOL)ctf_isKindClassUITextField {
    if (self.co_isKindOfClass([UITextField class])) {
        return YES;
    }
    return NO;
}

- (CColorRGBAHandleCallback)ctf_colorByRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
    };
}


@end
