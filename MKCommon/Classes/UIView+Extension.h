//
//  UIView+Extension.h
//  azq
//
//  Created by Apple on 2017/9/14.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/** 从xib中创建一个控件 */
+ (instancetype)viewFromXib;

+ (instancetype)createViewFromNib;

+ (instancetype)createViewFromNibName:(NSString *)nibName;
@end
