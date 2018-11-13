//
//  UIColor+Hex.h
//  azq
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 hexString 例如#DF1342的

 @param hexString 十六进制字符串
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 hexString 例如#DF1342的

 @param color 十六进制字符串
 @param alpha 透明度
 @return color
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 随机颜色

 @return color
 */
+ (UIColor *)randomColor;


/**
 视觉感知亮暗

 @return 是否亮
 */
- (BOOL)isPerceivedLightW3C;


/**
 亮度

 @return 亮度
 */
- (CGFloat)perceivedLightnessW3C;

@end
