//
//  UINavigationItem+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UINavigationItem+Chain.h"

@implementation UINavigationItem (Chain)

+ (UINavigationItem* (^)(void))cni_navigationItem {
    return ^() {
        return [[self alloc] init];
    };
}

- (CNIItemHandleCallback)cni_leftBarButtonItem {
    return ^(UIBarButtonItem * __nullable barButtonItem ) {
        self.cni_setBarButtonItemByIsRight(barButtonItem, NO);
        return self;
    };
}

- (CNIItemHandleCallback)cni_rightBarButtonItem {
    return ^(UIBarButtonItem * __nullable barButtonItem ) {
        self.cni_setBarButtonItemByIsRight(barButtonItem, YES);
        return self;
    };
}

- (CNIItemsHandleCallback)cni_leftBarButtonItems {
    return ^(NSArray<UIBarButtonItem *> * __nullable barButtonItems) {
        self.cni_setBarButtonItemsByIsRight([barButtonItems copy], NO);
        return self;
    };
}

- (CNIItemsHandleCallback)cni_rightBarButtonItems {
    return ^(NSArray<UIBarButtonItem *> * __nullable barButtonItems) {
        self.cni_setBarButtonItemsByIsRight([barButtonItems copy], YES);
        return self;
    };
}

- (CNIStringHandleCallback)cni_title {
    return ^(NSString * __nullable title) {
        if ([self isKindOfClass:[UINavigationItem class]]) {
            self.title = [title copy];
        }
        return self;
    };
}

- (UINavigationItem* (^)(UIView * __nullable))cni_titleView {
    return ^(UIView * __nullable titleView) {
        self.titleView = titleView;
        return self;
    };
}


#pragma mark ——— <Private Interface>

- (void (^)(UIBarButtonItem * __nullable , BOOL))cni_setBarButtonItemByIsRight {
    return ^(UIBarButtonItem * __nullable barButtonItem, BOOL isRight) {
        if (isRight) {
            self.rightBarButtonItem = barButtonItem;
        } else {
            self.leftBarButtonItem = barButtonItem;
        }
    };
}

- (void (^)(NSArray<UIBarButtonItem *> * __nullable , BOOL))cni_setBarButtonItemsByIsRight {
    return ^(NSArray<UIBarButtonItem *> * __nullable barButtonItems, BOOL isRight) {
        if (isRight) {
            self.rightBarButtonItems = barButtonItems;
        } else {
            self.leftBarButtonItems = barButtonItems;
        }
    };
}

@end
