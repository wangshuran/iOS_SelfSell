//
//  LSingleton.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 liqiang. All rights reserved.
//

/**
 *  单例
 *
 *  @param name 类名
 *
 *  @return 类单实例
 */
#define LSingleton_h(name) + (instancetype)shared##name;

#if __has_feature(objc_arc) // ARC

/**
 *  单例
 *
 *  @param name 类名
 *
 *  @return 类单实例
 */
#define LSingleton_m(name) \
static id _instance; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
} \
\
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{ \
return _instance; \
} \

#else // 非ARC

/**
 *  单例
 *
 *  @param name 类名
 *
 *  @return 类单实例
 */
#define lSingleton_m(name) \
static id _instance; \
\
+ (id)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
\
+ (instancetype)shared##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
\
- (oneway void)release \
{ \
\
} \
\
- (id)autorelease \
{ \
return _instance; \
} \
\
- (id)retain \
{ \
return _instance; \
} \
\
- (NSUInteger)retainCount \
{ \
return 1; \
} \
\
+ (id)copyWithZone:(struct _NSZone *)zone \
{ \
return _instance; \
} \
\
+ (id)mutableCopyWithZone:(struct _NSZone *)zone{ \
return _instance; \
} \

#endif
