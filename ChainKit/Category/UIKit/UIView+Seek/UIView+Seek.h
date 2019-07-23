//
//  UIView+Seek.h
//  Chain-Master
//
//  Created by FMMac on 2019/4/15.
//  Copyright © 2019 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Seek)

- (UIViewController * __nullable)controller;

- (UIViewController * __nullable)navigationController;

- (UITableView * __nullable)tableView;

- (UICollectionView * __nullable)collectionView;

@end
