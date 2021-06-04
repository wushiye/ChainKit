//
//  UIView+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/18.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIView+Chain.h"
#import "UIColor+Chain.h"
#import <objc/runtime.h>

@implementation UIView (Chain)

+ (UIView* (^)(void))cv_view {
    return ^() {
        return [[self alloc] init];
    };
}
    
+ (id (^)(void))cv_viewFromNibLoad {
    return ^{
        return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
    };
}

+ (UIView* (^)(CGRect))cv_viewWithFrame {
    return ^(CGRect frame) {
        return [[self alloc] initWithFrame:frame];
    };
}

+ (UIView* (^)(CGFloat, CGFloat, CGFloat, CGFloat))cv_viewWithFrameOf {
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
        return [[self alloc] initWithFrame:CGRectMake(x, y, width, height)];
    };
}

- (CVFrameHandleCallback)cv_frame {
    return ^(CGRect frame) {
        if ([self isKindOfClass:[UIView class]]) {
            self.frame = frame;
        }
        return self;
    };
}

- (CVRectHandleCallback)cv_frameOf {
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
        if ([self isKindOfClass:[UIView class]]) {
            self.frame = CGRectMake(x, y, width, height);
        }
        return self;
    };
}

- (CVColorHandleCallback)cv_backColor {
    return ^(UIColor * __nullable backgroundColor) {
        if ([self isKindOfClass:[UIView class]]) {
            self.backgroundColor = backgroundColor;
        }
        return self;
    };
}

- (CVHexColorStringHandleCallback)cv_backColorByHexString {
    return ^(NSString * __nullable hexString) {
        if ([self isKindOfClass:[UIView class]]) {
            self.backgroundColor = UIColor.cc_colorByHexString(hexString);
        }
        return self;
    };
}

- (CVRGBAColorHandleCallback)cv_backColorRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        if ([self isKindOfClass:[UIView class]]) {
            self.backgroundColor = self.cv_colorByRGBA(red, green, blue, alpha);
        }
        return self;
    };
}

- (CVValueHandleCallback)cv_layerCornerRadius {
    return ^(CGFloat cornerRadius) {
        if ([self isKindOfClass:[UIView class]]) {
            self.layer.cornerRadius = cornerRadius;
        }
        return self;
    };
}

- (CVValueHandleCallback)cv_layerBorderWidth {
    return ^(CGFloat borderWidth) {
        if ([self isKindOfClass:[UIView class]]) {
            self.layer.borderWidth = borderWidth;
        }
        return self;
    };
}

- (CVRGBColorHandleCallback)cv_layerBorderColorRGB {
    return ^(CGFloat red, CGFloat green, CGFloat blue) {
        if ([self isKindOfClass:[UIView class]]) {
            self.layer.borderColor = self.cv_colorByRGBA(red, green, blue, 1.0f).CGColor;
        }
        return self;
    };
}

- (CVColorHandleCallback)cv_layerBorderColor {
    return ^(UIColor * __nullable borderColor) {
        if ([self isKindOfClass:[UIView class]]) {
            self.layer.borderColor = borderColor.CGColor;
        }
        return self;
    };
}

- (CVHexColorStringHandleCallback)cv_layerBorderByHexString {
    return ^(NSString * __nullable hexColorString) {
        if ([self isKindOfClass:[UIView class]]) {
            self.layer.borderColor = UIColor.cc_colorByHexString(hexColorString).CGColor;
        }
        return self;
    };
}

- (CVJudgeBOOLHandleCallback)cv_clipsToBounds {
    return ^(BOOL clipsToBounds) {
        if ([self isKindOfClass:[UIView class]]) {
            self.clipsToBounds = YES;
        }
        return self;
    };
}

- (CVContentModeHandleCallback)cv_contentMode {
    return ^(UIViewContentMode contentMode) {
        if ([self isKindOfClass:[UIView class]]) {
            self.contentMode = contentMode;
        }
        return self;
    };
}

- (CVAddSubviewHandleCallback)cv_addSubview {
    return ^(UIView * _Nonnull subview) {
        if ([self isKindOfClass:[UIView class]]) {
            [self addSubview:subview];
        }
        return self;
    };
}

- (CVAddSubviewsHandleCallback)cv_addSubviews {
    return ^(NSArray * _Nonnull subviews) {
        if ([self isKindOfClass:[UIView class]]) {
            subviews = [subviews copy];
            for (UIView *subview in subviews) {
                [self addSubview:subview];
            }
        }
        return self;
    };
}
    
- (CVAddEndEditingHandleCallback)cv_endEditing {
    return ^{
        if ([self isKindOfClass:[UIView class]]) {
            [self endEditing:YES];
        }
        return self;
    };
}

- (CVTagHandleCallback)cv_tag {
    return ^(NSInteger tag) {
        if ([self isKindOfClass:[UIView class]]) {
            self.tag = tag;
        }
        return self;
    };
}

- (CAddTouchEventCompleted)cv_addTouchEventCallback {
    return ^(CTouchEventCallback __nullable touchCallback) {
        if (![self isKindOfClass:[UIView class]]) return;
        objc_setAssociatedObject(self, @selector(cv_addTouchEventCallback), touchCallback, OBJC_ASSOCIATION_COPY);
        if (touchCallback) {
            self.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vc_tapRecognizerAction)];
            [self addGestureRecognizer:tapRecognizer];
        }
    };
}

- (void)vc_tapRecognizerAction {
    if (![self isKindOfClass:[UIView class]]) return;
    
    CTouchEventCallback touchCallback = objc_getAssociatedObject(self, @selector(cv_addTouchEventCallback));
    !touchCallback ?: touchCallback(self);
}


#pragma mark ——— Private Interface

- (CColorRGBAHandleCallback)cv_colorByRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        return [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:alpha];
    };
}

@end
