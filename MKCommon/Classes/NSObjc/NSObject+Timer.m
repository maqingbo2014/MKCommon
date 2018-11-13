//
//  NSObject+Timer.m
//  azq
//
//  Created by levi on 2018/10/18.
//  Copyright © 2018 xinhuo-tech. All rights reserved.
//

#import "NSObject+Timer.h"
#import "ZTGCDTimerManager.h"

@implementation NSObject (Timer)

- (NSString *)timerName{
    return [NSString stringWithFormat:@"%@timer", NSStringFromClass(self.class)];
}

- (void)cancelTimer{
    [ZTGCDTimerManager.sharedInstance cancelTimerWithName:self.timerName];
}

@end
