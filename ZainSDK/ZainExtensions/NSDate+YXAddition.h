//
//  NSDate+YXAddition.h
//  CXMerchant
//
//  Created by zainguo on 2019/4/12.
//  Copyright © 2019 zainguo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSDate (YXAddition)

/**
 字符串时间戳
 */
@property (nonatomic, copy, readonly) NSString *yx_timeStampStr;
/**
 长型时间戳
 */
@property (nonatomic, assign, readonly) double yx_timeStamp;


/**
 实现dateFormatter单例方法
 @param formatterType  formatter 类型 (如2018-01-01 10:00:00 \ 2018.01.01)
 @return 相应格式的NSDataFormatter对象
 */
+ (NSDateFormatter *)yx_dateformatterType:(NSString *)formatterType;
/** YYYY-MM-dd HH:mm:ss */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmss;
/** YYYY-MM-dd HH:mm */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmm;
/** YYYY-MM-dd  */
- (NSString *)yx_dateWithYYYY_MM_dd;
/** YYYY年MM月dd日 HH:mm */
- (NSString *)yx_dateWithYYYY_MM_dd_HHmmInChinese;
/** YYYY年MM月dd日 */
- (NSString *)yx_dateWithYYYY_MM_dd_Chinese;


/**
 时间字符串转成NSDate
 @param dateStr 时间字符串
 @return date
 */
+ (NSDate *)yx_stringTransferToNSDate:(NSString *)dateStr;

@end

