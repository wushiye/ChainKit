//
//  UINavigationItem+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (Chain)

+ (UINavigationItem* (^)(void))cni_navigationItem;

- (CNIItemHandleCallback)cni_leftBarButtonItem;

- (CNIItemHandleCallback)cni_rightBarButtonItem;

- (CNIItemsHandleCallback)cni_leftBarButtonItems;

- (CNIItemsHandleCallback)cni_rightBarButtonItems;

- (CNIStringHandleCallback)cni_title;

- (UINavigationItem* (^)(UIView * __nullable))cni_titleView;

@end

NS_ASSUME_NONNULL_END
