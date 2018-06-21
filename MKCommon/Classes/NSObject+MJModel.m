//
//  NSObject+MJModel.m
//  azq
//
//  Created by Apple on 2017/11/7.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "NSObject+MJModel.h"
#import "MJExtension.h"
@implementation NSObject (MJModel)

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    if ([oldValue isKindOfClass:[NSNull class]] || oldValue == nil || [oldValue isEqual:[NSNull null]]) {
        if ([property.type.code isEqualToString:@"NSString"]) {
            return @"";
        }
        if ([property.type.code isEqualToString:@"NSNumber"]) {
            return @0;
        }
    }
    return oldValue;
}

- (void)setSelfModel:(id)model {
    unsigned int count = 0;
    objc_property_t *members = class_copyPropertyList([self class], &count);
    //遍历属性列表
    for (int i = 0 ; i < count; i++) {
        objc_property_t var = members[i];
        //获取变量名称
        const char *memberName = property_getName(var);
        NSString *key = [NSString stringWithCString:memberName encoding:NSUTF8StringEncoding];
        [self setValue:[model valueForKey:key] forKey:key];
    }
    free(members);
}

- (id)copyWithZone:(nullable NSZone *)zone {
    id model= [[[self class] allocWithZone:zone] init];
    unsigned int count = 0;
    objc_property_t *members = class_copyPropertyList([self class], &count);
    //遍历属性列表
    for (int i = 0 ; i < count; i++) {
        objc_property_t var = members[i];
        //获取变量名称
        const char *memberName = property_getName(var);
        NSString *key = [NSString stringWithCString:memberName encoding:NSUTF8StringEncoding];
        [model setValue:[self valueForKey:key] forKey:key];
    }
    free(members);
    return model;
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    id model= [[[self class] allocWithZone:zone] init];
    unsigned int count = 0;
    objc_property_t *members = class_copyPropertyList([self class], &count);
    //遍历属性列表
    for (int i = 0 ; i < count; i++) {
        objc_property_t var = members[i];
        //获取变量名称
        const char *memberName = property_getName(var);
        NSString *key = [NSString stringWithCString:memberName encoding:NSUTF8StringEncoding];
        [model setValue:[self valueForKey:key] forKey:key];
    }
    free(members);
    return model;
}

@end
