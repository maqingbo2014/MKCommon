//
//  UIButton+URL.m
//  azq
//
//  Created by Apple on 2017/9/12.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "UIButton+URL.h"
#import <SDWebImage/UIButton+WebCache.h>
@implementation UIButton (URL)

- (void)setImageWithURLString:(NSString *)urlStr {
    if ([urlStr hasPrefix:@"https://img1"]) {
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"https://img1" withString:@"https://image"];
    }
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Family_ImageHolder"]];
}

- (void)setAvatarImageWithUrlString:(NSString *)urlStr {
    if ([urlStr hasPrefix:@"https://img1"]) {
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"https://img1" withString:@"https://image"];
    }
    [self sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"Family_ImageHolder"]];
}

@end

@implementation UIButton (Custom)

- (void)setNormalTitle:(NSString *)title {
    [self setTitle:title forState:(UIControlStateNormal)];
}

- (void)setNormalTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:(UIControlStateNormal)];
}

- (void)setNormalBackImage:(UIImage *)image{
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

- (void)setNormalImage:(UIImage *)image{
    [self setImage:image forState:UIControlStateNormal];
}

- (void)setHighlightedTitleColor:(UIColor *)color {
    [self setTitleColor:color forState:(UIControlStateHighlighted)];
}

- (void)setHighlightedImage:(UIImage *)image{
    [self setImage:image forState:UIControlStateHighlighted];
}

- (void)setHighlightedBackImage:(UIImage *)image{
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

- (void)addDefaultTarget:(id)target action:(SEL)selector{
    [self addTarget:target action:selector forControlEvents:(UIControlEventTouchUpInside)];
}

@end
