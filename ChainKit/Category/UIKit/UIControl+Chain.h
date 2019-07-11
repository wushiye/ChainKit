//
//  UIControl+Chain.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import "ChainBlockType.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIControl (Chain)

+ (UIControl* (^)(void))cc_control;

/**
 同一个UIControl子类对象只同时存在一个Block回调，添加新会移除上次的Block，传空(nil)将释放Block
 
 @return 返回block定义
 */
- (CCSetActionEventsCompleted)cc_setActionEventsCallback;

- (CCActionEventsHandleCallback)cc_addTargetActionEvents;

- (CCActionEventsHandleCallback)cc_removeTargetActionEvents;


- (UIControl* (^)(BOOL))cc_enabled;

- (UIControl* (^)(BOOL))cc_selected;

@end

NS_ASSUME_NONNULL_END
