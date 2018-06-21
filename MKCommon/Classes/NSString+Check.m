//
//  NSString+Check.m
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "NSString+Check.h"
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Check)

- (BOOL)isChinese
{
    NSString *match = @"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}


//判断是否有特殊字符 有特殊字符，则返回YES
+(BOOL)IsSpecialCharacter:(NSString *)str
{
    NSCharacterSet *nameCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"_-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange userNameRange = [str rangeOfCharacterFromSet:nameCharacters];
    if (userNameRange.location != NSNotFound) {
        return NO;
    }
    return YES;
}
//判断是否有中文
+(BOOL)IsChinese:(NSString *)str
{
    for(int i=0; i< [str length];i++)
    {
        int a = [str characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}

// 判断是否全是中文
+(BOOL)checkIsAllChinese:(NSString *)string{
    NSString *regex = @".{0,}[\u4E00-\u9FA5].{0,}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self matches %@",regex];
    for (NSInteger i = 0; i < string.length; i ++) {
        NSString *subString = [string substringWithRange:NSMakeRange(i, 1)];
        if (![predicate evaluateWithObject:subString]) {
            
            return NO;
        }
    }
    return YES;
}

//验证邮箱是否符合规则
+(BOOL)validateEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

//验证手机号是否符合规则 符合规则返回YES
+(BOOL)validatePhone:(NSString *)phone{
    NSString *phoneRegex = @"^((13[0-9])|(147)|(15[^4,\\D])|(17[678])|(18[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:phone];
}

//验证只能输入字母和数字
+(BOOL)validateLetterAndNumber:(NSString *)string{
    NSString *normalRegex = @"[A-Za-z0-9_-]";
    NSPredicate *normalTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", normalRegex];
    return [normalTest evaluateWithObject:string];
}

//验证只能输入数字
+(BOOL)validateNumber:(NSString *)string{
    NSString *normalRegex = @"[0-9]";
    NSPredicate *normalTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", normalRegex];
    return [normalTest evaluateWithObject:string];
}

//去掉字符串中的"()-"和空格(\\s)
+(NSString *)phoneRegexReplac:(NSString *)phone{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[\\(\\)\\s-]"
                                                                           options:0
                                                                             error:NULL];
    return [regex stringByReplacingMatchesInString:phone
                                           options:0
                                             range:NSMakeRange(0, phone.length)
                                      withTemplate:@""];
}

+(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

- (NSString *)MD5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3],
             result[4], result[5], result[6], result[7],
             result[8], result[9], result[10], result[11],
             result[12], result[13], result[14], result[15]
             ] lowercaseString];
}
//手机号中间第四位,第八位加空格
+(NSString *)mobileInsertSpace:(NSString *)string
{
    NSMutableString *mobile = [NSMutableString stringWithString:string];
    [mobile insertString:@" " atIndex:3];
    [mobile insertString:@" " atIndex:8];
    return mobile;
}

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData
                                                     options:NSJSONReadingMutableContainers
                                                       error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return array;
}
@end
