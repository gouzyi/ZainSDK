//
//  Person.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/9.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PresentProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject <PersonDelegate>

@property (nonatomic, weak) id<PersonDelegate>delegate;


@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;


@property (nonatomic, strong) NSMutableArray *arr;

@end

NS_ASSUME_NONNULL_END
