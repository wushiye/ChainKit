//
//  UIImage+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/24.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Chain)

typedef UIImage* _Nullable (^CIMGMakeHandleCallback)(NSString * __nullable);
+ (CIMGMakeHandleCallback)ci_imageNamed;

@end

NS_ASSUME_NONNULL_END
