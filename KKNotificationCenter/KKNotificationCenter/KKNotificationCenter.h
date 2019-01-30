//
//  KKNotificationCenter.h
//  KKNotificationCenter
//
//  Created by Annie Lee on 2019/1/30.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKObserver : NSObject
@property id observer;
@property SEL selector;
@property NSString *name;
@property id object;
@end

@interface KKNotificationCenter : NSObject

+ (KKNotificationCenter *)defaultCenter;

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
- (void)postNotification:(NSNotification *)notification;
- (void)removeObserver:(id)observer;

@end

NS_ASSUME_NONNULL_END
