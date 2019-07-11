//
//  UINavigationItem+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationItem (Chain)

- (CNIItemHandleCallback)cni_leftBarButtonItem;

- (CNIItemHandleCallback)cni_rightBarButtonItem;

- (CNIItemsHandleCallback)cni_leftBarButtonItems;

- (CNIItemsHandleCallback)cni_rightBarButtonItems;

- (CNIStringHandleCallback)cni_title;

- (UINavigationItem* (^)(UIView * __nullable))cni_titleView;

+ (UINavigationItem* (^)(void))cni_navigationItem;

@end

NS_ASSUME_NONNULL_END
