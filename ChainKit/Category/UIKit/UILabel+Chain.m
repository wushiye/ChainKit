//
//  UILabel+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UILabel+Chain.h"

@implementation UILabel (Chain)

+ (UILabel* (^)(void))cl_label {
    return ^() {
        return [[self alloc] init];
    };
}

- (CLStringHandleCallback)cl_text {
    return ^(NSString * __nullable text) {
        self.text = text;
        return self;
    };
}

- (CLRGBColorHandleCallback)cl_textColorRGB {
    return ^(CGFloat red, CGFloat green, CGFloat blue) {
        UIColor *color = [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1.0f];
        self.textColor = color;
        return self;
    };
}

- (CLColorHandleCallback)cl_textColor {
    return ^(UIColor * __nullable textColor) {
        self.textColor = textColor;
        return self;
    };
}

- (CLValueHandleCallback)cl_fontSize {
    return ^(CGFloat size) {
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}

- (UILabel* void (^)(NSTextAlignment))cl_textAlignment {
    return ^(NSTextAlignment textAlignment) {
        self.textAlignment = textAlignment;
        return self;
    };
}

@end
