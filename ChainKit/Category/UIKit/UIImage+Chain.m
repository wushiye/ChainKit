//
//  UIImage+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/24.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIImage+Chain.h"

@implementation UIImage (Chain)

+ (CIMGMakeHandleCallback)ci_imageNamed {
    return ^(NSString * __nullable imageNamed) {
        UIImage *image = [self imageNamed:[imageNamed copy]];
        return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    };
}

@end
