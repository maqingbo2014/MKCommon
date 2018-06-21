//
//  UIImage+Extension.m
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    return [self resizedImageWithName:name left:0.5 top:0.5];
}

+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return theImage;
}

//PNG图片高斯模糊
+ (UIImage *)gaussianBlurImageWithImageName:(NSString*)imageName
{
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage1 = [[CIImage alloc] initWithImage:[UIImage imageNamed:imageName]];
    
    CIFilter *fiter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [fiter setValue:inputImage1 forKey:kCIInputImageKey];
    [fiter setValue:[NSNumber numberWithFloat:10.0] forKey:@"inputRadius"];
    
    CIImage *result = [fiter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[result extent]];
    
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return image;
}

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

- (UIImage *)scaleTo828 {
    
    CGFloat W = 828.00;
    CGFloat bl = 0.0;
    
    if (self.size.width >= W){
        bl = W/self.size.width;
    }else{
        bl = 1.0;
    }
    CGSize scaleSize =  CGSizeMake(bl * self.size.width, bl* self.size.height);
    UIGraphicsBeginImageContext(scaleSize);
    [self drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)scaletoScreen
{
    
    CGFloat W = 414.00;//[UIScreen mainScreen].bounds.size.width*3;
    CGFloat H = 736.00;//[UIScreen mainScreen].bounds.size.height*3;
    CGFloat bl = 0.0;
    if (self.size.width >= W && self.size.height >= H) {
        if (W/self.size.width <= H/self.size.height) {
            bl = W/self.size.width;
        }else{
            bl = H/self.size.height;
        }
    }else if (self.size.width >= W ){
        bl = W/self.size.width;
    }else if (self.size.height >= H){
        bl = H/self.size.height;
    }else{
        bl = 1;
    }
    
    CGSize scaleSize =  CGSizeMake(bl * self.size.width, bl* self.size.height);
    UIGraphicsBeginImageContext(scaleSize);
    [self drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha
{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    
    CGContextSetAlpha(ctx, alpha);
    
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage*)scaleToSize:(CGSize)size
{
    //    //不用CGImageGetHeight(self.CGImage)，图片拍摄后会旋转90度，exif属性会记录，CGImageGetHeight实际会获得宽度而不是高度
    //    CGFloat width = self.size.width;
    //    CGFloat height = self.size.height;
    //
    //    float verticalRadio = size.height*1.0/height;
    //    float horizontalRadio = size.width*1.0/width;
    //
    //    float radio = 1;
    //    if(verticalRadio>1 && horizontalRadio>1)
    //    {
    //        radio = verticalRadio > horizontalRadio ? horizontalRadio : verticalRadio;
    //    }
    //    else
    //    {
    //        radio = verticalRadio < horizontalRadio ? verticalRadio : horizontalRadio;
    //    }
    //
    //    width = width*radio;
    //    height = height*radio;
    //
    //    int xPos = (size.width - width)/2;
    //    int yPos = (size.height - height)/2;
    //
    //    // 创建一个bitmap的context
    //    // 并把它设置成为当前正在使用的context
    //    UIGraphicsBeginImageContext(size);
    //
    //    // 绘制改变大小的图片
    //    [self drawInRect:CGRectMake(xPos, yPos, width, height)];
    //
    //    // 从当前context中创建一个改变大小后的图片
    //    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    //
    //    // 使当前的context出堆栈
    //    UIGraphicsEndImageContext();
    //
    //    // 返回新的改变大小后的图片
    //    return scaledImage;
    
    CGFloat W = size.width;
    CGFloat H = size.height;
    CGFloat bl = 0.0;
    if (self.size.width >= W && self.size.height >= H) {
        if (W/self.size.width <= H/self.size.height) {
            bl = W/self.size.width;
        }else{
            bl = H/self.size.height;
        }
    }else if (self.size.width >= W ){
        bl = W/self.size.width;
    }else if (self.size.height >= H){
        bl = H/self.size.height;
    }else{
        bl = 1;
    }
    
    CGSize scaleSize =  CGSizeMake(bl * self.size.width, bl* self.size.height);
    UIGraphicsBeginImageContext(scaleSize);
    [self drawInRect:CGRectMake(0, 0, scaleSize.width, scaleSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (UIImage *)shrinkImageForSize:(CGSize)aSize
{
    CGFloat scale = [UIScreen mainScreen].scale;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 aSize.width * scale,
                                                 aSize.height * scale,
                                                 8,
                                                 0,
                                                 colorSpace,
                                                 kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedLast);
    CGContextDrawImage(context,
                       CGRectMake(0, 0, aSize.width * scale, aSize.height * scale),
                       self.CGImage);
    CGImageRef shrunken = CGBitmapContextCreateImage(context);
    UIImage *final = [UIImage imageWithCGImage:shrunken];
    CGContextRelease(context);
    CGImageRelease(shrunken);
    CGColorSpaceRelease(colorSpace);
    return final;
}

- (NSString *)saveImageWithName:(NSString *)imageName
          forCompressionQuality:(CGFloat )aQuality
{
    if (aQuality < 0) {
        aQuality = 0;
    }
    if (aQuality > 1.0f) {
        aQuality = 1.0f;
    }
    
    NSData* imageData=UIImageJPEGRepresentation(self, aQuality);
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSString *draftFolder = [NSString stringWithFormat:@"%@/tuweiaDraft",[FileManager appDocPath]];
    
    BOOL isDir;
    BOOL exists = [fm fileExistsAtPath:draftFolder isDirectory:&isDir];
    if (exists) {
        if (!isDir) {
            return nil;
        }
    }
    else {
        NSError *error;
        [fm createDirectoryAtPath:draftFolder withIntermediateDirectories:NO attributes:nil error:&error];
        if (error) {
            return nil;
        }
    }
    
    
    NSString* fullPathToFile = [draftFolder stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
    if ([[NSFileManager defaultManager] fileExistsAtPath:fullPathToFile]) {
        [[NSFileManager defaultManager] removeItemAtPath:fullPathToFile error:nil];
    }
    
    NSLog(@"save image%@ At path %@",self,fullPathToFile);
    
    if (![imageData writeToFile:fullPathToFile atomically:NO]) {
        return nil;
    }
    return fullPathToFile;
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


- (UIImage *)scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (NSString *)toBase64String {
    NSData *imageData = UIImageJPEGRepresentation(self, 1);
    NSString *encodedImageStr = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    NSLog(@"%@",encodedImageStr);
    NSString *baseString = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                         (CFStringRef)encodedImageStr,
                                                                                         NULL,
                                                                                         CFSTR(":/?#[]@!$&’()*+,;="),
                                                                                         kCFStringEncodingUTF8);
    return baseString;
}


+ (void)beginImageContextWithSize:(CGSize)size
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        if ([[UIScreen mainScreen] scale] == 2.0) {
            UIGraphicsBeginImageContextWithOptions(size, YES, 2.0);
        } else {
            UIGraphicsBeginImageContext(size);
        }
    } else {
        UIGraphicsBeginImageContext(size);
    }
}

+ (void)endImageContext
{
    UIGraphicsEndImageContext();
}

+ (UIImage*)imageFromView:(UIView*)view
{
    [self beginImageContextWithSize:[view bounds].size];
    BOOL hidden = [view isHidden];
    [view setHidden:NO];
    [[view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    [self endImageContext];
    [view setHidden:hidden];
    return image;
}

+ (UIImage*)imageFromView:(UIView*)view scaledToSize:(CGSize)newSize
{
    UIImage *image = [self imageFromView:view];
    if ([view bounds].size.width != newSize.width ||
        [view bounds].size.height != newSize.height) {
        image = [image scaledToSize:newSize];
    }
    return image;
}
@end

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

@end


@implementation UIButton (EX)
- (void)xr_setButtonImageWithUrl:(NSString *)urlStr {
    
    
    
    NSURL * url = [NSURL URLWithString:urlStr];
    
    
    
    // 根据图片的url下载图片数据
    
    
    
    dispatch_queue_t xrQueue = dispatch_queue_create("loadImage", NULL); // 创建GCD线程队列
    
    
    
    dispatch_async(xrQueue, ^{
        
        
        
        // 异步下载图片
        
        
        
        UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
        
        
        
        // 主线程刷新UI
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            [self setImage:img forState:UIControlStateNormal];
            
        });
        
        
        
    });
    
}
@end
