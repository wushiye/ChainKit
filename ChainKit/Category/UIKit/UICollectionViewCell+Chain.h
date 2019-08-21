//
//  UICollectionViewCell+Chain.h
//  Test
//
//  Created by wushiye on 2019/7/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (Chain)

typedef id __nullable (^CCCItemCellInitHandler)(UICollectionView * _Nonnull, NSIndexPath * _Nonnull);

+ (CCCItemCellInitHandler)ccc_cellReuseForCollectionViewIndexPath;

@end

NS_ASSUME_NONNULL_END
