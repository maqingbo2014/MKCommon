//
//  UIImage+Extension.h
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <AssetsLibrary/ALAssetsGroup.h>
#import <AssetsLibrary/ALAssetRepresentation.h>

@interface UIImage (Extension)
/**
 *  加载图片
 *
 *  @param name 图片名
 */
//+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  返回一张自由拉伸的图片
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)gaussianBlurImageWithImageName:(NSString*)imageName;
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

- (UIImage *)scaleTo828;

/**
 *  通过颜色创建image
 *
 *  @param color 颜色
 *
 *  @return image
 */
+ (UIImage *)imageWithColor:(UIColor *)aColor;
/**
 *  缩小到屏幕大小
 *
 *  @param color 颜色
 *
 *  @return image
 */
- (UIImage *)scaletoScreen;
/**
 *  设置图片透明度
 *
 *  @param color 颜色
 *
 *  @return image
 */
- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;

/**
 *  等比例缩放
 *
 *  @param size 大小
 *
 *  @return image
 */
- (UIImage*)scaleToSize:(CGSize)size;

/**
 *	按照尺寸缩放图片
 *
 *	@param aSize
 *
 *	@return
 */
- (UIImage *)shrinkImageForSize:(CGSize)aSize;

/**
 *	功能:存储图片到doc目录
 *
 *	@param imageName :图片名称
 *	@param aQuality  :压缩比率
 *
 *	@return
 */
- (NSString *)saveImageWithName:(NSString *)imageName
          forCompressionQuality:(CGFloat )aQuality;

/**
 *	获取视频的第一张图片
 *
 *	@param videoURL 视频地址
 *	@param time  时间
 *
 *	@return
 */
+ (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;

/**
 *	截屏
 *
 *  @param  view ：要截屏的视图
 *	@return
 */
+ (UIImage *)captureView:(UIView *)view;

/**
 *	截屏
 *
 *	@return
 */
+ (UIImage *)captureScreen;

/**
 * 剪切rect包含的图片
 *
 * @param  image：图片
 * @param  rect：坐标
 * @return UIImage
 */
- (UIImage *)cropImageinRect:(CGRect)rect;

/**
 * 缩放图片
 *
 * @param  newSize 新大小
 * @return UIImage
 */
- (UIImage *)scaledToSize:(CGSize)newSize;

/**
 *  图片转base64字符串
 */
- (NSString *)toBase64String;
@end


#import <AssetsLibrary/ALAssetsLibrary.h>
#define OTS_DOC_PATH    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject]

@interface FileManager : NSObject

/**
 *  获得app文档目录
 *
 *  @return 目录地址
 */
+ (NSString *)appDocPath;

/**
 *  获得app文档目录
 *
 *  @return 目录地址
 */
+ (NSString *)appCachePath;

/**
 *  获得app临时文件夹目录
 *  用于存放临时文件，保存应用程序再次启动过程中不需要的信息
 *
 *  @return 目录地址
 */
+ (NSString *)appTmpPath;

/**
 *  获得app的lib目录
 *
 *  @return lib目录地址
 */
+ (NSString *)appLibPath;

/**
 *  判断文件是否存在
 *
 *  @param aPath 地址
 *
 *  @return BOOL
 */
+ (BOOL)isFileExsit:(NSString *)aPath;
/**
 *  判断Doc目录中是否存在某文件
 *
 *  @param aPath 地址
 *
 *  @return BOOL
 */
+ (BOOL)isFileExsitInDoc:(NSString *)aPath;
/**
 *  判断bundle是否存在
 *
 *  @param aBundleName bundle名称
 *
 *  @return BOOL
 */
+ (BOOL)isBundleExsit:(NSString *)aBundleName;


/**
 *  写入视频到path
 */
+ (NSString *)writeAsset:(ALAsset *)asset toPath:(NSString *)path;

/**
 *  写入视频到path
 */
+ (NSString *)writeAssetToAppTmpDirectory:(ALAsset *)asset;

/**
 *  写入视频到path
 */
+ (NSString *)writeVieo:(NSData *)videoData toPath:(NSString *)path;

/**
 *  写入视频到tmp
 */
+ (NSString *)writeViyeoToTmpDirectory:(NSData *)videoData;

/**
 *  视频转码为mp4到fileURL
 */
+ (void)transCodeVideo:(ALAsset *)libraryAsset toURL:(NSURL *)fileURL quality:(NSString *)quality;
@end


@interface UIButton (EX)
- (void)xr_setButtonImageWithUrl:(NSString *)urlStr;
@end
