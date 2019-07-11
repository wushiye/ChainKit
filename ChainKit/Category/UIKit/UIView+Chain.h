//
//  UIView+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/18.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Chain)

+ (UIView* (^)(void))cv_view;

+ (UIView* (^)(CGRect))cv_viewWithFrame;

+ (UIView* (^)(CGFloat, CGFloat, CGFloat, CGFloat))cv_viewWithFrameOf;

- (CVFrameHandleCallback)cv_frame;

- (CVRectHandleCallback)cv_frameOf;

- (CVColorHandleCallback)cv_backColor;

- (CVRGBAColorHandleCallback)cv_backColorRGBA;

- (CVHexColorStringHandleCallback)cv_backColorByHexString;

- (CVValueHandleCallback)cv_layerCornerRadius;

- (CVValueHandleCallback)cv_layerBorderWidth;

- (CVRGBColorHandleCallback)cv_layerBorderColorRGB;

- (CVColorHandleCallback)cv_layerBorderColor;

- (CVHexColorStringHandleCallback)cv_layerBorderByHexString;

- (CVJudgeBOOLHandleCallback)cv_clipsToBounds;

- (CVContentModeHandleCallback)cv_contentMode;

- (CVAddSubviewHandleCallback)cv_addSubview;

- (CVAddSubviewsHandleCallback)cv_addSubviews;

- (CVAddEndEditingHandleCallback)cv_endEditing;

- (CVTagHandleCallback)cv_tag;


typedef void (^CTouchEventCallback)(id);
typedef void (^CAddTouchEventCompleted)(CTouchEventCallback __nullable);

- (CAddTouchEventCompleted)cv_touchEventCallback;

@end

NS_ASSUME_NONNULL_END
