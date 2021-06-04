//
//  UIView+Seek.m
//  Chain-Master
//
//  Created by admin 2019/4/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIView+Seek.h"

@implementation UIView (Seek)

- (UIViewController * __nullable)viewController {
    for (UIView *view = self; view; view = view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

- (UIViewController * __nullable)cv_controller {
    return (UIViewController *)[self responderOfClassName:@"UIViewController"];
}

- (UINavigationController * __nullable)cv_navigationController {
    return (UINavigationController *)[self responderOfClassName:@"UINavigationController"];
}

- (UITableView * __nullable)cv_tableView {
    return (UITableView *)[self superViewOfClassName:@"UITableView"];
}

- (UICollectionView * __nullable)cv_collectionView {
    return (UICollectionView *)[self superViewOfClassName:@"UICollectionView"];
}


#pragma mark ——— Private Interface

- (UIResponder * __nullable)responderOfClassName:(NSString * _Nonnull)className {
    UIResponder *responder = self.nextResponder;
    do {
        if ([responder isKindOfClass:NSClassFromString(className)])  {
            return responder;
        }
        responder = responder.nextResponder;
        
    } while (responder);
    
    return nil;
}

- (UIView * __nullable )superViewOfClassName:(NSString * _Nonnull)className {
    UIView *superView = self;
    while (![superView isKindOfClass:NSClassFromString(className)] && superView) {
        superView = [superView superview];
        if (!superView)  return nil;
    }
    return superView;
}

@end
