//
//  BaseModel.m
//  azq
//
//  Created by Apple on 2018/9/12.
//  Copyright © 2018年 xinhuo_mqb. All rights reserved.
//

#import "BaseModel.h"
#import <objc/message.h>
#import <MJExtension/MJExtension.h>

#define BaseModelKey [NSString stringWithFormat:@"%@_%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"],[self class]]

static  BaseModel*sharedInstance = nil;

@implementation BaseModel

MJCodingImplementation

MJLogAllIvars

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSData *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:BaseModelKey];
        sharedInstance = [NSKeyedUnarchiver unarchiveObjectWithData: userInfo];
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc]init];
        }
        unsigned int count = 0;
        objc_property_t *members = class_copyPropertyList([self class], &count);
        
        //遍历属性列表
        for (int i = 0 ; i < count; i++) {
            objc_property_t var = members[i];
            //获取变量名称
            const char *memberName = property_getName(var);
            [sharedInstance addObserver:sharedInstance forKeyPath:[NSString stringWithCString:memberName encoding:NSUTF8StringEncoding] options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
            
        }
        free(members);
    });
    return sharedInstance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    
    if(sharedInstance == nil){
        static dispatch_once_t once;
        dispatch_once(&once, ^{
            sharedInstance = [super allocWithZone:zone];
        });
    }
    return sharedInstance;
}

/** 写入文件*/
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSData *userData =  [NSKeyedArchiver archivedDataWithRootObject:[[self class] sharedInstance]];
    [[NSUserDefaults standardUserDefaults] setObject:userData forKey:BaseModelKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)dealloc {
    unsigned int count = 0;
    objc_property_t *members = class_copyPropertyList([self class], &count);
    
    //遍历属性列表
    for (int i = 0 ; i < count; i++) {
        objc_property_t var = members[i];
        //获取变量名称
        const char *memberName = property_getName(var);
        [self removeObserver:self forKeyPath:[NSString stringWithCString:memberName encoding:NSUTF8StringEncoding]];
        
    }
    free(members);
}

@end
