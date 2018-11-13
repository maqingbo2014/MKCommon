//
//  UIImageView+URL.m
//  azq
//
//  Created by Apple on 2017/9/12.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "UIImageView+URL.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIImage+GIF.h>
#import "DefineMagic.h"

@implementation UIImageView (URL)

- (NSString*)fixableURLStr4originalURLStr:(NSString*)urlStr{
    if ([urlStr hasPrefix:@"https://img1"]) {
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"https://img1" withString:@"https://image"];
    }
    
    return urlStr;
}

- (void)setImageWithURLString:(NSString *)urlStr {
    [self sd_setImageWithURL:[NSURL URLWithString:[self fixableURLStr4originalURLStr:urlStr]] placeholderImage:[UIImage imageNamed:@"Family_ImageHolder"]];
}

- (void)setImageWithURLString:(NSString *)urlStr completed:(IZQImageCompletionBlock)completed{
    [self sd_setImageWithURL:[NSURL URLWithString:[self fixableURLStr4originalURLStr:urlStr]] placeholderImage:[UIImage imageNamed:@"Family_ImageHolder"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            IZQBLOCK_EXE(completed, image);
        }
    }];
}

- (void)setImageWithFilePath:(NSString *)pathStr {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        UIImage *image = [UIImage imageWithData:[[NSData alloc]initWithContentsOfURL:[[NSURL alloc] initFileURLWithPath:pathStr]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    });
}

- (void)setGifImageWithFilePath:(NSString *)pathStr {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        UIImage *image = [UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfFile:pathStr]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = image;
        });
    });
}

- (void)setAvatarImageWithUrlString:(NSString *)urlStr {
    [self sd_setImageWithURL:[NSURL URLWithString:[self fixableURLStr4originalURLStr:urlStr]] placeholderImage:[UIImage imageNamed:@"Family_ImageHolder"]];
}

- (void)setImageWithSize100x100URLString:(NSString *)urlStr {
    urlStr = [[self fixableURLStr4originalURLStr:urlStr] stringByAppendingString:@"?imageView2/0/w/300/h/300"];
 
    
    
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageNamed:@"Family_ImageHolder"]];
}

@end
