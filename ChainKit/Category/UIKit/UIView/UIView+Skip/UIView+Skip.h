//
//  UIView+Skip.h
//  SeventreesUser
//
//  Created by liumei on 2020/4/2.
//  Copyright © 2020 Seven trees. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView* _Nullable (^ __nullable CVSkipTransferHandler)(NSString * _Nonnull, NSDictionary * _Nonnull);

typedef UIView* _Nullable (^ __nullable CVShowControllerHandler)(UIViewController * _Nonnull);

@interface UIView (Skip)

- (CVSkipTransferHandler)cv_pushByClassNameParams;

- (CVSkipTransferHandler)cv_presentByClassNameParams;

- (CVSkipTransferHandler)cv_showByClassNameParams;

- (CVShowControllerHandler)cv_showViewController;

@end
