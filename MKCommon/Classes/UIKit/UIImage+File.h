//
//  UIImage+File.h
//  azq
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <AssetsLibrary/ALAssetRepresentation.h>

@interface UIImage (File)

/**
 高斯模糊图片

 @return 高斯模糊图片
 */
- (UIImage *)gaussianBlurImage;

/**
 存储图片到doc目录

 @param path 图片存储路径
 @param aQuality 压缩比率
 @return 是否存储成功
 */
- (BOOL)saveImageWithPath:(NSString *)path Quality:(CGFloat)aQuality;

/**
 获取视频的第一张图片

 @param videoURL 本地视频地址
 @param time 视频何时的长度
 @return 缩略图
 */
+ (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;


/**
 要截取的view

 @param view 要截屏的视图
 @return 截屏图片
 */
+ (UIImage *)captureView:(UIView *)view;

/**
 截取屏幕

 @return 截屏图片
 */
+ (UIImage *)captureScreen;

/**
 剪切rect包含的图片

 @param rect 图片的大小
 @return 剪切后的突破按
 */
- (UIImage *)cropImageinRect:(CGRect)rect;

/**
 通过图片路径读取图片

 @param path 图片路径
 @return 图片
 */
+ (UIImage *)imageWithPath:(NSString *)path;
@end

