//
//  ViewController.m
//  ZainSDKExample
//
//  Created by zainguo on 2019/4/27.
//  Copyright © 2019 zainguo. All rights reserved.
//


#import "ViewController.h"

#import "ZainSDKMacro.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL phone = isIPhoneX();
    [MBProgressHUD yx_showMessage:@"my is a hud"];
    
    
    
}



@end
