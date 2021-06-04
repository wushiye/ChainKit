//
//  NSObject+Chain.h
//  Chain-Master
//
//  Created by admin 2019/3/23.
//  Copyright © 2019 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Chain)

typedef void (^COMethodSignatureHandleCallback)(SEL, NSArray * __nullable);

- (COMethodSignatureHandleCallback)co_performSelectorByArguments;

typedef BOOL (^COJudgeClassKindCallback)(Class __nullable);
- (COJudgeClassKindCallback)co_isKindOfClass;

typedef BOOL (^COIsKindOfClassHandleCallback)(NSString * __nullable);
- (COIsKindOfClassHandleCallback)co_isKindOfClassName;


typedef NSString * _Nullable (^COClassNameBlock)(void);

+ (COClassNameBlock)co_className;

- (COClassNameBlock)co_className;

@end

NS_ASSUME_NONNULL_END
