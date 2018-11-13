//
//  NSString+URL.m
//  azq
//
//  Created by Apple on 2018/6/6.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)

- (NSString *)URLEncodedString {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<>"].invertedSet];
}

- (NSString *)URLDecodedString {
    return [self stringByRemovingPercentEncoding];
}

@end
