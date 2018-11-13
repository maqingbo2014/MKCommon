//
//  SystemDefine.h
//  TuiYa
//
//  Created by jessy on 15/6/28.
//  Copyright (c) 2015年 tuweia. All rights reserved.
//

#ifndef __TuiYa__SystemDefine__
#define __TuiYa__SystemDefine__

//判断是真机还是模拟器
#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR 1
#elif TARGET_OS_IPHONE
#define SIMULATOR 0
#endif

//判断系统版本的宏
#define IS_IOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)? (YES):(NO))
#define IS_IOS8 (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? (YES):(NO))

//app信息
#define IZQ_APP_NAME [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"]

//获取推送设备号
#define DeviceToken @"izq_deviceToken"
#define getDeviceToken [[NSUserDefaults standardUserDefaults] objectForKey:DeviceToken]
#define setDeviceToken(Token) [[NSUserDefaults standardUserDefaults] setObject:Token forKey:DeviceToken]

static const NSString *___uuid;
#define KGetUUID (___uuid == nil ? [MKuuid getUUID] : ___uuid)

//屏幕宽高
#define KWindow [[[UIApplication sharedApplication] delegate] window]
#define kWindowSize [[UIScreen mainScreen] bounds].size
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT  [UIScreen mainScreen].bounds.size.height

#define SCREEN_SCALE [UIScreen mainScreen].scale


//颜色设置
#define RGBA(A,B,C,Alpha) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:Alpha]
#define RGB(A,B,C) [UIColor colorWithRed:A/255.0 green:B/255.0 blue:C/255.0 alpha:1]
#endif

#define NSLogRect(rect)         NSLog(@"%@",NSStringFromCGRect(rect))
#define NSLogSize(size)         NSLog(@"%@",NSStringFromCGSize(size))
#define NSLogPoint(point)       NSLog(@"%@",NSStringFromCGPoint(point))
#define NSLogErrorInfo(error)   NSLog(@"Error:%@",error);
#define BarHeight  [[UIApplication sharedApplication] statusBarFrame].size.height+44

#define StringToEmpty(string)         (string?[NSString stringWithFormat:@"%@",string]:@"")
#define ArrayToEmpty(array)           (array?array:@[])
#define DictionaryToEmpty(dictionary) (dictionary?dictionary:@{})

#pragma mark -------  Debug 模式

#ifndef RunWhenDebug
#define RunWhenDebug(block) do {                                                 \
                                if (DEBUG && block) block();                     \
                            } while (0)
#endif

#ifdef DEBUG
#define NSLog(format, ...) do {                                                                             \
                                fprintf(stderr, "<%s : %d> %s\n",                                           \
                                [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
                                __LINE__, __func__);                                                        \
                                (NSLog)((format), ##__VA_ARGS__);                                           \
                                fprintf(stderr, "\n");                                               \
                            } while (0)
#else
#define NSLog(format, ...) nil
#endif

//在block外使用weak防止循环引用，在block内使用strong防止过早释放
#define WEAK_SELF __weak typeof(self)weakSelf = self;
#define STRONG_SELF __strong typeof(weakSelf)self = weakSelf;

//单例
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once(&once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

