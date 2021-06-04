//
//  UILabel+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/17.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Chain)

+ (UILabel* (^)(void))cl_label;

- (CLStringHandleCallback)cl_text;

- (UILabel* (^)(NSTextAlignment))cl_textAlignment;

- (CLRGBColorHandleCallback)cl_textColorRGB;

- (CLColorHandleCallback)cl_textColor;

- (CLValueHandleCallback)cl_fontSize;

@end

NS_ASSUME_NONNULL_END
