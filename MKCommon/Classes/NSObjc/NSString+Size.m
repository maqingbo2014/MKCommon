//
//  NSString+Size.m
//  azq
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (float)heightForFontSize:(float)fontSize andWidth:(float)width {
    return [self sizeForFontSize:fontSize andWidth:width].height;
}

- (CGSize)sizeForFontSize:(float)fontSize andWidth:(float)width {
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return [self sizeForFont:font andWidth:width];
}

- (CGSize)sizeForFont:(UIFont *)font andWidth:(float)width {
    NSDictionary *dict=@{NSFontAttributeName : font};
    CGRect rect=[self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dict context:nil];
    return rect.size;
}

@end
