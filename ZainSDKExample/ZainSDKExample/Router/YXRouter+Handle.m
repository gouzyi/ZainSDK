//
//  YXRouter+Handle.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "YXRouter+Handle.h"

#define IsEmptyString(s) !((s == nil || [s isKindOfClass:[NSNull class]] || ([s isKindOfClass:[NSString class]] && s.length == 0)))

@implementation YXRouter (Handle)

+ (void)load {
    
    [self performSelectorOnMainThread:@selector(registerRouter) withObject:nil waitUntilDone:false];
}

+ (void)registerRouter {
    
    // 导航push
    [self addRoute:YXRouterNavPush
            scheme:YXDefaultRouterScheme
           handler:^BOOL(NSDictionary *parameters) {
        
        [self executeRouterWithPresent:NO parameters:parameters];
        return YES;
    }];
    // 模态弹出modal
    [self addRoute:YXRouterModalPresent
            scheme:YXDefaultRouterScheme
           handler:^BOOL(NSDictionary *parameters) {
        
        [self executeRouterWithPresent:YES parameters:parameters];
        return YES;
    }];

    // 点击TabBar
    [self addRoute:YXRouterTabbarItem
            scheme:YXDefaultRouterScheme
           handler:^BOOL(NSDictionary *parameters) {
        
        [self executeTabBarRouter:parameters];
        return YES;
    }];
    
    // 返回
    [self addRoute:YXRouterSegueBack
            scheme:YXDefaultRouterScheme
           handler:^BOOL(NSDictionary *parameters) {
        [self executeBackRouterWithParameters:parameters];
        return YES;
    }];
}

+ (void)executeRouterWithPresent:(BOOL)present parameters:(NSDictionary *)parameters {
    
    NSString *classString = parameters[YXControllerNameKey];
    UIViewController *targetVC = [NSClassFromString(classString) new];
    if (!targetVC) {
        return;
    }
    // 设置变量
    [self setupParameters:parameters forViewController:targetVC];
    
    UIViewController *currentVC = [UIViewController yx_currentViewController];

    BOOL animated = parameters[YXRouterAnimated] ? [parameters[YXRouterAnimated] boolValue] : YES;
    
    if (currentVC && currentVC.navigationController) {
        if (!present) {
            
            [currentVC.navigationController pushViewController:targetVC animated:animated];
            
        } else {
            
            BOOL needNavigation = parameters[YXRouterSegueModalNeedNavi] ? parameters[YXRouterSegueModalNeedNavi] : NO;

            if (needNavigation) {
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:targetVC];
                [currentVC presentViewController:nav animated:animated completion:nil];
            } else {
                [currentVC presentViewController:targetVC animated:animated completion:nil];
            }
        }
        
    } else {
        // 没有导航不做处理, 抛出日志
        NSLog(@"=============没有找到导航控制器=============");
        
    }
}
+ (void)executeBackRouterWithParameters:(NSDictionary *)parameters {
    
    BOOL animated = parameters[YXRouterAnimated] ? [parameters[YXRouterAnimated] boolValue] : YES;
     // 指定返回个数, 优先处理此参数
    NSString *backIndexString = parameters[YXRouterBackIndex] ? [NSString stringWithFormat:@"%@",parameters[YXRouterBackIndex]] : nil;
    // 指定返回到某个页面,
    id backPage = parameters[YXRouterBackPageController] ? parameters[YXRouterBackPageController] : nil;
    // 指定返回到的页面并进行偏移
    NSInteger backPageOffset = parameters[YXRouterBackPageOffset] ? [parameters[YXRouterBackPageOffset] integerValue] : 0;
    // 当前vc
    UIViewController *currentVC = [UIViewController yx_currentViewController];
    UINavigationController *nav = currentVC.navigationController;

    if (!nav) {
        [currentVC dismissViewControllerAnimated:animated completion:nil];
        return;
    }
    if (IsEmptyString(backIndexString)) {
        // 返回到指定索引位置
        if ([backIndexString isEqualToString:YXRouterBackRoot]) {
            // 返回根视图
            [nav popToRootViewControllerAnimated:animated];
        } else {
            NSInteger backIndex = [backIndexString integerValue];
            NSMutableArray *controllers = nav.viewControllers.mutableCopy;
            if (controllers.count > backIndex) {
                [controllers removeObjectsInRange:NSMakeRange(backIndex + 1, controllers.count - backIndex - 1)];
                [nav setViewControllers:controllers animated:animated];
            }
        }
        
    } else if (backPage) {
        // 返回到指定controller
        NSMutableArray *controllers = nav.viewControllers.mutableCopy;
        NSInteger pageIndex = NSNotFound;
        if ([backPage isKindOfClass:[NSString class]]) {
            for (int i = 0; i < controllers.count; i ++) {
                if ([controllers[i] isKindOfClass:NSClassFromString(backPage)]) {
                    pageIndex = i;
                    break;
                }
            }
        }
        if (pageIndex != NSNotFound) {
            NSUInteger backIndex = (controllers.count - 1) - pageIndex + backPageOffset;
            if (controllers.count > backIndex) {
                [controllers removeObjectsInRange:NSMakeRange(controllers.count - backIndex, backIndex)];
                [nav setViewControllers:controllers animated:animated];
            }
        }
    } else {
        [nav popViewControllerAnimated:animated];
    }
}

+ (void)executeTabBarRouter:(NSDictionary *)parameters {
    
    NSUInteger index = [parameters[@"index"] integerValue];
    UITabBarController *currentVC = (UITabBarController *)[UIViewController yx_currentViewController];
    
    if ([currentVC isKindOfClass:[UITabBarController class]] && index >= 0 && currentVC.viewControllers.count >= index) {
        UIViewController *indexVC = currentVC.viewControllers[index];
        if ([indexVC isKindOfClass:[UINavigationController class]]) {
            indexVC = ((UINavigationController *)indexVC).topViewController;
        }
        //传参
        [self setupParameters:parameters forViewController:indexVC];
        currentVC.selectedIndex = index;
    } else if ([currentVC isKindOfClass:[UIViewController class]] && index >= 0) {
        
        if (currentVC.tabBarController.viewControllers.count >= index) {
            currentVC.tabBarController.selectedIndex = index;
        }
    }
}


#pragma mark - 设置控制器参数
+ (void)setupParameters:(NSDictionary *)parameters
      forViewController:(UIViewController *)controller {
    
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        BOOL hasKey = [controller respondsToSelector:NSSelectorFromString(key)];
        BOOL notNil = parameters[key] != nil;
        if (hasKey && notNil) {
            [controller setValue:obj forKey:key];
        }
    }];
    
}

@end
