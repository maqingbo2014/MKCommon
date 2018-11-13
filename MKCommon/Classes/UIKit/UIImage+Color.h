//
//  UIImage+Color.h
//  azq
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 通过颜色创建image
 纯颜色的图片
 @param aColor 创建图片的颜色
 @return 一张图片
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;

/**
 获取图片主色
 
 @return color
 */
- (UIColor*)mostColor;

@end
