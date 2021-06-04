//
//  UIScrollView+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIScrollView+Chain.h"
#import <objc/runtime.h>

@implementation UIScrollView (Chain)

+ (UIScrollView* (^)(void))cs_scrollView {
    return ^() {
        return [[self alloc] init];
    };
}

- (UIScrollView * (^)(id <UIScrollViewDelegate> __nullable))cs_delegate {
    return ^(id <UIScrollViewDelegate> __nullable delegate) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.delegate = delegate;
        }
        return self;
    };
}

- (CSSizeHandleCallback)cs_contentSize {
    return ^(CGSize size) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.contentSize = size;
        }
        return self;
    };
}

- (CSPointHandleCallback)cs_contentOffset {
    return ^(CGPoint offset) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.contentOffset = offset;
        }
        return self;
    };
}

- (CSBOOLHandleCallback)cs_pagingEnabled {
    return ^(BOOL pagingEnabled) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.pagingEnabled = pagingEnabled;
        }
        return self;
    };
}

- (CSBOOLHandleCallback)cs_bounces {
    return ^(BOOL bounces) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.bounces = bounces;
        }
        return self;
    };
}

- (CSBOOLHandleCallback)cs_scrollEnabled {
    return ^(BOOL scrollEnabled) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.scrollEnabled = scrollEnabled;
        }
        return self;
    };
}

- (CSMoveDidContentOffsetHandleCallback)cs_setContentOffsetAnimated {
    return ^(CGPoint offset, BOOL animated) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            [self setContentOffset:offset animated:animated];
        }
        return self;
    };
}

- (CSBOOLHandleCallback)cs_showsVerticalScrollIndicator {
    return ^(BOOL isShowVer) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.showsVerticalScrollIndicator = isShowVer;
        }
        return self;
    };
}

- (CSBOOLHandleCallback)cs_showsHorizontalScrollIndicator {
    return ^(BOOL isShowHor) {
        if ([self isKindOfClass:[UIScrollView class]]) {
            self.showsHorizontalScrollIndicator = isShowHor;
        }
        return self;
    };
}

- (CSRefreshControlHandleCallback)cs_refreshControl {
    return ^(UIRefreshControl * __nullable refreshControl) {
        if ([self isKindOfClass:[UIScrollView class]]) {
//            if (@available(iOS 10.0, *)) { // iOS 10 SDK
                self.refreshControl = refreshControl;
//            } else {
//                // Fallback on earlier versions
//            }
        }
        return self;
    };
}

- (CSHandleCallback)cs_scrollToTop {
    return ^() {
//     e.g. 1   self.contentOffset = CGPointMake(0.0f, 0.0f);
//     e.g. 2   [collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
        [self scrollRectToVisible:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f) animated:NO];
        return self;
    };
}

- (CSHandleCallback)cs_scrollToBottom {
    return ^() {
        CGFloat offset = self.contentSize.height - self.bounds.size.height;
        if (offset > 0.0f) [self setContentOffset:CGPointMake(0.0f, offset) animated:NO];
        return self;
    };
}

- (CBBOOLHandleCallback)cs_isScrollToBottom {
    return ^() {
        if (self.contentSize.height - self.contentOffset.y - self.frame.size.height <= 0.0f) {
            return YES;
        }
        return NO;
    };
}

- (CBBOOLHandleCallback)cs_isScrollToTop {
    return ^() {
        if (self.contentOffset.y <= 0.0f) return YES;
        return NO;
    };
}

- (CBBOOLHandleCallback)cs_isDownScroll {
    return ^() {
        CGFloat offsetY = self.contentOffset.y;
        if (offsetY > self.cs_previousOffsetY.floatValue) {
            [self cs_setPreviousOffsetY:offsetY];
            return YES; // 向上拖拽(显示屏幕下面的内容)
        } else {
            [self cs_setPreviousOffsetY:offsetY];
            return NO;  // 向下拖拽(显示屏幕上面的内容)
        }
    };
}

#pragma mark ——— Private Interface

- (void)cs_setPreviousOffsetY:(CGFloat)offsetY {
    objc_setAssociatedObject(self, @selector(cs_previousOffsetY), @(offsetY), OBJC_ASSOCIATION_RETAIN);
}

- (NSNumber *)cs_previousOffsetY {
    return objc_getAssociatedObject(self, @selector(cs_previousOffsetY));
}


@end
