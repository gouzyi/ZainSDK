//
//  NSDate+YXAddition.m
//  CXMerchant
//
//  Created by zainguo on 2019/4/12.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import "NSDate+YXAddition.h"

@implementation NSDate (YXAddition)
/**
 字符时间戳
 @return return value description
 */
- (NSString *)yx_timeStampStr {
    return [@([self timeIntervalSince1970]).stringValue copy];
}
/**
 长型时间戳
 @return return value description
 */
- (double)yx_timeStamp{
    return [self timeIntervalSince1970];
}

/**
 实现dateFormatter单例方法
 @param formatterType type
 @return 相应格式的NSDataFormatter对象
 */
+ (NSDateFormatter *)yx_dateformatterType:(NSString *)formatterType {
    static NSDateFormatter *staticDateFormatter;
    if (!staticDateFormatter) {
        staticDateFormatter = [[NSDateFormatter alloc] init];
    }
    [staticDateFormatter setDateFormat:formatterType];
    return staticDateFormatter;
}

/** YYYY-MM-dd HH:mm:ss */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmss {
    return [[NSDate yx_dateformatterType:@"YYYY-MM-dd HH:mm:ss"] stringFromDate:self];
}
- (NSString *)yx_dateWithYYYY_MM_dd_HHmm {
    return [[NSDate yx_dateformatterType:@"YYYY-MM-dd HH:mm"] stringFromDate:self];
}
/** YYYY-MM-dd  */
- (NSString *)yx_dateWithYYYY_MM_dd {
    return [[NSDate yx_dateformatterType:@"YYYY-MM-dd"] stringFromDate:self];
    
}
/** YYYY年MM月dd日 HH:mm */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmInChinese {
    return [[NSDate yx_dateformatterType:@"YYYY年MM月dd日 HH:mm"] stringFromDate:self];
}
- (NSString *)yx_dateWithYYYY_MM_dd_Chinese {
    return [[NSDate yx_dateformatterType:@"YYYY年MM月dd日"] stringFromDate:self];
}


+ (NSDate *)yx_stringTransferToNSDate:(NSString *)dateStr {
    
    NSDateFormatter *formatter = [NSDate yx_dateformatterType:@"YYYY-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:dateStr];
    return date;
}
@end
