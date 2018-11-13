//
//  UIImageView+URL.h
//  azq
//
//  Created by Apple on 2017/9/12.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IZQImageCompletionBlock)(UIImage *image);

@interface UIImageView (URL)
- (void)setImageWithURLString:(NSString *)urlStr;

- (void)setImageWithURLString:(NSString *)urlStr completed:(IZQImageCompletionBlock)completed;

- (void)setImageWithFilePath:(NSString *)pathStr;

- (void)setGifImageWithFilePath:(NSString *)pathStr;
/**
 *  设置头像 带有默认图像
 */
- (void)setAvatarImageWithUrlString:(NSString *)urlStr;

- (void)setImageWithSize100x100URLString:(NSString *)urlStr;
@end
