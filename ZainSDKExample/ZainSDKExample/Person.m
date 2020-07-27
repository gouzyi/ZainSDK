//
//  Person.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - PersonDelegate

- (void)didClickButtonWithNum:(NSString *)num indexPath:(NSIndexPath *)indexPath {
    Person *p = self.arr[indexPath.row];
    p.age = [num integerValue];
    NSLog(@"--------");
}

- (NSMutableArray *)arr {
    if (!_arr) {
        _arr = [NSMutableArray array];
    }
    return _arr;
}

@end
