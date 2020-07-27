//
//  ViewController.m
//  ZainSDKExample
//
//  Created by zainguo on 2019/4/27.
//  Copyright © 2019 zainguo. All rights reserved.
//


#import "ViewController.h"

#import "ZainSDKMacro.h"

#import "Person.h"

#import "ZainCell.h"

#import "YXRouter.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) YXDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL phone = isIPhoneX();
    KLOG(@"------------>%d",phone);
    [MBProgressHUD yx_showMessage:@"my is a hud"];
    
    Person *person = [[Person alloc] init];
    
    for (NSInteger i = 0; i < 10; i ++) {
        Person *p = [[Person alloc] init];
        p.name = [NSString stringWithFormat:@"我是%2d", i];
        p.age = i + 5;
        [person.arr addObject:p];
    }
    Person *p1 = [Person new];
    p1.name = @"Push传参 + CallBack";
    [person.arr addObject:p1];

    Person *p2 = [Person new];
    p2.name = @"Modal传参 + CallBack";
    [person.arr addObject:p2];
    
    Person *p3 = [Person new];
    p3.name = @"切换TabBar index 到 Item3";
    [person.arr addObject:p3];
    
    
    __weak typeof(self) weakSelf = self;
    self.dataSource = [[YXDataSource alloc] initWithIdentifier:NSStringFromClass([ZainCell class]) configureCellBlock:^(ZainCell *  _Nullable cell, Person  * _Nonnull model, NSIndexPath * _Nullable indexPath) {
        __strong typeof(self) strongSelf = weakSelf;
        cell.textLabel.text = model.name;
        cell.addBtn.tag = indexPath.row;
        cell.numLab.text = [NSString stringWithFormat:@"%d", model.age];
        cell.delegate = person;
    } didSelectCellBlock:^(id  _Nonnull cell, id  _Nonnull model, NSIndexPath * _Nonnull indexpath) {
        if (indexpath.row == 10) {
            void (^callback)(void) = ^{
                NSLog(@"执行回调函数");
            };
            void (^callback2)(NSString *) = ^(NSString *name) {
                         NSLog(@"执行回调函数2, 我是%@", name);
            };
            [YXRouter openURL:YXGenRouteURL(nil, nil, OneVc, @"我是标题") parameters:@{@"name":@"李四", @"age": @(18), @"callback": callback, @"callback2":callback2}];
            
        } else if (indexpath.row == 11) {
            void (^callback2)(NSString *) = ^(NSString *name) {
                NSLog(@"执行回调函数2, 我是%@", name);
            };
            [YXRouter openURL:YXGenRouteURL(nil, YXRouterModalPresent, OneVc, @"Modal Present") parameters:@{@"name":@"李四", @"age": @(18),@"callback2":callback2, YXRouterSegueModalNeedNavi:@1}];
            
        } else if (indexpath.row == 12) {
            NSString *url = [NSString stringWithFormat:@"%@:/%@/2", YXDefaultRouterScheme,YXRouterTabbarItem];
            [YXRouter openURL:YXGenTabBarRouteURL(nil, @(2))];
            
//            [YXRouter openURL:YXGenRouteURL(nil, YXRouterTabbarItem, @"Item3", @"Modal ") parameters:@{@"name":@"李四", @"age": @(18), }];

        }
    }];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ZainCell" bundle:nil] forCellReuseIdentifier:@"ZainCell"];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    [self.dataSource addDataArr:person.arr];
    
    

}



@end
