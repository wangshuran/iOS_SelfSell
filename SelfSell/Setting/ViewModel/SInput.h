//
//  SInput.h
//  SelfSell
//
//  Created by liqiang on 2017/12/28.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"

@interface SInput : SObject

+ (instancetype)inputWithType:(NSUInteger)type info:(id)info;

- (instancetype)initWithType:(NSUInteger)type info:(id)info;

@property (nonatomic, assign) NSUInteger type;

@property (nonatomic, strong) id info;

@end
