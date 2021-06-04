//
//  UIView+Seek.h
//  Chain-Master
//
//  Created by admin 2019/4/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Seek)

- (UIViewController * __nullable)viewController;

- (UIViewController * __nullable)cv_controller;

- (UINavigationController * __nullable)cv_navigationController;

- (UITableView * __nullable)cv_tableView;

- (UICollectionView * __nullable)cv_collectionView;

@end
