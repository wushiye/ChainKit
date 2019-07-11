//
//  UITableViewCell+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (Chain)

typedef UITableViewCell* __nullable (^CTCCellInitReuseHandle)(Class _Nonnull, UITableView * _Nonnull);

+ (CTCCellInitReuseHandle)ctc_cellReuseNibLoadByClassTableView;

+ (CTCCellInitReuseHandle)ctc_cellReuseByClassTableView;



typedef UITableViewCell* __nullable (^CTCCellInitHandleCallback)(UITableView * _Nonnull);

+ (CTCCellInitHandleCallback)ctc_cellReuseNibLoadForTableView;

+ (CTCCellInitHandleCallback)ctc_cellReuseForTableView;

- (UITableViewCell* (^)(BOOL))ctc_selected;

- (UITableViewCell* (^)(UITableViewCellSelectionStyle))ctc_selectionStyle;

- (UITableViewCell* (^)(UIColor * __nullable))ctc_selectedColor;

@end

NS_ASSUME_NONNULL_END
