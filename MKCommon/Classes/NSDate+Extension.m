//
//  NSDate+Extension.m
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSString *)getDateTimes {
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"MMddHHmmss"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    return destDateString;
}

+ (NSString *)getCurrentDateTime {
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    return destDateString;
}

+ (NSMutableDictionary *)getDicFromDate:(NSDate*)nowDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents * comps = [calendar components:unitFlags fromDate:nowDate];
    //得到当前年份
    NSInteger currentYear = [comps year];
    
    NSInteger currentMonth = [comps month];
    NSInteger currentDay = [comps day];
    NSMutableDictionary *mudictionary = [[NSMutableDictionary alloc] init];
    [mudictionary setValue:[NSString stringWithFormat:@"%ld",(long)currentYear] forKey:@"year"];
    [mudictionary setValue:[NSString stringWithFormat:@"%ld",(long)currentMonth] forKey:@"month"];
    [mudictionary setValue:[NSString stringWithFormat:@"%ld",(long)currentDay] forKey:@"day"];
    return mudictionary;
}

+ (NSString *)getLongDateTimes {
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"YYYYMMddHHmmss"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    return destDateString;
}

+ (NSString *)getDates {
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyyMMdd"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    return destDateString;
}

+ (NSString *)getCurrentDate {
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    return destDateString;
}

+ (NSString *)stringFromDate:(NSDate *)dates {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *destDateString = [dateFormatter stringFromDate:dates];
    return destDateString;
}

+ (NSDate*) convertDateFromString:(NSString*)uiDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date=[formatter dateFromString:uiDate];
    return date;
}

+ (NSString *)getCurrentDate1Time {
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    return destDateString;
}

+ (NSString *)converStringFromDateTime:(NSDate *)dates {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:dates];
    return destDateString;
}

+ (NSString *)getDateYMDHMStringFromLongLong:(NSString *)longint {
    NSDate *date = [NSDate dateFromUnixTimestamp:[longint integerValue]];
    return [date toYMDHMString];
}

+ (NSString *)getDateYMDStringFromLongLong:(NSString *)longint {
    if (!longint||[longint integerValue] == 0) {
        return @"";
    }
    NSDate *date = [NSDate dateFromUnixTimestamp:[longint integerValue]];
    return [date toYMDString];
}
+ (NSString *)getDateHMStringFromLongLong:(NSString *)longint {
    NSDate *date = [NSDate dateFromUnixTimestamp:[longint integerValue]];
    return [date toHMString];
}

+ (NSNumber *)dateNumber {
    return [NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]];
}

- (NSString *)toLongint {
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd"];// 2013-6-16
    NSDate *date=[dateFormatter2 dateFromString:[self toYMDString]];
    
    NSTimeInterval timeValue = [date timeIntervalSince1970];
    long long int longint=(long long int)timeValue;
    return [NSString stringWithFormat:@"%@",[NSNumber numberWithLongLong:longint]];
}

- (NSString *)toYMString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *dateString=[formatter stringFromDate:self];
    return dateString;
}

- (NSString *)toYMDString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString=[formatter stringFromDate:self];
    return dateString;
}

- (NSString *)toHMString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"HH:mm"];
    NSString *dateString=[formatter stringFromDate:self];
    return dateString;
}

- (NSString *)toYMDHMString {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString=[formatter stringFromDate:self];
    return dateString;
}


+ (NSString *)judgeDatacycle:(NSString *)timeString days:(NSInteger)days {
    NSDate *timedate=[NSDate convertDateFromString:timeString];
    //用于展示时间 只显示分
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter1 setDateFormat:@"HH:mm"]; //上午 10:00
    NSString *showtimeString = [dateFormatter1 stringFromDate:timedate];
    
    
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd"];// 2013-6-16
    NSString *showDateString=[dateFormatter2 stringFromDate:timedate];
    
    
    NSTimeInterval timeValue = [timedate timeIntervalSince1970];
    //计算得到是时间 是否为今天
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    destDateString=[destDateString stringByAppendingString:@" 00:00"];
    NSDate *todayDate=[NSDate convertDateFromString:destDateString];
    NSTimeInterval todayDateValue = [todayDate timeIntervalSince1970];
    
    //判断在昨天之前
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *earlyDate=[todayDate dateByAddingTimeInterval:-secondsPerDay];
    NSTimeInterval earlyDateValue = [earlyDate timeIntervalSince1970];
    
    //判断是否在一周
    NSDate *WeekDate=[todayDate dateByAddingTimeInterval:-secondsPerDay*days];
    NSTimeInterval WeekDateValue = [WeekDate timeIntervalSince1970];
    if((long long int)todayDateValue < (long long int)timeValue)
    {
        showtimeString=[NSString stringWithFormat:@"今天 %@",showtimeString];
    }
    
    else if((long long int)earlyDateValue < (long long int)timeValue && (long long int)todayDateValue > (long long int)timeValue )
    {
        showtimeString=[NSString stringWithFormat:@"昨天 %@",showtimeString];
    }
    
    else if((long long int)WeekDateValue < (long long int)timeValue && (long long int)earlyDateValue > (long long int)timeValue )
    {
        showtimeString=[NSString stringWithFormat:@"%@ %@",[NSDate weekDays:timeString],showtimeString];
    }
    else{
        showtimeString=[NSString stringWithFormat:@"%@",showDateString];
    }
    return showtimeString;
}

+ (NSString *)judgeWeekOrMonth:(NSDate *)timedate days:(NSInteger)days {
    
    //用于展示时间 只显示分
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter1 setDateFormat:@"HH:mm"]; //上午 10:00
    NSString *showtimeString =@"";
    
    
    NSTimeInterval timeValue = [timedate timeIntervalSince1970];
    //计算得到是时间 是否为今天
    NSDate *today=[NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:today];
    destDateString=[destDateString stringByAppendingString:@" 00:00"];
    NSDate *todayDate=[NSDate convertDateFromString:destDateString];
    NSTimeInterval todayDateValue = [todayDate timeIntervalSince1970];
    
    //判断在昨天之前
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *earlyDate=[todayDate dateByAddingTimeInterval:-secondsPerDay];
    NSTimeInterval earlyDateValue = [earlyDate timeIntervalSince1970];
    
    //判断是否在一周
    NSDate *WeekDate=[todayDate dateByAddingTimeInterval:-secondsPerDay*days];
    NSTimeInterval WeekDateValue = [WeekDate timeIntervalSince1970];
    if((long long int)todayDateValue < (long long int)timeValue)
    {
        showtimeString=@"今天";
    }
    
    else if((long long int)earlyDateValue < (long long int)timeValue && (long long int)todayDateValue > (long long int)timeValue )
    {
        showtimeString=@"昨天";
    }
    
    else if((long long int)WeekDateValue < (long long int)timeValue && (long long int)earlyDateValue > (long long int)timeValue )
    {
        showtimeString=[NSDate weekDaysFromDate:timedate];
    }
    else{
        showtimeString=nil;
    }
    
    return showtimeString;
    
}

+ (NSString*)weekDays:(NSString *)dateString {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *dates=[self convertDateFromString:dateString];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:dates];
    NSInteger  week = [comps weekday];
    switch (week) {
        case 1:
            return @"星期日";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        default:
            return @"星期六";
            break;
    }
}

+ (NSString*)weekDaysFromDate:(NSDate *)dates {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:dates];
    NSInteger  week = [comps weekday];
    switch (week) {
        case 1:
            return @"星期日";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        default:
            return @"星期六";
            break;
    }
}

+ (int)compareDate:(NSString *)stringDate1 date:(NSString *)stringDate2 {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MM-dd HH:mm"];
    NSDate *dateA = [dateFormatter dateFromString:stringDate1];
    NSDate *dateB = [dateFormatter dateFromString:stringDate2];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        return 1; //date1 比 date2 晚
    }
    else if (result == NSOrderedAscending){
        return -1; //date1 比 date2 早
    }
    return 0; //在当前准确度下，两个时间一致
}

+ (NSDate *)compareStringtoDate:(NSString *)stringDate1 {
    stringDate1=[NSString stringWithFormat:@"2013-0%@",stringDate1];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSDate *date = [dateFormatter dateFromString:stringDate1];
    return date;
}

+ (NSDate*)dateFromUnixTimestamp:(NSTimeInterval)timestamp {
    return [NSDate dateWithTimeIntervalSince1970:timestamp];
}

@end
