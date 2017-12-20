//
//  SRequest.m
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SRequest.h"

@implementation SRequest

#pragma mark - Interface

- (instancetype)initWithHost:(NSString *)host {
    self = [self init];
    
    return self;
}

- (NSString *)CFBundleVersion {
    return [LApp CFBundleVersion];
}

- (NSString *)CFBundleIdentifier {
    return [LApp CFBundleIdentifier];
}

- (NSString *)CFBundleShortVersionString {
    return [LApp CFBundleShortVersionString];
}

- (NSString *)deviceIdentifier {
    return [[UIDevice currentDevice] uniqueDeviceIdentifier];
}

- (NSString *)getQuery {
    NSMutableDictionary * keyValues = [self getParameter];
    NSMutableArray * params = [[NSMutableArray alloc] initWithCapacity:keyValues.count];
    
    for (NSString * key in keyValues.allKeys) {
        id value = [keyValues objectForKey:key];
        if ([value isEqual:[NSNull null]] || value == nil) {
            continue;
        }
        
        NSString * param = [NSString stringWithFormat:@"%@=%@", key, value];
        [params addObject:param];
    }
    
    return [params componentsJoinedByString:@"&"];
}

- (NSMutableDictionary *)getParameter {
    NSMutableDictionary * keyValues = [self propertyKeyValues:YES];
    [keyValues removeObjectForKey:@""];
    [keyValues removeObjectForKey:@""];
    [keyValues removeObjectForKey:@""];
    
    return keyValues;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
}

@end
