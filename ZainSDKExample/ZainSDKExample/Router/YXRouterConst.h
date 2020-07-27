//
//  YXRouterConst.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - KEY
// 模态弹出(Modal) 时是否需要导航控制器 默认:NO
extern NSString *const YXRouterSegueModalNeedNavi;

#pragma mark - 返回
// 返回到指定的ViewController
// 参数格式: @{YXRouterBackPageController: @"vc字符串"}
// @{YXRouterBackPageController: vc实例对象}
extern NSString *const YXRouterBackPageController;
// 返回到指定索引的ViewController
// 传参: @{YXRouterBackIndex: @(2)}
// @{YXRouterBackIndex: YXRouterBackRoot} :表示返回根视图控制器
extern NSString *const YXRouterBackIndex;
// 跳转是否带动画: 默认YES
extern NSString *const YXRouterAnimated;
// 返回到指定控制器并且偏移
extern NSString *const YXRouterBackPageOffset;

#pragma mark - 传参KEY
// 导航标题
extern NSString *const YXClassTitleKey;
// controller
extern NSString *const YXControllerNameKey;


#pragma mark - VALUE
// 返回根视图控制器
extern NSString *const YXRouterBackRoot;

#pragma mark - 路由模式

extern NSString *const YXDefaultRouterScheme;



#pragma mark - APP路由表
// 导航push
extern NSString *const YXRouterNavPush;
// 模态弹出
extern NSString *const YXRouterModalPresent;
// StoryBoard
extern NSString *const YXRouterStoryBoardSegue;
// 返回
extern NSString *const YXRouterSegueBack;
// 跳转指定下导航
extern NSString *const YXRouterTabbarItem;



#pragma mark - Tabbar
extern NSString *const YXRouterTabBarOne;
extern NSString *const YXRouterTabBarTwo;
extern NSString *const YXRouterTabBarThree;
extern NSString *const YXRouterTabBarFour;

#pragma mark - ViewController
extern NSString *const OneVc;



NS_ASSUME_NONNULL_END
