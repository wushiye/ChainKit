//
//  UIButton+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIButton+Chain.h"
#import "UIImage+Chain.h"
#import "UIColor+Chain.h"

@implementation UIButton (Chain)

#pragma mark ——— Public Interface

+ (UIButton* (^)(void))cb_button {
    return ^() {
        return [[self alloc] init];
    };
}

+ (UIButton* (^)(UIButtonType))cb_buttonWithType {
    return ^(UIButtonType type) {
        return [self buttonWithType:type];
    };
}

- (CBStringHandleCallback)cb_title {
    return ^(NSString * __nullable title) {
        [self setTitle:[title copy] forState:UIControlStateNormal];
        return self;
    };
}

- (CBStringHandleCallback)cb_imageOfNamed {
    return ^(NSString * __nullable imageName) {
        [self setImage:UIImage.ci_imageNamed(imageName) forState:UIControlStateNormal];
        return self;
    };
}

- (CBRGBColorHandleCallback)cb_titleColorRGB {
    return ^(CGFloat red, CGFloat green, CGFloat blue) {
        [self setTitleColor:UIColor.cc_colorByRGBA(red, green, blue, 1.0f) forState:UIControlStateNormal];
        return self;
    };
}

- (CBColorHandleCallback)cb_titleColor {
    return ^(UIColor * __nullable titleColor) {
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        return self;
    };
}

- (CBValueHandleCallback)cb_fontSize {
    return ^(CGFloat size) {
        self.titleLabel.font = [UIFont systemFontOfSize:size];
        return self;
    };
}

- (CBActionHandleCallback)cb_addTargetAction {
    return ^(UIButton * __nullable target, NSString * _Nonnull action) {
        if ([self isKindOfClass:[UIButton class]] && action) {
            [self addTarget:target action:NSSelectorFromString([action copy]) forControlEvents:UIControlEventTouchUpInside];
        }
        return self;
    };
}

- (CBBOOLValueHandleCallback)cb_enabled {
    return ^(BOOL enabled) {
        self.enabled = enabled;
        return self;
    };
}

- (CBBOOLValueHandleCallback)cb_selected {
    return ^(BOOL selected) {
        self.selected = selected;
        return self;
    };
}

@end
