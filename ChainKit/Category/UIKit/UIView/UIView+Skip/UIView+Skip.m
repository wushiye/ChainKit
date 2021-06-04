//
//  UIView+Skip.m
//  SeventreesUser
//
//  Created by liumei on 2020/4/2.
//  Copyright © 2020 Seven trees. All rights reserved.
//

#import "UIView+Skip.h"
#import "UIView+Seek.h"
#import "NSObject+RuntimeParams.h"

@implementation UIView (Skip)

- (CVSkipTransferHandler)cv_pushByClassNameParams {
    return ^(NSString * _Nullable aClassName, NSDictionary * _Nullable params) {
        UIViewController *destinationController = [[NSClassFromString(aClassName) alloc] initWithParams:params];
        [self.cv_navigationController pushViewController:destinationController animated:YES];
        return self;
    };
}

- (CVSkipTransferHandler)cv_presentByClassNameParams {
    return ^(NSString * _Nullable aClassName, NSDictionary * _Nullable params) {
        UIViewController *destinationController = [[NSClassFromString(aClassName) alloc] initWithParams:params];
        [self.viewController presentViewController:destinationController animated:YES completion:nil];
        return self;
    };
}

- (CVSkipTransferHandler)cv_showByClassNameParams {
    return ^(NSString * _Nullable aClassName, NSDictionary * _Nullable params) {
        UIViewController *destinationController = [[NSClassFromString(aClassName) alloc] initWithParams:params];
        self.cv_showViewController(destinationController);
        return self;
    };
}

- (CVShowControllerHandler)cv_showViewController {
    return ^(UIViewController * _Nullable destinationController) {
        UIViewController *fromController = self.viewController;
        if (fromController.navigationController) {
            [fromController.navigationController pushViewController:destinationController animated:YES];
        } else {
            [fromController presentViewController:destinationController animated:YES completion:nil];
        }
        return self;
    };
}

@end
