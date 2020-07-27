//
//  YXRouter+GeneratURL.m
//  ZainSDKExample
//
//  Created by zainguo on 2020/3/13.
//  Copyright © 2020 zainguo. All rights reserved.
//

#import "YXRouter+GeneratURL.h"
#import <JLRoutes/JLRRouteDefinition.h>



@implementation YXRouter (GeneratURL)

+ (NSString *)yx_generatedURLWithPattern:(NSString *)pattern
                              parameters:(NSArray *)parameters {
    
    return [YXRouter yx_generatedURLWithPattern:pattern parameters:parameters extra:nil];
}

+ (NSString *)yx_generatedURLWithPattern:(NSString *)pattern
                              parameters:(NSArray *)parameters
                                   extra:(NSDictionary *)extra {
    // 创建路由
    JLRRouteDefinition *route = [[JLRRouteDefinition alloc]
                                 initWithPattern:pattern ? :YXRouterNavPush
                                 priority:0
                                 handlerBlock:nil];
    
    NSArray *patternComponents;
    
    @try {
        patternComponents = route.patternPathComponents;
    } @catch (NSException *exception) {
        return nil;
    } @finally {}
    
    NSUInteger index = 0;
    NSMutableArray *routeValues = [NSMutableArray array];
    
    for(NSString *patternComponent in patternComponents) {
        
        NSString *URLComponent;
        if (index < parameters.count) {
            
            URLComponent = parameters[index];
            
        } else if ([patternComponent isEqualToString:@"*"]) {
            // 模糊匹配
            // match /foo by /foo/*
            URLComponent = parameters.lastObject;
          
            
        }
        if ([patternComponent hasPrefix:@":"]) {
            
            @try {
                NSString *variableValue = [route routeVariableValueForValue:URLComponent];
                [routeValues addObject:variableValue];
                
            } @catch (NSException *exception) {
            } @finally {}
            
            index ++;
            
        } else if ([patternComponent isEqualToString:@"*"]) {
            NSUInteger minRequiredParams = index;
            
            if (parameters.count >= minRequiredParams) {
                
                // match: /a/b/c/* has to be matched by at least /a/b/c
                [routeValues addObjectsFromArray:[parameters subarrayWithRange:NSMakeRange(index, parameters.count - index)]];
            }
            
        } else {
            // 静态参数值
            [routeValues addObject:patternComponent];
        }
    }
    if (routeValues && routeValues.count) {
        
        NSString *urlPath = [routeValues componentsJoinedByString:@"/"];
        NSString *result = [NSString stringWithFormat:@"/%@", urlPath];
        // 允许中文
        result = [result stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        if (extra.count) {
            result = [NSString stringWithFormat:@"%@", [self yx_mapDictionaryToURLQueryString:extra]];
        }
        return result;
    }
    return nil;
}



+ (NSDictionary *)yx_parseURL:(NSURL *)url {
    
    NSString *parameterString = url.query;
    NSMutableDictionary *parameterDic = [NSMutableDictionary dictionary];
    
    if (parameterString && parameterString.length > 0) {
        
        NSArray *partArr = [parameterString componentsSeparatedByString:@"&"];
        
        for (NSString *partString in partArr) {
            NSArray *separatArr = [partString componentsSeparatedByString:@"="];
            
            if (separatArr.count == 2) {
                [parameterDic setObject:separatArr.lastObject forKey:separatArr.firstObject];
            }
        }
    }
    return [NSDictionary dictionaryWithDictionary:parameterDic];
}

+ (NSString *)yx_mapDictionaryToURLQueryString:(NSDictionary *)dictionary {
    
    if (!dictionary) {
        return @"";
    }
    NSURLComponents *components = [[NSURLComponents alloc] init];
    NSMutableArray *items = [NSMutableArray array];
    
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *objc_key = [NSString stringWithFormat:@"%@", key];
        NSString *objc_value = [NSString stringWithFormat:@"%@", obj];
        NSURLQueryItem *item = [NSURLQueryItem queryItemWithName:objc_key value:objc_value];
        [items addObject:item];
    }];
    components.queryItems = [items copy];
    return components.URL.absoluteString;
    
}


@end
