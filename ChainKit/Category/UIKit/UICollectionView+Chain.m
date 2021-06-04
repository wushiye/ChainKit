//
//  UICollectionView+Chain.m
//  Test
//
//  Created by wushiye on 2019/7/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UICollectionView+Chain.h"

@implementation UICollectionView (Chain)

- (UICollectionView* (^)(void))ccv_registerNib {
    return ^{
        NSString * const reuseIdentifier = NSStringFromClass([self class]);
        [self registerNib:[UINib nibWithNibName:reuseIdentifier bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
        return self;
    };
}

- (UICollectionView* (^)(void))ccv_registerClass {
    return ^{
        Class class = [self class];
        [self registerClass:class forCellWithReuseIdentifier:NSStringFromClass(class)];
        return self;
    };
}

@end
