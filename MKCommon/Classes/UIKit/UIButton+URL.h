//
//  UIButton+URL.h
//  azq
//
//  Created by Apple on 2017/9/12.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (URL)

- (void)setImageWithURLString:(NSString *)urlStr;

/**
 *  设置头像 带有默认图像
 */
- (void)setAvatarImageWithUrlString:(NSString *)urlStr;

@end

@interface UIButton (Custom)
- (void)setNormalTitle:(NSString*)title;
- (void)setNormalTitleColor:(UIColor*)color;

- (void)setNormalBackImage:(UIImage*)image;
- (void)setNormalImage:(UIImage*)image;

- (void)setHighlightedTitleColor:(UIColor *)color;
- (void)setHighlightedImage:(UIImage *)image;
- (void)setHighlightedBackImage:(UIImage*)image;

- (void)addDefaultTarget:(id)target action:(SEL)selector;
@end
