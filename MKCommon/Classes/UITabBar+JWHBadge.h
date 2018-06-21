//
//  UITabBar+JWHBadge.h
//  jwh
//
//  Created by ziyuan_Xu on 16/9/4.
//  Copyright © 2016年 shcommit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (JWHBadge)
- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点
@end
