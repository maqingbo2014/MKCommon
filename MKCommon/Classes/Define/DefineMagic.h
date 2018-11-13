//
//  DefineMagic.h
//
//
//  Created by ziyuan_Xu on 16/5/24.
//  Copyright © 2016年 shcommit. All rights reserved.
//

#ifndef DefineMagic_h
#define DefineMagic_h

#ifdef DEBUG
#define GDDLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define GDDLog(...)
#endif

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
//过期的方法
#pragma clang diagnostic pop


//颜色设置
#define RGBA(A,B,C,Alpha) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:Alpha]
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1]

#define kResourcePath(name, type) ([[NSBundle mainBundle] pathForResource:name ofType:type])
#define kImageFromFile(name) [[UIImage alloc] initWithContentsOfFile:kResourcePath(name, @"png")]

#define IsNilOrNull(_ref)   (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) || ([(_ref) isKindOfClass:[NSNull class]]) )
#define isValidStr(_ref)    ((IsNilOrNull(_ref)==NO) && ([_ref length]>0))
#define clearNil(str)       (isValidStr(str)?str:@"")
#define clearNilWithZero(str)       (isValidStr(str)?str:@"0")
#define IZQDFixableefaultStr(str) IZQFixableStr(str, IZQDefaultPlaceholderStr)
#define IZQFixableStr(str, placeholder) isValidStr(str) ? str : placeholder

#define ApplicationDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define USER_DEFAULT        [NSUserDefaults standardUserDefaults]
#define NOTIFICATIONCENTER  [NSNotificationCenter defaultCenter]

#define SelfViewHeight        self.view.frame.size.height
#define SelfViewWidth         self.view.frame.size.width
// 导航栏高度
#define NavHeight self.navigationController.navigationBar.frame.size.height
// 标签栏高度
#define TabBarHeight self.tabBar.frame.size.height
// 状态栏高度
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].height

#pragma mark - 集成键盘时的相关宏定义 375，667


//导航条高度
#define kNavBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height+NavHeight
//标签栏的高度
#define kTabBarHeight 49.0
//左右间距
#define kCellMargin 15.0
//高度缩放
#define IZQHeightScaleRate SCREEN_HEIGHT/IZQLengthIp6Height
#define IZQHeightScaleRateUpTo1 MIN(IZQHeightScaleRate, 1)
#define IZQScaleHeight(height) height*IZQHeightScaleRate
//#define IZQIsMinDevice IZQLengthMinEdge==320
//#define IZQScaleMargin(margin) (IZQIsMinDevice? 8:margin*IZQHeightScaleRate)

#pragma mark 字体相关
#define UIFont_size(size) [UIFont systemFontOfSize:size]
#define UIFont_bold_Size(size) [UIFont boldSystemFontOfSize:size]

//主题色
#define kTheThemeColor [UIColor colorWithHexString:@"#ff7200"]

//聊天界面字体大小
#define  LMFontSize 13
#define  FontSize(sizefont)  [UIFont systemFontOfSize:sizefont+([UIScreen mainScreen].bounds.size.width/320)]
//判断系统版本的宏
#define IS_IOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)? (YES):(NO))
#define IS_IOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))
#define IS_IOS9 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)? (YES):(NO))
#define IS_IOS10 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)? (YES):(NO))
#define IS_IOS11 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0)? (YES):(NO))

#define IZQBLOCK_EXE(block, ...) if (block) { block(__VA_ARGS__); }

#define  adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
NSInteger argument = 2;\
invocation.target = scrollView;\
invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
[invocation setArgument:&argument atIndex:2];\
[invocation retainArguments];\
[invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)


//单例
#undef	SINGLETON_MANAGER_H
#define SINGLETON_MANAGER_H( __class ) \
+ (instancetype)sharedManager;\
+ (void)freeSingle;

#undef	SINGLETON_MANAGER_M
#define SINGLETON_MANAGER_M( __class )  \
static __class *__sharedInstance__ = nil; \
+ (instancetype)sharedManager {   \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
__sharedInstance__ = [[__class alloc]init]; \
});\
return __sharedInstance__; \
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone { \
if(__sharedInstance__ == nil){   \
static dispatch_once_t once;  \
dispatch_once(&once, ^{   \
__sharedInstance__ = [super allocWithZone:zone];  \
});   \
}   \
return __sharedInstance__;  \
}\
+ (void)freeSingle {\
    __sharedInstance__ = nil;\
}


#endif /* DefineMagic_h */
