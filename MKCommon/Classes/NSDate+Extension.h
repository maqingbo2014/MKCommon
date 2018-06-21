//
//  NSDate+Extension.h
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)
/**
 *  获取当前日期  MMddHHmmss
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)getDateTimes;

/**
 *  获取当前日期+时间 yyyy-MM-dd HH:mm:ss
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)getCurrentDateTime;

/**
 *  根据日期 获取 年 月 日
 *
 *  @param  nowDate 时间
 *
 *  @return NSMutableDictionary
 */
+ (NSMutableDictionary *)getDicFromDate:(NSDate*)nowDate;

/**
 *  获取当前日期  YYYYMMddHHmmss
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)getLongDateTimes;

/**
 *  获取当前日期  yyyyMMdd
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)getDates;

/**
 *  获取当前日期 yyyy年MM月dd日
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)getCurrentDate;

/**
 *  获取当前日期  带参数 yyyy年MM月dd日
 *
 *  @param  dates 时间
 *
 *  @return NSString
 */
+ (NSString *)stringFromDate:(NSDate *)dates;

/**
 *  日期转换成date类型  NSString---> yyyy-MM-dd HH:mm
 *
 *  @param
 *
 *  @return NSDate
 */
+ (NSDate*) convertDateFromString:(NSString*)uiDate;

/**
 *  date转换成NSString类型 yyyy-MM-dd HH:mm--->NSString
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)getCurrentDate1Time;

/**
 *  date转换成NSString类型 yyyy-MM-dd HH:mm--->NSString  带参数
 *
 *  @param  dates 时间
 *
 *  @return NSString
 */
+ (NSString *)converStringFromDateTime:(NSDate *)dates;
/**
 *  longlong转换成NSString类型 yyyy-MM-dd HH:mm--->NSString  带参数
 *
 *  @param  dates 时间
 *
 *  @return NSString
 */
+ (NSString *)getDateYMDHMStringFromLongLong:(NSString *)longint;
/**
 *  longlong转换成NSString类型 yyyy-MM-ddNSString  带参数
 *
 *  @param  dates 时间
 *
 *  @return NSString
 */
+ (NSString *)getDateYMDStringFromLongLong:(NSString *)longint;
/**
 *  longlong转换成NSString类型  HMNSString  带参数
 *
 *  @param  dates 时间
 *
 *  @return NSString
 */
+ (NSString *)getDateHMStringFromLongLong:(NSString *)longint;
/**
 *  longlong 时间戳
 *
 *  @param  dates 时间
 *
 *  @return NSString
 */
+ (NSNumber *)dateNumber;
/**
 *  获取时间long
 *
 *  @param
 *
 *  @return NSString
 */
- (NSString *)toLongint;
/**
 *  获取时间年-月-日 2016-8
 *
 *  @param
 *
 *  @return NSString
 */
- (NSString *)toYMString;
/**
 *  获取时间年-月-日 2016-8-8
 *
 *  @param
 *
 *  @return NSString
 */
- (NSString *)toYMDString;
/**
 *  获取时间几点几分 9：00
 *
 *  @param
 *
 *  @return NSString
 */
- (NSString *)toHMString;
/**
 *  获取时间年-月-日 时:分 2016-8-8 13:15
 *
 *  @param
 *
 *  @return NSString
 */
- (NSString *)toYMDHMString;

/**************时间转化格式不同**************/
/**
 *  判断时间周期 昨天 今天 或者 更早  用于消息列表的显示
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)judgeDatacycle:(NSString *)timeString days:(NSInteger)days;

/**
 *  判断时间周期 显示星期 还是月份
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString *)judgeWeekOrMonth:(NSDate *)timedate days:(NSInteger)days;

/**
 *  根据日期获取周几
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString*)weekDays:(NSString *)dateString;

/**
 *  根据日期获取周几
 *
 *  @param
 *
 *  @return NSString
 */
+ (NSString*)weekDaysFromDate:(NSDate *)dates;

/**
 *  比较两个时间大小
 *
 *  @param
 *
 *  @return int
 */
+ (int)compareDate:(NSString *)stringDate1 date:(NSString *)stringDate2;

/**
 *  将NSString转成date
 *
 *  @param  时间字符串
 *
 *  @return NSDate
 */
+ (NSDate *)compareStringtoDate:(NSString *)stringDate1;

/**
 *  将NSString转成date
 *
 *  @param
 *
 *  @return NSDate
 */
+ (NSDate*)dateFromUnixTimestamp:(NSTimeInterval)timestamp;
@end
