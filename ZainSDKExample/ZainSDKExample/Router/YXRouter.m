//
//  YXRouter.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/12.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "YXRouter.h"
#import "JLRoutes.h"

#define YXRouterURL(string) [NSURL URLWithString:string]

@implementation YXRouter

+ (BOOL)openURL:(NSString *)url {
    return [self routeURL:[NSURL URLWithString:url] parameters:nil];
}

+ (BOOL)openURL:(NSString *)url parameters:(NSDictionary *)parameters {
    return [self routeURL:[NSURL URLWithString:url] parameters:parameters];
}

+ (void)addRoute:(NSString *)route
          scheme:(NSString *)scheme
         handler:(BOOL (^)(NSDictionary *))handlerBlock {
    [[JLRoutes routesForScheme:scheme] addRoute:route handler:handlerBlock];
}

#pragma mark - JLRoutes Method
+ (BOOL)routeURL:(NSURL *)url parameters:(NSDictionary *)parameters {
    return [JLRoutes routeURL:url withParameters:parameters];
}
@end
