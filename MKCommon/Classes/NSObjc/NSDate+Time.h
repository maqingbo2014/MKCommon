//
//  NSDate+Time.h
//  azq
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>
#define NSEaseLocalizedString(key, comment) [[NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"EaseUIResource" withExtension:@"bundle"]] localizedStringForKey:(key) value:@"" table:nil]

#define DATE_COMPONENTS (NSCalendarUnitYear| NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekOfYear |  NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal)
#define CURRENT_CALENDAR [NSCalendar currentCalendar]

@interface NSDate (Time)

/**
 获取当前日期
 */
+ (NSString *)getCurrentDateYMD;
+ (NSString *)getCurrentDateYMDHM;
+ (NSString *)getCurrentDateYMDHMS;
+ (NSString *)getCurrentDateLong;

/**
 时间戳转换成时间字符串
 */
+ (NSDate *)getDateFromLongLong:(NSString *)longint;
+ (NSDate *)dateFromUnixTimestamp:(NSTimeInterval)timestamp;
+ (NSString *)getDateYMDHMStringFromLongLong:(NSString *)longint;
+ (NSString *)getDateYMDStringFromLongLong:(NSString *)longint;
+ (NSString *)getDateHMStringFromLongLong:(NSString *)longint;

/**
 NSDate转换成时间字符串
 */
- (NSString *)toLongint;
- (NSString *)toYMString;
- (NSString *)toYMDString;
- (NSString *)toHMString;
- (NSString *)toYMDHMString;
- (NSString *)toYMDHMSString;

/**
 *  根据日期 获取 年 月 日
 *
 *  @param  nowDate 时间
 *
 *  @return NSMutableDictionary
 */
+ (NSMutableDictionary *)getDicFromDate:(NSDate*)nowDate;
/**************时间转化格式不同**************/
///**
// *  判断时间周期 昨天 今天 或者 更早  用于消息列表的显示
// *
// *  @param
// *
// *  @return NSString
// */
//+ (NSString *)judgeDatacycle:(NSString *)timeString days:(NSInteger)days;
//
///**
// *  判断时间周期 显示星期 还是月份
// *
// *  @param
// *
// *  @return NSString
// */
//+ (NSString *)judgeWeekOrMonth:(NSDate *)timedate days:(NSInteger)days;

///**
// *  根据日期获取周几
// *
// *  @param
// *
// *  @return NSString
// */
//+ (NSString*)weekDays:(NSString *)dateString;
//
///**
// *  根据日期获取周几
// *
// *  @param
// *
// *  @return NSString
// */
//+ (NSString*)weekDaysFromDate:(NSDate *)dates;
//
///**
// *  比较两个时间大小
// *
// *  @param
// *
// *  @return int
// */
//+ (int)compareDate:(NSString *)stringDate1 date:(NSString *)stringDate2;
//
///**
// *  将NSString转成date
// *
// *  @param  时间字符串
// *
// *  @return NSDate
// */
//+ (NSDate *)compareStringtoDate:(NSString *)stringDate1;



#define D_MINUTE    60
#define D_HOUR        3600
#define D_DAY        86400
#define D_WEEK        604800
#define D_YEAR        31556926

- (NSString *)timeIntervalDescription;//距离当前的时间间隔描述
- (NSString *)minuteDescription;/*精确到分钟的日期描述*/
- (NSString *)formattedTime;
- (NSString *)formattedDateDescription;//格式化日期描述
- (double)timeIntervalSince1970InMilliSecond;
+ (NSDate *)dateWithTimeIntervalInMilliSecondSince1970:(double)timeIntervalInMilliSecond;
+ (NSString *)formattedTimeFromTimeInterval:(long long)time;
// Relative dates from the current date
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Comparing dates
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;
- (BOOL) isToday;
- (BOOL) isTomorrow;
- (BOOL) isYesterday;
- (BOOL) isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) isThisWeek;
- (BOOL) isNextWeek;
- (BOOL) isLastWeek;
- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isSameYearAsDate: (NSDate *) aDate;
- (BOOL) isThisYear;
- (BOOL) isNextYear;
- (BOOL) isLastYear;
- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;
- (BOOL) isInFuture;
- (BOOL) isInPast;

// Date roles
- (BOOL) isTypicallyWorkday;
- (BOOL) isTypicallyWeekend;

// Adjusting dates
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) dateByAddingHours: (NSInteger) dHours;
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateAtStartOfDay;

// Retrieving intervals
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) daysAfterDate: (NSDate *) aDate;
- (NSInteger) daysBeforeDate: (NSDate *) aDate;
- (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;

@end


@interface NSDateFormatter (Time)

/**
 创建 NSDateFormatter

 @param dateFormat e.g yyyy-MM-dd HH:mm:ss
 @return NSDateFormatter
 */
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)dateFormat;

/**
 yyyy-MM-dd

 @return NSDateFormatter
 */
+ (NSDateFormatter *)formatterYMD;

/**
 yyyy-MM-dd HH:mm:ss

 @return NSDateFormatter
 */
+ (NSDateFormatter *)formatterYMDHMS;

/**
 MM-dd

 @return NSDateFormatter
 */
+ (NSDateFormatter *)formatterMD;
/**
 yyyy-MM
 
 @return NSDateFormatter
 */
+ (NSDateFormatter *)formatterYM;

/**
 yyyy-MM-dd HH:mm

 @return NSDateFormatter
 */
+ (NSDateFormatter *)formatterYMDHM;

/**
 yyyy-MM-dd HH:mm
 
 @return NSDateFormatter
 */
+ (NSDateFormatter *)formatterHM;


@end
