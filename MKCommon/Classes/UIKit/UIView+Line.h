//
//  UIView+Line.h
//  azq
//
//  Created by Apple on 2017/9/8.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Line)

/**
 给View画线 makeLine 上下左右 H 上下 V 左右
 */
- (void)makeLine;
- (void)makeVLine;
- (void)makeHLine;
- (void)makeTopLine;
- (void)makeLeftLine;
- (void)makeRightLine;
- (void)makeBottomLine;

@end


typedef enum {
    SeparatorLinePositionTop,
    SeparatorLinePositionLeft,
    SeparatorLinePositionBottom,
    SeparatorLinePositionRight,
} SeparatorLinePosition;

#define lineColor [UIColor colorWithRed:199/255.0 green:199/255.0 blue:199/255.0 alpha:1]

@interface CGSeparatorLine : UIView

+ (UIView *)createVerticalAutolayoutLine;
+ (UIView *)createVerticalAutolayoutLineWithWidth:(CGFloat)width;

+ (UIView *)createHorizontalAutolayoutLine;
+ (UIView *)createHorizontalAutolayoutLineWithHeight:(CGFloat)height;

+ (CGSeparatorLine *)createLineAtTopWithWidth:(float)Width;

+ (CGSeparatorLine *)addSeparatorLineInView:(UIView *)view position:(SeparatorLinePosition)position;

+ (void)removeSeparatorLineInView:(UIView *)view;
@end
