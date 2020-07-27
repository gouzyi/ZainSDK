//
//  YXRouter+GeneratURL.h
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/13.
//  Copyright © 2020 zainguo. All rights reserved.
//




#import "YXRouter.h"
 
// scheme: nil: 为默认
// pattern: 进栈方式: 默认Push
// controller: 目标控制器
// title: 目标控制器导航标题
#undef YXGenRouteURL
#define YXGenRouteURL(scheme, pattern, controller, title) \
[NSString stringWithFormat:@"%@:/%@", scheme ? :YXDefaultRouterScheme, \
YXGenRoutPath(pattern, controller, title)]


#undef YXGenTabBarRouteURL
#define YXGenTabBarRouteURL(scheme, index) \
[NSString stringWithFormat:@"%@://tabbar/%@", scheme ? :YXDefaultRouterScheme, index]

#undef YXGenBackRouteURL
#define YXGenBackRouteURL(scheme) \
[NSString stringWithFormat:@"%@://back", \
scheme ? :YXDefaultRouterScheme]


#undef YXGenRoutPath
#define YXGenRoutPath(pattern, controller, title) \
[YXRouter yx_generatedURLWithPattern:pattern parameters:@[controller, title]]





@interface YXRouter (GeneratURL)

/// 生成路由URL
/// @param pattern 路由表: 默认: Push
/// @param parameters @{controller, title}
/// controller: 目标控制器 title: 导航标题
+ (NSString *)yx_generatedURLWithPattern:(NSString *)pattern
                              parameters:(NSArray *)parameters;

///  解析NSURL对象中的请求参数
///  http://madao?param1=value1&param2=value2 解析成 @{param1:value1, param2:value2}
/// @param url NSURL对象
+ (NSDictionary *)yx_parseURL:(NSURL *)url;

/// 将参数对象进行url编码
///  将@{param1:value1, param2:value2} 转换成 ?param1=value1&param2=value2
/// @param dictionary 参数对象
+ (NSString *)yx_mapDictionaryToURLQueryString:(NSDictionary *)dictionary;


@end

