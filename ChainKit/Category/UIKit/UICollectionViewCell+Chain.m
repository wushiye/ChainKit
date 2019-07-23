//
//  UICollectionViewCell+Chain.m
//  Test
//
//  Created by wushiye on 2019/7/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UICollectionViewCell+Chain.h"

@implementation UICollectionViewCell (Chain)

+ (CCCItemCellInitHandler)ccc_cellReuseForCollectionViewIndexPath {
    return ^(UICollectionView *collectionView, NSIndexPath * indexPath) {
        return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([self class]) forIndexPath:indexPath];
    };
}

@end
