//
//  YXRouterConst.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "YXRouterConst.h"

#pragma mark - KEY

// 返回到指定的ViewController
// 参数格式: @{YXRouterBackPageController: @"vc字符串"}
// @{YXRouterBackPageController: vc实例对象}
NSString *const YXRouterBackPageController = @"YXRouterBackPageController";
// 返回到指定索引的ViewController
// 传参: @{YXRouterBackIndex: @(2)}
// @{YXRouterBackIndex: YXRouterBackRoot} :表示返回根视图控制器
NSString *const YXRouterBackIndex = @"YXRouteRBackIndex";
// 跳转是否带动画: 默认YES
NSString *const YXRouterAnimated = @"YXRouterAnimated";

// 返回到指定控制器并且偏移(例如: controllers = [a, b, c, d])
// [YXRouter openURL:kJSDVCRouteSegueBack parameters:@{kJSDVCRouteBackPage: @"JSDLoginVC", kJSDVCRouteBackPageOffset:@(1)}];
NSString *const YXRouterBackPageOffset = @"YXRouterBackPageOffset";
// 处理外部跳转到App
NSString *const YXRouterFromOutside = @"YXRouterFromOutside";
// 指定需要登录才能跳转的界面
NSString *const YXRouterNeedLogin = @"YXRouterNeedLogin";
// 模态弹出(Modal) 时是否需要导航控制器 默认:NO
NSString *const YXRouterSegueModalNeedNavi = @"YXRouterSegueModalNeedNavi";


#pragma mark - 传参KEY
NSString *const YXControllerNameKey = @"viewController";
NSString *const YXClassTitleKey = @"title";
NSString *const YXClassNeedLoginKey = @"need_login";

#pragma mark - VALUE
// 返回根视图控制器
NSString *const YXRouterBackRoot = @"root";

#pragma mark - 路由模式
NSString *const YXDefaultRouterScheme = @"ZainSDKExample";


#pragma mark - APP路由表
// 导航push
NSString *const YXRouterNavPush = @"/nav_push/:viewController/:title";
// 模态弹出
NSString *const YXRouterModalPresent = @"/modal_present/:viewController/:title";
// StoryBoard
NSString *const YXRouterStoryBoardSegue = @"/storyboard_segue/:viewController/:title";
// 返回
NSString *const YXRouterSegueBack = @"/back";
// 跳转指定下导航 TabBar Item
NSString *const YXRouterTabbarItem = @"/tabbar/:index";


#pragma mark - Tabbar
NSString *const YXRouterTabBarOne = @"/tabbar/0";
NSString *const YXRouterTabBarTwo = @"/tabbar/1";
NSString *const YXRouterTabBarThree = @"/tabbar/2";
NSString *const YXRouterTabBarFour = @"/tabbar/3";


#pragma mark - ViewController
NSString *const OneVc = @"OneViewController";
