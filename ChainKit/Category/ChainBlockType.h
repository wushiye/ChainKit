//
//  ChainBlockType.h
//  Chain-Master
//
//  Created by FMMac on 2019/3/18.
//  Copyright © 2019 apple. All rights reserved.
//

#ifndef ChainBlockType_h
#define ChainBlockType_h

#import <UIKit/UIKit.h>

typedef UIView* _Nonnull (^CVRGBAColorHandleCallback)(CGFloat, CGFloat, CGFloat, CGFloat);

typedef UIView* _Nonnull (^CVRGBColorHandleCallback)(CGFloat, CGFloat, CGFloat);

typedef UIView* _Nonnull (^CVColorHandleCallback)(UIColor * __nullable);

typedef UIView* _Nonnull (^CVRectHandleCallback)(CGFloat, CGFloat, CGFloat, CGFloat);

typedef UIView* _Nonnull (^CVFrameHandleCallback)(CGRect);

typedef UIView* _Nonnull (^CVValueHandleCallback)(CGFloat);

typedef UIView* _Nonnull (^CVContentModeHandleCallback)(UIViewContentMode);

typedef UIView* _Nonnull (^CVAddSubviewHandleCallback)(UIView * _Nonnull);

typedef UIView* _Nonnull (^CVAddSubviewsHandleCallback)(NSArray<UIView * > * _Nonnull);

typedef UIView* _Nonnull (^CVAddEndEditingHandleCallback)(void);

typedef UIView* _Nonnull (^CVJudgeBOOLHandleCallback)(BOOL);

typedef UIView* _Nonnull (^CVHexColorStringHandleCallback)(NSString * __nullable);

typedef UIView* _Nonnull (^CVTagHandleCallback)(NSInteger);


typedef UIButton* _Nonnull (^CBRGBColorHandleCallback)(CGFloat, CGFloat, CGFloat);

typedef UIButton* _Nonnull (^CBRGBColorForStateHandle)(CGFloat, CGFloat, CGFloat, UIControlState);

typedef UIButton* _Nonnull (^CBColorForStateHandle)(UIColor * __nullable, UIControlState);

typedef UIButton* _Nonnull (^CBStringHandleCallback)(NSString * __nullable);

typedef UIButton* _Nonnull (^CBContentForStateHandle)(NSString * __nullable, UIControlState);

typedef UIButton* _Nonnull (^CBColorHandleCallback)(UIColor * __nullable);

typedef UIButton* _Nonnull (^CBValueHandleCallback)(CGFloat);

typedef UIButton* _Nonnull (^CBActionHandleCallback)(id __nullable, NSString * _Nonnull);

typedef UIButton* _Nonnull (^CBBOOLValueHandleCallback)(BOOL);


typedef UILabel* _Nonnull (^CLRGBColorHandleCallback)(CGFloat, CGFloat, CGFloat);

typedef UILabel* _Nonnull (^CLStringHandleCallback)(NSString * __nullable);

typedef UILabel* _Nonnull (^CLColorHandleCallback)(UIColor * __nullable);

typedef UILabel* _Nonnull (^CLValueHandleCallback)(CGFloat);


typedef UIColor* _Nonnull (^CColorRGBAHandleCallback)(CGFloat, CGFloat, CGFloat, CGFloat);

typedef UIColor* _Nonnull (^CCHexColorHandleCallback)(NSString * __nullable);

typedef BOOL (^CBBOOLHandleCallback)(void);

typedef void (^CHandleCallback)(void);


typedef UITextField* _Nonnull (^CTFHandleCallback)(void);

typedef UITextField* _Nonnull (^CTFTextColorHandleCallback)(UIColor * __nullable);

typedef UITextField* _Nonnull (^CTFTextHandleCallback)(NSString * __nullable);

typedef UITextField* _Nonnull (^CTFFontHandleCallback)(UIFont * __nullable);

typedef UITextField* _Nonnull (^CTFAttributedStringHandleCallback)(NSAttributedString * __nullable);

typedef UITextField* _Nonnull (^CTFTextColorRGBAHandleCallback)(CGFloat, CGFloat, CGFloat, CGFloat);

typedef UITextField* _Nonnull (^CTFFontSizeHandleCallback)(CGFloat);

typedef UITextField* _Nonnull (^CTFBorderStyleHandleCallback)(UITextBorderStyle);

typedef BOOL (^CTFHasTextHandleCallback)(void);

typedef UITextField* _Nonnull (^CTFClearModeHandleCallback)(UITextFieldViewMode clearButtonMode);

typedef UITextField* _Nonnull (^CTFReturnKeyTypeHandleCallback)(UIReturnKeyType);

typedef UITextField* _Nonnull (^CTFKeyboardTypeHandleCallback)(UIKeyboardType);

typedef void (^CTFControlEventCallback)(UITextField * __nullable);
typedef UITextField* _Nonnull (^CTFAddActionHandleCompleted)(CTFControlEventCallback __nullable);


typedef UIControl* _Nonnull (^CCActionEventsHandleCallback)(id __nullable, NSString * _Nonnull, UIControlEvents);

typedef void (^CCActionEventsCallback)(id _Nonnull);

typedef void (^CCSetActionEventsCompleted)(UIControlEvents, CCActionEventsCallback __nullable);


typedef UIScrollView* _Nonnull (^CSSizeHandleCallback)(CGSize size);

typedef UIScrollView* _Nonnull (^CSPointHandleCallback)(CGPoint);

typedef UIScrollView* _Nonnull (^CSPointaHandleCallback)(CGPoint);

typedef UIScrollView* _Nonnull (^CSBOOLHandleCallback)(BOOL);

typedef UIScrollView* _Nonnull (^CSMoveDidContentOffsetHandleCallback)(CGPoint, BOOL);

typedef UIScrollView* _Nonnull (^CSRefreshControlHandleCallback)(UIRefreshControl * __nullable);

typedef UIScrollView* _Nonnull (^CSHandleCallback)(void);


typedef UITableView* _Nonnull (^CTInitFrameStyleHandleCallback)(CGFloat, CGFloat, CGFloat, CGFloat, UITableViewStyle);

typedef UITableView* _Nonnull (^CTValueHandleCallback)(CGFloat);

typedef UITableView* _Nonnull (^CTDeselectRowHandleCallback)(NSIndexPath * _Nonnull, BOOL);

typedef UITableView* _Nonnull (^CTSeparatorHandleCallback)(UITableViewCellSeparatorStyle);

typedef UITableView* _Nonnull (^CTSeparatorEdgeHandleCallback)(UIEdgeInsets);

typedef UITableView* _Nonnull (^CTSeparatorColorHandleCallback)(UIColor * __nullable);

typedef UITableView* _Nonnull (^CTSeparatorColorRGBAHandleCallback)(CGFloat, CGFloat, CGFloat, CGFloat);


typedef UINavigationItem* _Nonnull (^CNIItemHandleCallback)(UIBarButtonItem * __nullable);

typedef UINavigationItem* _Nonnull (^CNIItemsHandleCallback)(NSArray<UIBarButtonItem *> * __nullable);

typedef UINavigationItem* _Nonnull (^CNIStringHandleCallback)(NSString * __nullable);

//typedef UIBarButtonItem* (^CBBItemActionHandleCallback)(NSString *, id __nullable, SEL _Nonnull);


typedef void (^ __nullable CVCModalHandleCompletion)(void);
typedef void (^CVCModalControllerHandleCallback)(UIViewController * _Nonnull  , BOOL, CVCModalHandleCompletion __nullable);


#endif /* ChainBlockType_h */

