//
//  UIViewController+navigationBar.h
//  CXMerchant
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>



@class YXNavigationBar;

@interface UIViewController (navigationBar)

/** 导航栏view */
@property (nonatomic, strong) YXNavigationBar *yx_navigationBar;
/** 是否支持自定义拖动pop手势 */
- (NSMutableArray *)yx_removeControllers:(NSArray *)controllers;

- (void)yx_pushController:(NSString *)controller animated:(BOOL)animated;




@end

