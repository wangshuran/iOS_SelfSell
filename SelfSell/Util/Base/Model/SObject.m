//
//  SObject.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"

@implementation SObject

#pragma mark - LReflectProtocol

- (BOOL)reflect:(NSDictionary *)obj {
    [self mj_setKeyValues:obj];
    return YES;
}

@end
