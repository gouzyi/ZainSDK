//
//  UIImage+YXAddition.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/16.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YXAddition)

+ (UIImage *)yx_createImageWithColor:(UIColor *)color;

+ (UIImage *)yx_createImageWithColor:(UIColor *)color
                               bounds:(CGRect)bounds;


@end

NS_ASSUME_NONNULL_END
