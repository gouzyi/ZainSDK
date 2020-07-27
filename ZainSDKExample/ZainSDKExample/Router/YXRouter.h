//
//  YXRouter.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface YXRouter : NSObject
//调用 Router
+ (BOOL)openURL:(NSString *)url;
+ (BOOL)openURL:(NSString *)url parameters:(NSDictionary *)parameters;

//注册 Router, 调用 Router 时会触发的回调
+ (void)addRoute:(NSString *)route
          scheme:(NSString *)scheme
         handler:(BOOL(^)(NSDictionary *parameters))handlerBlock;
// 注册
+ (BOOL)routeURL:(NSURL *)url parameters:(NSDictionary *)parameters;

@end

