//
//  UICollectionView+Chain.h
//  Test
//
//  Created by wushiye on 2019/7/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (Chain)

- (UICollectionView* (^)(NSString * const _Nonnull))ccv_registerNibName;

- (UICollectionView* (^)(Class _Nonnull aClass))ccv_registerClass;

@end

NS_ASSUME_NONNULL_END
