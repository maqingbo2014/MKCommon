//
//  FileManager.h
//  azq
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/ALAssetsLibrary.h>
#import <Photos/Photos.h>
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

/**
 文件所在文件夹

 @param filePath 文件路径
 @return 文件夹路径
 */
+ (NSString *)directoryPathWithFilePath:(NSString *)filePath;

/**
 根据文件路径获取文件名称

 @param filePath 文件路径
 @return 文件名称
 */
+ (NSString *)fileNameWithFilePath:(NSString *)filePath;
@end
