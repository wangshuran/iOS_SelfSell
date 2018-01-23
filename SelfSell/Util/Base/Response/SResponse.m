//
//  SResponse.m
//  SelfSell
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SResponse.h"

@implementation SResponse

#pragma mark - Interface

- (void)setMessage:(NSString *)message {
    _message = message;
    self.msg = _message;
}

#pragma mark - LReflectProtocol

- (BOOL)reflect:(NSDictionary *)obj {
    NSNumber * success = [obj objectForKey:@"success"];
    if (success) {
        self.status = success.boolValue;
    }
    [self mj_setKeyValues:obj];
    NSMutableSet * propertyKeys = [self propertyKeys:YES];
    NSDictionary * data = [obj objectForKey:@"data"];
    if (![propertyKeys containsObject:@"data"] && data) {
        [self mj_setKeyValues:data];
    }    
    return YES;
}

@end
