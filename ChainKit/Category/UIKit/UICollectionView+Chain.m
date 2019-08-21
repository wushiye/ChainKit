//
//  UICollectionView+Chain.m
//  Test
//
//  Created by wushiye on 2019/7/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UICollectionView+Chain.h"

@implementation UICollectionView (Chain)

- (UICollectionView* (^)(NSString * const _Nonnull))ccv_registerNibName {
    return ^(NSString * const _Nonnull aClassNamee) {
        [self registerNib:[UINib nibWithNibName:aClassNamee bundle:nil] forCellWithReuseIdentifier:aClassNamee];
        return self;
    };
}

- (UICollectionView* (^)(Class _Nonnull aClass))ccv_registerClass {
    return ^(Class aClass) {
        [self registerClass:aClass forCellWithReuseIdentifier:NSStringFromClass(aClass)];
        return self;
    };
}

@end
