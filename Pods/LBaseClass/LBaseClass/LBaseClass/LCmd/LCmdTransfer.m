//
//  LCmdTransfer.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LCmdTransfer.h"

@implementation LCmdTransfer

#pragma mark - Interface

+ (instancetype)cmd:(LCmd *)cmd value:(id)value {
    return [[self alloc] initWithCmd:cmd value:value];
}

- (instancetype)initWithCmd:(LCmd *)cmd value:(id)value {
    self = [super init];
    
    self.cmd = cmd;
    self.value = value;
    
    return self;
}

@end
