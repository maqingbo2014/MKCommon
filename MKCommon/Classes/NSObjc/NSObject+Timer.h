//
//  NSObject+Timer.h
//  azq
//
//  Created by levi on 2018/10/18.
//  Copyright © 2018 xinhuo-tech. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Timer)

/**
 获取当前对象的gcdTimerName，注意，如果在同一个对象上加2个或以上timer，会出错，因为此方法返回的是同一个值

 @return timerName
 */
- (NSString*)timerName;


/**
 取消当前对象的gcdTimer
 如果gcdTimer持有self，则在dealloc中调用此方法也无效，因为dealloc是当前对象可正常销毁的情况下才会调用，但是timer与self相互持有，dealloc方法是永远不会调用的
 所以，建议做法是gcdTimer不要持有self,即，使用weakSelf，这样不需要在dealloc中调用cancelTimer也可正常销毁self
 */
- (void)cancelTimer;

@end

NS_ASSUME_NONNULL_END
