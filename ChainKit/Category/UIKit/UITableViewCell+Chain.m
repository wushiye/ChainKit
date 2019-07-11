//
//  UITableViewCell+Chain.m
//  Chain-Master
//
//  Created by FMMac on 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UITableViewCell+Chain.h"
#import "UIView+Chain.h"
#import "UIColor+Chain.h"

typedef NS_ENUM(NSUInteger, CTCTableViewCellType) {
    CTCTableViewCellTypeInit,
    CTCTableViewCellTypeNibInit
};

@implementation UITableViewCell (Chain)

+ (CTCCellInitReuseHandle)ctc_cellReuseNibLoadByClassTableView {
    return self.ctc_initWithTableViewClassType(CTCTableViewCellTypeNibInit);
}

+ (CTCCellInitReuseHandle)ctc_cellReuseByClassTableView {
    return self.ctc_initWithTableViewClassType(CTCTableViewCellTypeInit);
}



+ (CTCCellInitHandleCallback)ctc_cellReuseNibLoadForTableView {
    return self.ctc_initWithTableViewCellType(CTCTableViewCellTypeNibInit);
}

+ (CTCCellInitHandleCallback)ctc_cellReuseForTableView {
    return self.ctc_initWithTableViewCellType(CTCTableViewCellTypeInit);
}

- (UITableViewCell* (^)(BOOL))ctc_selected {
    return ^(BOOL selected) {
        if ([self isKindOfClass:[UITableViewCell class]]) {
            self.selected = selected;
        }
        return self;
    };
}

- (UITableViewCell* (^)(UITableViewCellSelectionStyle))ctc_selectionStyle {
    return ^(UITableViewCellSelectionStyle selectionStyle) {
        if ([self isKindOfClass:[UITableViewCell class]]) {
            self.selectionStyle = selectionStyle;
        }
        return self;
    };
}

- (UITableViewCell* (^)(UIColor * __nullable))ctc_selectedColor {
    return ^(UIColor * __nullable color) {
        if ([self isKindOfClass:[UITableViewCell class]]) {
//            self.ctc_selectionStyle(UITableViewCellSelectionStyleDefault);
            UIColor *defaultColor = UIColor.cc_colorByRGBA(0.0f, 0.0f, 0.0f, 0.05f);
            self.selectedBackgroundView = UIView.cv_view().cv_backColor(color ?: defaultColor);
        }
        return self;
    };
}

#pragma mark ——— <Private Interface>

typedef CTCCellInitHandleCallback (^CTCCellTypeHandleCallback)(CTCTableViewCellType);

+ (CTCCellTypeHandleCallback)ctc_initWithTableViewCellType {
    return ^(CTCTableViewCellType type) {
        
        return ^(UITableView *tableView) {
            NSString * const className = NSStringFromClass([self class]);
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
            if (!cell) {
                switch (type) {
                    case CTCTableViewCellTypeInit: {
                        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
                        break;
                    }
                    case CTCTableViewCellTypeNibInit: {
                        cell = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil].lastObject;
                        break;
                    }
                }
            }
            return cell;
        };
    };
}

typedef CTCCellInitReuseHandle (^CTCCellClassHandleCallback)(CTCTableViewCellType);

+ (CTCCellClassHandleCallback)ctc_initWithTableViewClassType {

    return ^(CTCTableViewCellType type) {
        
        return ^(Class _Nonnull aClass, UITableView *tableView) {
            NSString * const className = NSStringFromClass(aClass);
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
            if (!cell) {
                switch (type) {
                        case CTCTableViewCellTypeInit: {
                            cell = [[aClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
                            break;
                        }
                        case CTCTableViewCellTypeNibInit: {
                            cell = [[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil].lastObject;
                            break;
                        }
                }
            }
            return cell;
        };
    };
}

@end
