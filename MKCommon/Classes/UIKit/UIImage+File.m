//
//  UIImage+File.m
//  azq
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import "UIImage+File.h"
#import "FileManager.h"

@implementation UIImage (File)



//PNG图片高斯模糊
- (UIImage *)gaussianBlurImage {
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage1 = [[CIImage alloc] initWithImage:self];
    
    CIFilter *fiter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [fiter setValue:inputImage1 forKey:kCIInputImageKey];
    [fiter setValue:[NSNumber numberWithFloat:10.0] forKey:@"inputRadius"];
    
    CIImage *result = [fiter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}

- (BOOL)saveImageWithPath:(NSString *)path Quality:(CGFloat)aQuality {
    if (aQuality < 0) {
        aQuality = 0;
    }
    if (aQuality > 1.0f) {
        aQuality = 1.0f;
    }
    if (path.length == 0) {
        NSLog(@"save image path is empty");
        return NO;
    }
    NSData* imageData = UIImageJPEGRepresentation(self, aQuality);
    NSFileManager *fm = [NSFileManager defaultManager];
    NSLog(@"save image At path %@",path);
    //路径不存在
    if ([fm fileExistsAtPath:path]) {
        return NO;
    }
    //创建文件夹路径
    NSString *dicPath = [FileManager directoryPathWithFilePath:path];
    if (![fm fileExistsAtPath:dicPath]) {
        NSError *error;
        [fm createDirectoryAtPath:dicPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            return NO;
        }
    }
    //图片写到路径中去
    return [imageData writeToFile:path atomically:YES];
}

//获取视频的第一张图片
+ (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time {
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    NSParameterAssert(asset);
    AVAssetImageGenerator *assetImageGenerator = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetImageGenerator.appliesPreferredTrackTransform = YES;
    assetImageGenerator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [assetImageGenerator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60) actualTime:NULL error:&thumbnailImageGenerationError];
    
    if (!thumbnailImageRef)
        NSLog(@"thumbnailImageGenerationError %@", thumbnailImageGenerationError);
    
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef] : nil;
    return thumbnailImage;
}

+ (UIImage *)captureView:(UIView *)view {
    
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(view.bounds.size);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)captureScreen {
    
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIGraphicsBeginImageContext(keyWindow.bounds.size);
    [keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)cropImageinRect:(CGRect)rect  {
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    
    return resultImage;
}

+ (UIImage *)imageWithPath:(NSString *)path {
    NSData *data = [NSData dataWithContentsOfURL:[[NSURL alloc]initFileURLWithPath:path]];
    return [UIImage imageWithData:data];
}

@end

