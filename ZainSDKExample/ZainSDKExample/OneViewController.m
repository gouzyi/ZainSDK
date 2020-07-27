//
//  OneViewController.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *parameLab;

@property(nonatomic, strong) void(^callback)(void);
@property(nonatomic, strong) void(^callback2)(NSString * name);

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * age;


@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.name) {
        self.parameLab.text = [NSString stringWithFormat:@"%@ --- %@", self.name, self.age];
    }
    self.navigationController.title = self.title;
}
- (IBAction)clickActionOne:(id)sender {
    if (self.callback) {
        self.callback();
        self.parameLab.text = @"已执行回调函数1";
    } else {
        self.parameLab.text = @"未接收到回调函数1";
    }
    
}
- (IBAction)clickActionTwo:(id)sender {
    
    if (self.callback2) {
        self.callback2(self.name);
        self.parameLab.text = @"已执行回调函数2";
    } else {
        self.parameLab.text = @"未接收到回调函数2";
    }
}
- (IBAction)nextAction:(id)sender {
    [YXRouter openURL:YXGenRouteURL(nil, nil, OneVc, @"Next") parameters:@{@"name":@"詹丹大豆", @"age":@"88"}];
}

- (IBAction)selectItem:(id)sender {
    
    [YXRouter openURL:YXGenTabBarRouteURL(nil, @(1)) parameters:@{@"age":@"11"}];
}
- (IBAction)backAction:(UIButton *)sender {
    
    NSInteger index = sender.tag;
    if (index == 0) {
        [YXRouter openURL:YXGenBackRouteURL(nil) parameters:@{YXRouterBackIndex: YXRouterBackRoot}];
    } else if (index == 1) {
        
        [YXRouter openURL:YXGenBackRouteURL(nil) parameters:@{YXRouterBackPageController: @"ViewController"}];

    } else if ( index == 2) {
        [YXRouter openURL:YXGenBackRouteURL(nil) parameters:@{YXRouterBackIndex: @(1)}];
    }
        
}
- (IBAction)back:(id)sender {
    [YXRouter openURL:YXGenBackRouteURL(nil)];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
