//
//  KKNotificationCenter.m
//  KKNotificationCenter
//
//  Created by Annie Lee on 2019/1/30.
//  Copyright © 2019 Annie Lee. All rights reserved.
//

#import "KKNotificationCenter.h"

@implementation KKObserver

- (instancetype)initWithObserver:(id)observer
                        selector:(SEL)aSelector
                            name:(NSString *)aName
                          object:(id)anObject
{
    self = [super init];
    if (self) {
        self.observer = observer;
        self.selector = aSelector;
        self.name = aName;
        self.object = anObject;
    }
    return self;
}

@end

@interface KKNotificationCenter ()
{
    NSMutableArray *kkObservers;
}
@end

@implementation KKNotificationCenter

+ (KKNotificationCenter *)defaultCenter
{
    static KKNotificationCenter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[KKNotificationCenter alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        kkObservers = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject
{
    KKObserver *kkObserver = [[KKObserver alloc] initWithObserver:observer selector:aSelector name:aName object:anObject];
    
    [kkObservers addObject:kkObserver];
}

- (void)postNotification:(NSNotification *)notification
{
    for (KKObserver *kkObserver in kkObservers) {
        if ([kkObserver.name isEqualToString:notification.name]) {
            
            id target = kkObserver.observer;
            
            if ([target respondsToSelector:kkObserver.selector]) {
                [target performSelector:kkObserver.selector];
            }
        }
    }
}

- (void)removeObserver:(id)observer
{
    NSInteger count = [kkObservers count];
    
    for (int i = 0; i < count; i++) {
        
        KKObserver *kkObserver = kkObservers[i];
        
        if ([kkObserver.observer isEqual:observer]) {
            [kkObservers removeObject:kkObservers[i]];
            count --;
            i --;
        }
    }
}

@end
