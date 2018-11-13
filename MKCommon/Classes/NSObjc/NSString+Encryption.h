//
//  NSString+Encryption.h
//  azq
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Encryption)
/**
 MD5加密
 
 @return 加密字符串
 */
- (NSString *)MD5;

/**
 非对称加密解密

 @param data 要加密的内容
 @param key 公钥
 @return 加密后的字符串
 */
+ (NSData *)DESEncrypt:(NSData *)data WithKey:(NSString *)key;
+ (NSData *)DESDecrypt:(NSData *)data WithKey:(NSString *)key;

/**
 获取公钥

 @return 公钥
 */
+ (SecKeyRef)getPublicKey;

@end
