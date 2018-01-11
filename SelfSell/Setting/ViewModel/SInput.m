//
//  SInput.m
//  SelfSell
//
//  Created by liqiang on 2017/12/28.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SInput.h"

@implementation SInput

+ (instancetype)inputWithType:(NSUInteger)type info:(id)info {
    return [[self alloc] initWithType:type info:info];
}

- (instancetype)initWithType:(NSUInteger)type info:(id)info {
    self = [super init];
    
    self.type = type;
    self.info = info;
    
    return self;
}

@end
