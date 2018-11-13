//
//  UIImage+Scale.h
//  azq
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

/**
 缩小到屏幕大小 等比例缩放
 default 414.00 736.00
 @return 缩小后的图片
 */
- (UIImage *)scaleToScreen;

/**
 缩小图片到指定尺寸
 等比例缩放
 @param size 指定尺寸
 @return 缩小后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;

/**
 设置图片透明度

 @param alpha 图片透明度
 @return 新的图片
 */
- (UIImage *)imageModifiedAlpha:(CGFloat)alpha;


/**
 压缩图片到指定文件大小

 @param image
 @param kb 目标大小
 @return image
 */
+(UIImage *)compressImage:(UIImage *)image toKb:(NSInteger)kb;

@end
