//
//  UIScrollView+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (Chain)

+ (UIScrollView* (^)(void))cs_scrollView;


- (UIScrollView * (^)(id <UIScrollViewDelegate> __nullable))cs_delegate;

- (CSSizeHandleCallback)cs_contentSize;

- (CSPointHandleCallback)cs_contentOffset;

- (CSBOOLHandleCallback)cs_pagingEnabled;

- (CSBOOLHandleCallback)cs_scrollEnabled;

- (CSBOOLHandleCallback)cs_bounces;

- (CSMoveDidContentOffsetHandleCallback)cs_setContentOffsetAnimated;

- (CSBOOLHandleCallback)cs_showsVerticalScrollIndicator;

- (CSBOOLHandleCallback)cs_showsHorizontalScrollIndicator;

- (CSRefreshControlHandleCallback)cs_refreshControl;


/** 滚动动作：滚到最顶部 */
- (CSHandleCallback)cs_scrollToTop;

/** 滚动动作：滚到最底部 */
- (CSHandleCallback)cs_scrollToBottom;


/** 滚动位置：在最顶部 */
- (CBBOOLHandleCallback)cs_isScrollToTop;

/** 滚动位置：在最底部 */
- (CBBOOLHandleCallback)cs_isScrollToBottom;


/**
 滚动方向：上滚 或 下滚
 需遵守scrollView代理并在滚动代理方法做判断
 e.g.
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.cs_isDownScroll()) {
        DLog(@"向上拖拽(显示屏幕下面的内容)");
        // do something
    } else {
        DLog(@"向下拖拽(显示屏幕上面的内容)");
        // do something
    }
    DLog(@"contentOffset.y == %f", scrollView.contentOffset.y);
 }
 */
- (CBBOOLHandleCallback)cs_isDownScroll;


@end

NS_ASSUME_NONNULL_END
