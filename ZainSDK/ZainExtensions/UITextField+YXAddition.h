//
//  UITextField+YXAddition.h
//  ZainGuoSDK
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (YXAddition)
/**
 限制输入框文字个数
 */
@property (nonatomic, assign) NSInteger limitCount;
/**
 站位颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;
/**
 禁止输入空格
 */
@property (nonatomic, assign) BOOL forbiddenSpace;

@end

NS_ASSUME_NONNULL_END
