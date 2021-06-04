//
//  UIColor+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/28.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Chain)

+ (CColorRGBAHandleCallback)cc_colorByRGBA;

+ (CCHexColorHandleCallback)cc_colorByHexString;

@end

NS_ASSUME_NONNULL_END
