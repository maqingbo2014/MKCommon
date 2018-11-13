//
//  UIView+Xib.h
//  azq
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Xib)
/** 从xib中创建一个控件 */
+ (instancetype)viewFromXib;

+ (instancetype)createViewFromNib;

+ (instancetype)createViewFromNibName:(NSString *)nibName;
@end
