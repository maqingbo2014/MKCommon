//
//  NSString+URL.h
//  azq
//
//  Created by Apple on 2018/6/6.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

/**
 *  URLEncode
 */
- (NSString *)URLEncodedString;

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString;

@end
