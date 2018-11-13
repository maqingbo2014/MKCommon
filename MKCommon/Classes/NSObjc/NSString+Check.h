//
//  NSString+Check.h
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Check)

/**
 是不是都是中文

 @return BOOL
 */
- (BOOL)isChinese;

/**
 是不是含有特殊字符

 @return BOOL
 */
- (BOOL)isSpecialCharacter;

/**
 是否含有中文

 @return BOOL
 */
- (BOOL)isHaveChinese;

/**
 是否符合邮箱规则

 @return BOOL
 */
- (BOOL)isEmail;

/**
 是不是手机号码

 @return BOOL
 */
- (BOOL)isPhoneNumber;

/**
 验证是否只包含字母和数字

 @return BOOL
 */
- (BOOL)isLetterOrNumber;

/**
 是否只是数字

 @return BOOL
 */
- (BOOL)isNumber;

/**
 去掉字符串中的"()-"和空格(\\s)

 @return 去掉后的字符串
 */
- (NSString *)phoneRemoveSpecialCharacter;

/**
 手机号中间第四位,第八位加空格

 @return 有规则的手机号码
 */
- (NSString *)phoneInsertSpace;

/**
 是不是空字符串

 @return BOOL
 */
- (BOOL)isBlankString;

/**
 将汉字转化成Unicode字符串

 @return Unicode字符串
 */
- (NSString *)toUnicodeString;

/**
 讲中文转化成拼音

 @return 拼音字符串
 */
- (NSString *)getPinyin;
@end
