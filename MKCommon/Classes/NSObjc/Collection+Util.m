//
//  Collection+Util.m
//  NewSDK
//
//  Created by levi on 2018/6/5.
//  Copyright © 2018年 sfgame. All rights reserved.
//

#import "Collection+Util.h"

@implementation NSArray (SF)

- (id)objectSafetyAtIndex:(NSUInteger)index{
    if(self.count == 0) {
        NSLog(@"--- mutableArray have no objects ---");
        return (nil);
    }
    if(index > MAX(self.count - 1, 0)) {
        NSLog(@"--- index:%li out of mutableArray range ---", (long)index);
        return (nil);
    }
    return ([self objectAtIndex:index]);
}

+ (BOOL)isEmpty:(NSArray*)arr {
    if (!arr) {
        return YES;
    }
    
    return arr.count == 0;
}

+ (BOOL)isNotEmpty:(NSArray*)arr {
    return ![NSArray isEmpty:arr];
}

- (NSArray *)reverseArr{
    return self.reverseObjectEnumerator.allObjects;
}

@end

@implementation NSMutableArray (SF)

- (void)insertAtFirst:(id)object{
    [self insertObject:object atIndex:0];
}

@end

@implementation NSDictionary (SF)

+ (BOOL)isEmpty:(NSDictionary*)dic {
    if (!dic) {
        return YES;
    }
    
    return dic.count == 0;
}

+ (BOOL)isNotEmpty:(NSDictionary*)dic {
    return ![NSDictionary isEmpty:dic];
}

- (id)objectSafetyForKey:(NSObject *)key {
    if ([[self objectForKey:key] isKindOfClass:[NSNull class]]) {
        return nil;
    } else if ([[self objectForKey:key] isKindOfClass:[NSString class]]) {
        NSString *value = [self objectForKey:key];
        if ([value isEqualToString:@""] || [value isEqualToString:@"NIL"] || [value isEqualToString:@"Nil"] || [value isEqualToString:@"nil"] || [value isEqualToString:@"nil"] || [value isEqualToString:@"NULL"] || [value isEqualToString:@"Null"] || [value isEqualToString:@"null"] || [value isEqualToString:@"(NULL)"] || [value isEqualToString:@"(null)"] || [value isEqualToString:@"<NULL>"] || [value isEqualToString:@"<Null>"] || [value isEqualToString:@"<null>"]) {
            return nil;
        }
    }
    
    return [self objectForKey:key];
}
@end

@implementation NSSet (SF)

+ (BOOL)isEmpty:(NSSet*)set {
    if (!set) {
        return YES;
    }
    
    return set.count == 0;
}

+ (BOOL)isNotEmpty:(NSSet*)set {
    return ![NSSet isEmpty:set];
}

@end




