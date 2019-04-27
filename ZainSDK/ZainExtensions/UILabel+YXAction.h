//
//  UILabel+YXAction.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol YXTextTapActionDelegate <NSObject>
@optional
/**
 *  YXTextTapActionDelegate
 *  @param string  点击的字符串
 *  @param range   点击的字符串range
 *  @param index 点击的字符在数组中的index
 */
- (void)yx_attributeTapReturnString:(NSString *)string
                               range:(NSRange)range
                               index:(NSInteger)index;
@end

@interface AttributeTextModel : NSObject

@property (nonatomic, assign) NSRange range;
@property (nonatomic, copy) NSString *str;

@end



@interface UILabel (YXAction)

/**
 *  是否打开点击效果，默认是打开
 */
@property (nonatomic, assign) BOOL enabledTapEffect;

/**
 *  给文本添加点击事件Block回调
 *  @param strings  需要添加的字符串数组
 *  @param tapClick 点击事件回调
 */
- (void)yx_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                  tapClicked:(void (^) (NSString *string, NSRange range, NSInteger index))tapClick;
/**
 *  给文本添加点击事件delegate回调
 *  @param strings  需要添加的字符串数组
 *  @param delegate delegate
 */
- (void)yx_addAttributeTapActionWithStrings:(NSArray <NSString *> *)strings
                                    delegate:(id <YXTextTapActionDelegate> )delegate;




@end

NS_ASSUME_NONNULL_END
