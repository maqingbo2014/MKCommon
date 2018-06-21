//
//  NSString+Extension.h
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
/**
 *  MD5加密
 *
 *  @param
 *
 *  @return
 */
- (NSString *)MD5;
/**
 *  验证手机
 *
 *  @param
 *
 *  @return
 */
+ (BOOL)isValidatephone:(NSString *)phone;

/**
 *  验证邮箱
 *
 *  @param
 *
 *  @return
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 *  判断手机
 *
 *  @param
 *
 *  @return
 */
+ (BOOL)checkCellPhoneNumber:(NSString *)phoneNumber;
+ (BOOL)checkname:(NSString*)name;
/**
 *  判断字符串为空
 *
 *  @param
 *
 *  @return
 */
+ (BOOL)isBlankString:(NSString *)string;

/**
 *  汉字转化成Unicode
 *
 *  @param
 *
 *  @return
 */
+ (NSString *)utf8ToUnicode:(NSString *)string;

/**
 *  url -> utf8url
 *
 *  @param
 *
 *  @return
 */
+ (NSString*)getUrlStringByUTF8:(NSString*)urlstring;

/**
 *  非对称加密解密
 *
 *  @param
 *
 *  @return
 */
+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

/**
 *  获取公钥
 *
 *  @param
 *
 *  @return
 */

+ (SecKeyRef)getPublicKey;
/**
 *  json
 *
 *  @param
 *
 *  @return
 */
+ (id)jsonGetString:(NSData *)data andError:(NSError **)error;
+ (id)jsonTOId:(NSString*)string;
+ (id)jsonGetStrings:(NSData *)data;
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
 *  解析url参数
 *
 *  @param
 *
 *  @return
 */
+ (NSDictionary*)urlToId:(NSString*)query usingEncoding:(NSStringEncoding)encoding;

/**
 *  计算高度
 *
 *  @param
 *
 *  @return
 */
- (float)heightForFontSize:(float)fontSize andWidth:(float)width;


/**
 *  计算文字大小
 *
 *  @param
 *
 *  @return
 */
- (CGSize)sizeForFontSize:(float)fontSize andWidth:(float)width;
/**
 *  json字符串转对象
 *
 *  @param
 *
 *  @return
 */
- (id)jsonStringtoArrayOrDictionary;
///**
// *  字符串过滤空 空则返回@""
// *
// *  @param
// *
// *  @return
// */
//- (NSString *)ToEmpty;
@end

@interface NSString (Size)
/**
 *  简单计算textsize
 *
 *  @param width 传入特定的宽度
 *  @param font  字体
 */
- (CGSize)sizeWithLabelWidth:(CGFloat)width font:(UIFont *)font;
@end


@interface NSString (Times)

+(NSString *)GetNowTimes;

@end


@interface NSString (Pinyin)

- (NSString *)getPinyin;

@end
