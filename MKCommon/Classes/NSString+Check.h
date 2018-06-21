//
//  NSString+Check.h
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)
- (BOOL)isChinese;

//判断是否有特殊字符
+(BOOL)IsSpecialCharacter:(NSString *)str;

//判断是否有中文
+(BOOL)IsChinese:(NSString *)str;

// 判断是否全是中文
+(BOOL)checkIsAllChinese:(NSString *)string;

//验证邮箱是否符合规则
+(BOOL)validateEmail:(NSString *)email;

//验证手机号是否符合规则
+(BOOL)validatePhone:(NSString *)phone;

// 验证是否只包含字母和数字
+(BOOL)validateLetterAndNumber:(NSString *)string;

//验证只能输入数字
+(BOOL)validateNumber:(NSString *)string;

//去掉字符串中的"()-"和空格(\\s)
+(NSString *)phoneRegexReplac:(NSString *)phone;

// MD5加密
- (NSString *)MD5;

+(NSString *)mobileInsertSpace:(NSString *)string;

+ (NSArray *)arrayWithJsonString:(NSString *)jsonString;
@end
