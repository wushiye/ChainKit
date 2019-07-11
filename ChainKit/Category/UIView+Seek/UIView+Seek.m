//
//  UIView+Seek.m
//  Chain-Master
//
//  Created by FMMac on 2019/4/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIView+Seek.h"

@implementation UIView (Seek)

- (UIViewController * __nullable)controller {
    return (UIViewController *)[self responderOfClassName:@"UIViewController"];
}

- (UIViewController * __nullable)navigationController {
    return (UINavigationController *)[self responderOfClassName:@"UINavigationController"];
}

- (UITableView * __nullable)tableView {
    return (UITableView *)[self superViewOfClassName:@"UITableView"];
}

- (UICollectionView * __nullable)collectionView {
    return (UICollectionView *)[self superViewOfClassName:@"UICollectionView"];
}


#pragma mark ——— Private Interface

- (UIResponder * __nullable)responderOfClassName:(NSString * _Nonnull)className {
    if (!self) return nil;
    
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
    if (!self) return nil;
    
    UIView *superView = self;
    while (![superView isKindOfClass:NSClassFromString(className)] && superView) {
        superView = [superView superview];
        if (!superView)  return nil;
    }
    return superView;
}

@end
