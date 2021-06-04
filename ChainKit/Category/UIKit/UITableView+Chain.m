//
//  UITableView+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UITableView+Chain.h"
#import "UIColor+Chain.h"

@implementation UITableView (Chain)

+ (UITableView* (^)(void))ct_tableView {
    return ^() {
        return [[self alloc] init];
    };
}

+ (CTInitFrameStyleHandleCallback)ct_tableViewWithFrameStyle {
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height, UITableViewStyle style) {
        return [[self alloc] initWithFrame:CGRectMake(x, y, width, height) style:style];
    };
}

- (void (^)(NSArray<NSIndexPath *> * nonnull))ct_reloadRowsAtIndexPaths {
    return ^(NSArray<NSIndexPath *> *indexPaths) {
        [self reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    };
}

- (void (^)(NSIndexSet * nonnull))ct_reloadSections {
    return ^(NSIndexSet *indexSet) {
        [self reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    };
}

- (void (^)(NSIndexPath * nonnull))ct_scrollToRowAtIndexPath {
    return ^(NSIndexPath *indexPath) {
        [self scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    };
}

- (UITableView * (^)(id <UITableViewDataSource> __nullable))ct_dataSource {
    return ^(id <UITableViewDataSource> __nullable dataSource) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.dataSource = dataSource;
        }
        return self;
    };
}

- (UITableView * (^)(id <UITableViewDelegate> __nullable))ct_delegate {
    return ^(id <UITableViewDelegate> __nullable delegate) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.delegate = delegate;
        }
        return self;
    };
}

- (CTValueHandleCallback)ct_rowHeight {
    return ^(CGFloat rowHeight) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.rowHeight = rowHeight;
        }
        return self;
    };
}

- (CTDeselectRowHandleCallback)ct_deselectRowAtIndexPathAnimated {
    return ^(NSIndexPath * _Nonnull indexPath, BOOL animated) {
        if ([self isKindOfClass:[UITableView class]]) {
            [self deselectRowAtIndexPath:indexPath animated:animated];
        }
        return self;
    };
}

- (UITableView* (^)(UIView * __nullable))ct_tableFooterView {
    return ^(UIView *footerView) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.tableFooterView = footerView;
        }
        return self;
    };
}

- (CTSeparatorHandleCallback)ct_separatorStyle {
    return ^(UITableViewCellSeparatorStyle separatorStyle) {
        if ([self isKindOfClass:[UITableView class]]) {
//            self.ct_separatorInset(UIEdgeInsetsZero);
            self.separatorStyle = separatorStyle;
        }
        return self;
    };
}

- (CTSeparatorEdgeHandleCallback)ct_separatorInset {
    return ^(UIEdgeInsets separatorInset) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.separatorInset = separatorInset;
        }
        return self;
    };
}

- (CTSeparatorColorHandleCallback)ct_separatorColor {
    return ^(UIColor *separatorColor) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.separatorColor = separatorColor;
        }
        return self;
    };
}

- (CTSeparatorColorRGBAHandleCallback)ct_separatorColorRGBA {
    return ^(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha) {
        if ([self isKindOfClass:[UITableView class]]) {
            self.separatorColor = UIColor.cc_colorByRGBA(red, green, blue, alpha);
        }
        return self;
    };
}

@end
