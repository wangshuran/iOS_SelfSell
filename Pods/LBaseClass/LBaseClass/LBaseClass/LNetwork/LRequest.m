//
//  LRequest.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LRequest.h"
#import "LApp.h"
#import "UIDevice+IdentifierAddition.h"

@implementation LRequest

#pragma mark - Interface


#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.method = HttpMethodGet;
    self.timeoutInterval = 30;
    self.bundleIdentifier = [LApp CFBundleIdentifier];
    self.releaseVersion = [LApp CFBundleShortVersionString];
    self.buildVersion = [LApp CFBundleVersion];
    self.deviceIdentifier = [[UIDevice currentDevice] uniqueDeviceIdentifier];
    self.responseClass = LResponse.class;
    self.isCache = NO;
    self.cacheInterval = 60 * 60 * 24;
}

#pragma mark - LSerializableProtocol

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
    
    NSMutableSet * removeKeys = [LModel propertyKeys:YES];
    [keyValues removeObjectsForKeys:removeKeys.allObjects];

    [keyValues removeObjectForKey:@"url"];
    [keyValues removeObjectForKey:@"method"];
    [keyValues removeObjectForKey:@"timeoutInterval"];
    [keyValues removeObjectForKey:@"responseClass"];
    [keyValues removeObjectForKey:@"isCache"];
    [keyValues removeObjectForKey:@"cacheInterval"];
    
    return keyValues;
}

@end
