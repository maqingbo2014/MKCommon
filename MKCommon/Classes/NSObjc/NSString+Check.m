//
//  NSString+Check.m
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "NSString+Check.h"

@implementation NSString (Check)

- (BOOL)isChinese {
//    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
//    return [predicate evaluateWithObject:self];
    NSString *regex = @".{0,}[\u4E00-\u9FA5].{0,}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self matches %@",regex];
    for (NSInteger i = 0; i < self.length; i ++) {
        NSString *subString = [self substringWithRange:NSMakeRange(i, 1)];
        if (![predicate evaluateWithObject:subString]) {
            
            return NO;
        }
    }
    return YES;
}

- (BOOL)isSpecialCharacter {
    NSCharacterSet *nameCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"_-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange userNameRange = [self rangeOfCharacterFromSet:nameCharacters];
    if (userNameRange.location != NSNotFound) {
        return NO;
    }
    return YES;
}

- (BOOL)isHaveChinese {
    for(int i=0; i< [self length];i++)
    {
        int a = [self characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

- (BOOL)isEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (BOOL)isPhoneNumber {
    NSString *phoneRegex = @"^((13[0-9])|(147)|(15[^4,\\D])|(17[678])|(18[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)isLetterOrNumber {
    NSString *normalRegex = @"[A-Za-z0-9_-]";
    NSPredicate *normalTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", normalRegex];
    return [normalTest evaluateWithObject:self];
}

- (BOOL)isNumber {
    NSString *normalRegex = @"[0-9]";
    NSPredicate *normalTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", normalRegex];
    return [normalTest evaluateWithObject:self];
}

- (NSString *)phoneRemoveSpecialCharacter {
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\(\\)\\s-]"
                                                                           options:0
                                                                             error:NULL];
    return [regex stringByReplacingMatchesInString:self
                                           options:0
                                             range:NSMakeRange(0, self.length)
                                      withTemplate:@""];
}

- (NSString *)phoneInsertSpace {
    NSMutableString *mobile = [NSMutableString stringWithString:self];
    [mobile insertString:@" " atIndex:3];
    [mobile insertString:@" " atIndex:8];
    return mobile;
}

- (BOOL)isBlankString {
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([self isEqualToString:@"<null>"]) {
        return NO;
    }
    if ([self isEqualToString:@"(null)"]) {
        return NO;
    }
    if (self == nil || self == NULL) {
        return NO;
    }
    if ([self isKindOfClass:[NSNull class]]) {
        return NO;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return NO;
    }
    return YES;
}

- (NSString *)toUnicodeString {
    NSUInteger length = [self length];
    NSMutableString *unicode = [NSMutableString stringWithCapacity:0];
    for (int i = 0;i < length; i++) {
        unichar _char = [self characterAtIndex:i];
        if (_char <= '9' && _char >= '0'){
            [unicode appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'a' && _char <= 'z'){
            [unicode appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }else if(_char >= 'A' && _char <= 'Z'){
            [unicode appendFormat:@"%@",[self substringWithRange:NSMakeRange(i, 1)]];
        }else{
            [unicode appendFormat:@"\\u%x",[self characterAtIndex:i]];
        }
    }
    return unicode;
}

- (NSString *)getPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false); // 汉字转成拼音(不知道为什么英文是拉丁语的意思)
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformStripDiacritics, false); // 去掉音调
    return mutableString;
}


@end
