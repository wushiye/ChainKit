//
//  UIBarButtonItem+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (Chain)

typedef UIBarButtonItem* __nullable (^CBIInitActionHandleCallback)(NSString * __nullable, UIBarButtonItemStyle, id __nullable, NSString * __nullable action);

+ (CBIInitActionHandleCallback)cbi_initWithImageStyleTargetAction;

+ (CBIInitActionHandleCallback)cbi_initWithTitleStyleTargetAction;


typedef void (^ _Nonnull CBITouchActionCallback)(UIBarButtonItem * _Nonnull);
typedef UIBarButtonItem* __nullable (^CBISetActionHandleCompleted)(NSString * __nullable, UIBarButtonItemStyle, CBITouchActionCallback _Nonnull);

+ (CBISetActionHandleCompleted)cbi_initWithImageStyleForTouchCallback;

+ (CBISetActionHandleCompleted)cbi_initWithTitleStyleForTouchCallback;


+ (UIBarButtonItem * __nullable (^)(UIView * _Nonnull))cbi_initWithCustomView;

@end

NS_ASSUME_NONNULL_END
