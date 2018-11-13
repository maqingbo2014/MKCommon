//
//  NSString+Time.m
//  azq
//
//  Created by Apple on 2017/11/29.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)

- (NSDate *)toDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:self];
}

- (NSDate *)toDateTime {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [formatter dateFromString:self];
}

@end
