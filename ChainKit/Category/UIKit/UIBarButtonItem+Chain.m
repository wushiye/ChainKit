//
//  UIBarButtonItem+Chain.m
//  Chain-Master
//
//  Created by admin 2019/3/27.
//  Copyright © 2019 apple. All rights reserved.
//

#import "UIBarButtonItem+Chain.h"
#import <objc/runtime.h>
#import "UIImage+Chain.h"

typedef NS_ENUM(NSUInteger, CBIBarButtonItemType) {
    CBIBarButtonItemTypeTitle,
    CBIBarButtonItemTypeImage
};

@implementation UIBarButtonItem (Chain)

+ (CBIInitActionHandleCallback)cbi_initWithImageStyleTargetAction {
    return self.cbi_initItemActionCompletedForType(CBIBarButtonItemTypeImage);
}

+ (CBIInitActionHandleCallback)cbi_initWithTitleStyleTargetAction {
    return self.cbi_initItemActionCompletedForType(CBIBarButtonItemTypeTitle);
}

+ (CBISetActionHandleCompleted)cbi_initWithImageStyleForTouchCallback {
    return self.cbi_isImageItemActionHandleCompleted(CBIBarButtonItemTypeImage);
}

+ (CBISetActionHandleCompleted)cbi_initWithTitleStyleForTouchCallback {
    return self.cbi_isImageItemActionHandleCompleted(CBIBarButtonItemTypeTitle);
}

+ (UIBarButtonItem * __nullable (^)(UIView * _Nonnull))cbi_initWithCustomView {
    return ^(UIView * _Nonnull customView) {
        return [[self alloc] initWithCustomView:customView];
    };
}

#pragma mark ——— <Private Interface>

+ (CBIInitActionHandleCallback (^)(CBIBarButtonItemType))cbi_initItemActionCompletedForType {
    return ^(CBIBarButtonItemType barButtonItemType) {
        return ^(NSString * __nullable name, UIBarButtonItemStyle style, id __nullable target, NSString* __nullable actionNamed) {
            UIBarButtonItem *barButtonItem;
            if (barButtonItemType == CBIBarButtonItemTypeImage) {
                barButtonItem = [[self alloc] initWithImage:UIImage.ci_imageNamed(name) style:style\
                                                                target:target action:NSSelectorFromString([actionNamed copy])];
            } else {
                barButtonItem = [[self alloc] initWithTitle:name style:style\
                                                                target:target action:NSSelectorFromString([actionNamed copy])];
            }
            return barButtonItem;
        };
    };
}


typedef CBISetActionHandleCompleted (^CBIItemActionHandleCompleted)(CBIBarButtonItemType);

+ (CBIItemActionHandleCompleted)cbi_isImageItemActionHandleCompleted {
    
    return ^(CBIBarButtonItemType barButtonItemType) {
        
        return ^(NSString * __nullable name, UIBarButtonItemStyle style, CBITouchActionCallback _Nonnull touchActionCallback) {
            UIBarButtonItem *item = nil;
            if (!name.length || ![name isKindOfClass:[NSString class]]) return item;
            
            switch (barButtonItemType) {
                case CBIBarButtonItemTypeImage: {
                    UIImage *image = UIImage.ci_imageNamed([name copy]);
                    if (!image) return item;
                    
                    item = [[self alloc] init];
                    item.image = image;
                    item.action = @selector(cbi_imageBarButtonItemAction:);
                    break;
                }
                case CBIBarButtonItemTypeTitle: {
                    item = [[self alloc] init];
                    item.title = [name copy];
                    item.action = @selector(cbi_titleBarButtonItemAction:);
                    break;
                }
            }
            if (!item) return item;
            
            item.style = style;
            item.target = item;
            SEL callbackKey = [item cbi_callbackKeyForBarButtonItemType:barButtonItemType];
            objc_setAssociatedObject(item, callbackKey, touchActionCallback, OBJC_ASSOCIATION_COPY);
            
            return item;
        };
    };
}

- (void)cbi_imageBarButtonItemAction:(UIBarButtonItem *)item {
    CBITouchActionCallback touchActionCallback = [self cbi_touchActionCallbackOf:item forBarButtonItemType:CBIBarButtonItemTypeImage];
    !touchActionCallback ?: touchActionCallback(item);
}

- (void)cbi_titleBarButtonItemAction:(UIBarButtonItem *)item {
    CBITouchActionCallback touchActionCallback = [self cbi_touchActionCallbackOf:item forBarButtonItemType:CBIBarButtonItemTypeTitle];
    !touchActionCallback ?: touchActionCallback(item);
}

- (CBITouchActionCallback)cbi_touchActionCallbackOf:(UIBarButtonItem *)item forBarButtonItemType:(CBIBarButtonItemType)barButtonItemType {
    SEL callbackKey = [self cbi_callbackKeyForBarButtonItemType:barButtonItemType];
    return objc_getAssociatedObject(item, callbackKey);
}

- (SEL)cbi_callbackKeyForBarButtonItemType:(CBIBarButtonItemType)barButtonItemType {
    switch (barButtonItemType) {
        case CBIBarButtonItemTypeImage: {
            return @selector(cbi_initWithImageStyleForTouchCallback);
        }
        case CBIBarButtonItemTypeTitle: {
            return @selector(cbi_initWithTitleStyleForTouchCallback);
        }
    }
}

@end
