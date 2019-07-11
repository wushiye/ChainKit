//
//  UITableView+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/26.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Chain)

+ (UITableView* (^)(void))ct_tableView;

+ (CTInitFrameStyleHandleCallback)ct_tableViewWithFrameStyle;


- (UITableView * (^)(id <UITableViewDataSource> __nullable))ct_dataSource;

- (UITableView * (^)(id <UITableViewDelegate> __nullable))ct_delegate;

- (CTValueHandleCallback)ct_rowHeight;

- (CTDeselectRowHandleCallback)ct_deselectRowAtIndexPathAnimated;

- (UITableView* (^)(UIView * __nullable))ct_tableFooterView;

- (CTSeparatorHandleCallback)ct_separatorStyle;

- (CTSeparatorEdgeHandleCallback)ct_separatorInset;

- (CTSeparatorColorHandleCallback)ct_separatorColor;

- (CTSeparatorColorRGBAHandleCallback)ct_separatorColorRGBA;

@end

NS_ASSUME_NONNULL_END
