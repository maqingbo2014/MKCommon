//
//  UIView+Line.m
//  azq
//
//  Created by Apple on 2017/9/8.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "UIView+Line.h"


@implementation UIView (Line)

- (void)makeLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionTop];
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionBottom];
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionRight];
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionLeft];
}

- (void)makeVLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionRight];
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionLeft];
}

- (void)makeHLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionTop];
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionBottom];
}

- (void)makeTopLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionTop];
}

- (void)makeLeftLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionLeft];
}

- (void)makeRightLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionRight];
}

- (void)makeBottomLine {
    [CGSeparatorLine addSeparatorLineInView:self position:SeparatorLinePositionBottom];
}

@end


#define kPixelWidth         (1.0 / [UIScreen mainScreen].scale)
@interface CGSeparatorLine()
@property (nonatomic, assign)SeparatorLinePosition position;
@end
@implementation CGSeparatorLine


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = lineColor;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.position = SeparatorLinePositionTop;
    }
    return self;
}

+ (UIView *)createVerticalAutolayoutLine {
    return [[self class] createVerticalAutolayoutLineWithWidth:kPixelWidth];
}
+ (UIView *)createVerticalAutolayoutLineWithWidth:(CGFloat)width {
    UIView *v = [UIView new];
    v.backgroundColor = lineColor;
    v.translatesAutoresizingMaskIntoConstraints = NO;
    [v addConstraint:[NSLayoutConstraint constraintWithItem:v
                                                  attribute:NSLayoutAttributeWidth
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:nil
                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                 multiplier:1.0
                                                   constant:width]];
    return v;
}

+ (UIView *)createHorizontalAutolayoutLine {
    return [[self class] createHorizontalAutolayoutLineWithHeight:kPixelWidth];
}

+ (UIView *)createHorizontalAutolayoutLineWithHeight:(CGFloat)height {
    UIView *v = [UIView new];
    v.backgroundColor = lineColor;
    v.translatesAutoresizingMaskIntoConstraints = NO;
    [v addConstraint:[NSLayoutConstraint constraintWithItem:v
                                                  attribute:NSLayoutAttributeHeight
                                                  relatedBy:NSLayoutRelationEqual
                                                     toItem:nil
                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                 multiplier:1.0
                                                   constant:kPixelWidth]];
    return v;
}


+ (CGSeparatorLine *)createLineAtTopWithWidth:(float)Width {
    return [[CGSeparatorLine alloc] initWithFrame:CGRectMake(0, 0, Width, kPixelWidth)];
}

+ (CGSeparatorLine *)addSeparatorLineInView:(UIView *)view position:(SeparatorLinePosition)position {
    if ([view isKindOfClass:[UIView class]]) {
        CGRect lineRect = CGRectZero;
        UIViewAutoresizing autoresizing = UIViewAutoresizingFlexibleWidth;
        switch (position) {
            case SeparatorLinePositionTop:
                lineRect = CGRectMake(0, 0, view.frame.size.width, kPixelWidth);
                autoresizing = UIViewAutoresizingFlexibleWidth;
                break;
            case SeparatorLinePositionLeft:
                lineRect = CGRectMake(0, 0, kPixelWidth, view.frame.size.height);
                autoresizing = UIViewAutoresizingFlexibleHeight;
                break;
            case SeparatorLinePositionBottom:
                lineRect = CGRectMake(0, view.frame.size.height - kPixelWidth, view.frame.size.width, kPixelWidth);
                autoresizing = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
                break;
            case SeparatorLinePositionRight:
                lineRect = CGRectMake(view.frame.size.width-kPixelWidth, 0, kPixelWidth, view.frame.size.height);
                autoresizing = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
                break;
            default:
                break;
        }
        CGSeparatorLine *line = [[CGSeparatorLine alloc] initWithFrame:lineRect];
        line.position = position;
        line.autoresizingMask = autoresizing;
        [view addSubview:line];
        return line;
    }
    return nil;
}

+ (void)removeSeparatorLineInView:(UIView *)view {
    for (UIView *subview in [view.subviews copy]) {
        if ([subview isKindOfClass:[CGSeparatorLine class]])
            [subview removeFromSuperview];
    }
}

- (void)setFrame:(CGRect)frame {
    if (self.superview == nil)
        [super setFrame:frame];
    else {
        CGRect lineRect = CGRectZero;
        switch (_position) {
            case SeparatorLinePositionTop:
                lineRect = CGRectMake(0, 0, self.superview.frame.size.width, kPixelWidth);
                break;
            case SeparatorLinePositionLeft:
                lineRect = CGRectMake(0, 0, kPixelWidth, self.superview.frame.size.height);
                break;
            case SeparatorLinePositionBottom:
                lineRect = CGRectMake(0, self.superview.frame.size.height - kPixelWidth, self.superview.frame.size.width, kPixelWidth);
                break;
            case SeparatorLinePositionRight:
                lineRect = CGRectMake(self.superview.frame.size.width-kPixelWidth, 0, kPixelWidth, self.superview.frame.size.height);
                break;
            default:
                break;
        }
        [super setFrame:lineRect];
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
