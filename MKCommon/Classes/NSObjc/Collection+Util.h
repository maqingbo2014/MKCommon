//
//  Collection+Util.h
//  NewSDK
//
//  Created by levi on 2018/6/5.
//  Copyright © 2018年 sfgame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSArray (SF)

- (id)objectSafetyAtIndex:(NSUInteger)index;

+ (BOOL)isEmpty:(NSArray*)arr;
+ (BOOL)isNotEmpty:(NSArray*)arr;

@end

@interface NSMutableArray (SF)

- (void)insertAtFirst:(id)object;

@end

@interface NSDictionary (SF)

+ (BOOL)isEmpty:(NSDictionary*)dic;
+ (BOOL)isNotEmpty:(NSDictionary*)dic;
- (id)objectSafetyForKey:(NSObject *)key;

@end

@interface NSSet (SF)

+ (BOOL)isEmpty:(NSSet*)set;
+ (BOOL)isNotEmpty:(NSSet*)set;

@end


