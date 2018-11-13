//
//  FileManager.m
//  azq
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import "FileManager.h"
#import "DefineMagic.h"
#import "SystemDefine.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation FileManager
+ (NSString *)appDocPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appLibPath
{
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appCachePath
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
}

+ (NSString *)appTmpPath
{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

+ (BOOL)isFileExsit:(NSString *)aPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:aPath];
}

+ (BOOL)isFileExsitInDoc:(NSString *)aPath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *path = [FileManager appDocPath];
    [path stringByAppendingPathComponent:aPath];
    return [manager fileExistsAtPath:path];
}

+ (BOOL)isBundleExsit:(NSString *)aBundleName
{
    return [[NSBundle mainBundle] URLForResource:aBundleName withExtension:@"bundle"] ? YES : NO;
}


+ (NSString *)writeAssetToAppTmpDirectory:(ALAsset *)asset
{
    NSString *path = [self writeAsset:asset toPath:[self appTmpPath]];
    return path;
}
/**
 *  写入视频到path
 */
+ (NSString *)writeAsset:(ALAsset *)asset toPath:(NSString *)path
{
    ALAssetRepresentation *rep = [asset defaultRepresentation];
    Byte *buffer = (Byte*)malloc(rep.size);
    NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
    NSData *videoData = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
    
    NSString *tmpPath = [NSString stringWithFormat:@"%@%@.mp4",path,@""];
    NSString *videoPath = [self writeVieo:videoData toPath:tmpPath];
    return videoPath;
}

/**
 *  写入视频到path
 */
+ (NSString *)writeVieo:(NSData *)videoData toPath:(NSString *)path
{
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:path];
    if(success) {
        success = [fileManager removeItemAtPath:path error:nil];
    }
    [videoData writeToFile:path atomically:YES];
    
    return path;
}

/**
 *  写入视频到tmp
 */
+ (NSString *)writeViyeoToTmpDirectory:(NSData *)videoData
{
    NSString *path = [self writeVieo:videoData toPath:[self appTmpPath]];
    return path;
}

//quality现在没用，默认中等
+ (void)transCodeVideo:(ALAsset *)libraryAsset toURL:(NSURL *)fileURL quality:(NSString *)quality
{
    
    // get a video asset for the original video file
    
    
    //    NSString *const AVAssetExportPresetLowQuality;
    //    NSString *const AVAssetExportPresetMediumQuality;
    //    NSString *const AVAssetExportPresetHighestQuality;
    
    AVAsset *asset = [AVAsset assetWithURL:
                      [NSURL URLWithString:
                       [NSString stringWithFormat:@"%@",
                        [[libraryAsset defaultRepresentation] url]]]];
    // see if it's possible to export at the requested quality
    NSArray *compatiblePresets = [AVAssetExportSession
                                  exportPresetsCompatibleWithAsset:asset];
    if ([compatiblePresets containsObject:quality]) {
        // set up the export
        AVAssetExportSession *exportSession = [[AVAssetExportSession alloc]
                                               initWithAsset:asset presetName:AVAssetExportPresetMediumQuality];
        exportSession.outputURL = fileURL;
        exportSession.outputFileType = AVFileTypeMPEG4;
        exportSession.shouldOptimizeForNetworkUse = YES;
        // run the export
        [exportSession exportAsynchronouslyWithCompletionHandler:^{
            switch ([exportSession status]) {
                case AVAssetExportSessionStatusFailed:
                    //TODO: warn of failure
                    break;
                case AVAssetExportSessionStatusCancelled:
                    //TODO: warn of cancellation
                    break;
                default:
                    //TODO: do whatever is next
                    break;
            }
        }];
    }
    else {
        //TODO: warn that the requested quality is not available
    }
}

+ (NSString *)directoryPathWithFilePath:(NSString *)filePath {
    if (filePath.length == 0) {
        GDDLog(@"file path is empty");
        return nil;
    }
    NSArray *filePathArray = [filePath componentsSeparatedByString:@"/"];
    NSMutableArray *tempArray = [[NSMutableArray alloc]initWithArray:filePathArray];
    [tempArray removeLastObject];
    return [tempArray componentsJoinedByString:@"/"];
}

+ (NSString *)fileNameWithFilePath:(NSString *)filePath {
    if (filePath.length == 0) {
        GDDLog(@"file path is empty");
        return nil;
    }
    NSArray *filePathArray = [filePath componentsSeparatedByString:@"/"];
    return [filePathArray lastObject];
}

@end
