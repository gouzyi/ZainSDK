//
//  MBProgressHUD+YXAddition.m
//  CXMerchant
//
//  Created by zainguo on 2019/3/16.
//  Copyright © 2019年 zainguo. All rights reserved.
//

#import "MBProgressHUD+YXAddition.h"

static MBProgressHUD *_hud;

#import "MBProgressHUD.h"

@implementation MBProgressHUD (YXAddition)

#pragma mark 显示带图片或者不带图片的信息
+ (void)pm_showMessage:(NSString *)message icon:(NSString *)icon view:(UIView *)view {
    
    [self yx_hudDismiss];
    
    if (!view) {
        view = [UIApplication sharedApplication].delegate.window;
    }
    // 快速显示一个提示信息
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // 判断是否显示图片
    if (!icon) {
        _hud.mode = MBProgressHUDModeText;
        
    } else{
        // 设置图片
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]];
        img = img == nil ? [UIImage imageNamed:icon] : img;
        _hud.customView = [[UIImageView alloc] initWithImage:img];
        // 再设置模式
        _hud.mode = MBProgressHUDModeCustomView;
    }
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    //设置等待框背景色为黑色
    _hud.bezelView.backgroundColor = [UIColor blackColor];
    _hud.detailsLabel.textColor = [UIColor whiteColor];
    // 隐藏时候从父控件中移除
    _hud.removeFromSuperViewOnHide = YES;
    _hud.detailsLabel.text = message;
    // 指定时间之后再消失
    [_hud hideAnimated:YES afterDelay:HUDTime];
}


/// 文字提示 显示时间为2妙
+ (void)yx_showMessage:(NSString *)message {
    [self pm_showMessage:message icon:nil view:nil];
}

/// 文字提示显示到指定View
+ (void)yx_showMessage:(NSString *)message toView:(UIView *)view {
    [self pm_showMessage:message icon:nil view:view];
}

+ (void)yx_showLodingWithMessage:(NSString *)message toView:(UIView *)view {
    
    
    [self yx_hudDismiss];
    if (!view) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    if (@available(iOS 9.0, *)) {
        [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    } else {
        [UIActivityIndicatorView appearanceWhenContainedIn:[MBProgressHUD class], nil].color = [UIColor whiteColor];
    }
    // 快速显示一个提示信息
    _hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    _hud.detailsLabel.text = message;
    // 再设置模式
    _hud.mode = MBProgressHUDModeIndeterminate;
    // 隐藏时候从父控件中移除
    _hud.removeFromSuperViewOnHide = YES;
    //设置等待框背景色为黑色
    _hud.bezelView.backgroundColor = [UIColor blackColor];
    _hud.detailsLabel.textColor = [UIColor whiteColor];
    
    
    
}

/// 加载文字提示 显示时间为2妙
+ (void)yx_showLodingWithMessage:(NSString *)message {
    [self yx_showLodingWithMessage:message toView:nil];
}


/// 错误提示
+ (void)yx_showError:(NSString *)error {
    [self yx_showError:error toView:nil];
    
}
/// 错误提示到指定的View
+ (void)yx_showError:(NSString *)error toView:(UIView *)view {
    [self pm_showMessage:error icon:@"error.png" view:view];
    
}

/// 成功提示
+ (void)yx_showSuccess:(NSString *)success {
    [self yx_showSuccess:success toView:nil];

}
/// 成功提示到指定的View
+ (void)yx_showSuccess:(NSString *)success toView:(UIView *)view {
    [self pm_showMessage:success icon:@"success.png" view:view];

}

/// 显示带图片和文字
+ (void)yx_showMessageWith:(NSString *)imageName
                   message:(NSString *)message
                    toView:(UIView *)view {
    [self pm_showMessage:message icon:imageName view:view];
    
}


/// 加载提示
+ (void)yx_showLoding {
    [self yx_showLodingWithMessage:nil toView:nil];
    
    
}

/// 指定view加载显示loding
+ (void)yx_showLodingtoView:(UIView *)view {
    [self yx_showSuccess:nil toView:view];
    
}


/// 移除
+ (void)yx_hudDismiss {
    
    [_hud hideAnimated:YES];
    [_hud removeFromSuperview];
    _hud = nil;
    
}





@end
