//
//  NSObject+MJModel.m
//  azq
//
//  Created by Apple on 2017/11/7.
//  Copyright © 2017年 xinhuo_mqb. All rights reserved.
//

#import "NSObject+MJModel.h"
@import MJExtension;

@implementation NSObject (MJModel)

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property {
    //为了解决json字符串先赋值给oc字典后，类型转换crash问题，如:
    //json->oldValue:0
    //model中值为NSString类型
    //如果先将json转为dic，dic中对应value值为NSNumber类型，则向oldValue发送isEqualToString消息会crash
    id tempValue = oldValue;
    
    if ([property.type.code isEqualToString:@"NSString"]) {
        tempValue = [NSString stringWithFormat:@"%@", tempValue];

        if ([tempValue isKindOfClass:[NSNull class]] || tempValue == nil || [tempValue isEqual:[NSNull null]] ||  [tempValue isEqualToString:@"(null)"] ||  [tempValue isEqualToString:@"(\n)"] ) {
            return @"";
        }
    }
    if ([property.type.code isEqualToString:@"NSNumber"]) {
//        tempValue = [NSNumber numberWithFloat:[tempValue floatValue]];
        
        if ([tempValue isKindOfClass:[NSNull class]] || tempValue == nil || [tempValue isEqual:[NSNull null]] ||  [tempValue isEqualToString:@"(null)"] ||  [tempValue isEqualToString:@"(\n)"] ) {
            return @0;
        }
    }
    
    return tempValue;
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
