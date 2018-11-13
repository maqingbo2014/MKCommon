//
//  NSString+Size.h
//  azq
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Size)

/**
 计算高度
 系统文字 不加粗
 @param fontSize 文字大小
 @param width 宽度
 @return 高度
 */
- (float)heightForFontSize:(float)fontSize andWidth:(float)width;

/**
 计算文字大小
 系统文字 不加粗
 @param fontSize 文字大小
 @param width 宽度
 @return size
 */
- (CGSize)sizeForFontSize:(float)fontSize andWidth:(float)width;

/**
 根据文字font宽度计算文字高度

 @param width 宽度
 @param font font
 @return size
 */
- (CGSize)sizeForFont:(UIFont *)font andWidth:(float)width;

@end
