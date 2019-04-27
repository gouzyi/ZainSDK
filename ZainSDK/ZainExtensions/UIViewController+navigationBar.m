//
//  UIViewController+navigationBar.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/15.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>
#import "YXNavigationBar.h"

@implementation UIViewController (navigationBar)

- (YXNavigationBar *)yx_navigationBar {
    YXNavigationBar *navigationBar = objc_getAssociatedObject(self, _cmd);
    if (!navigationBar) {
        navigationBar = [[YXNavigationBar alloc] init];
        objc_setAssociatedObject(self, @selector(yx_navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self.view addSubview:navigationBar];
    }
    return navigationBar;
}

- (void)setYx_navigationBar:(YXNavigationBar *)yx_navigationBar {
    objc_setAssociatedObject(self, @selector(yx_navigationBar), yx_navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableArray *)yx_removeControllers:(NSArray *)controllers {
    
    NSMutableArray *newArr = [NSMutableArray array];
    NSMutableArray *vcArr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    [vcArr enumerateObjectsUsingBlock:^(UIViewController * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [controllers enumerateObjectsUsingBlock:^(UIViewController * viewClass, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isMemberOfClass:[viewClass class]]) {
                [newArr addObject:obj];
            }
        }];
    }];
    [vcArr removeObjectsInArray:newArr];
    return vcArr;
}

- (void)yx_pushController:(NSString *)controller animated:(BOOL)animated {
    [self.navigationController pushViewController:[NSClassFromString(controller)  new] animated:animated];
}

@end
