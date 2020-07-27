//
//  UIViewController+Addition.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "UIViewController+Addition.h"



@implementation UIViewController (Addition)

+ (UIViewController *)yx_currentViewController {
    
    UIViewController *currVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    while (YES) {
        if (currVC.presentedViewController) {
            currVC = currVC.presentedViewController;
        } else {
            if ([currVC isKindOfClass:[UINavigationController class]]) {
                currVC = ((UINavigationController *)currVC).visibleViewController;
            } else if ([currVC isKindOfClass:[UITabBarController class]]) {
                currVC = ((UITabBarController* )currVC).selectedViewController;
            } else {
                break;
            }
        }
    }
    return currVC;
}

@end
