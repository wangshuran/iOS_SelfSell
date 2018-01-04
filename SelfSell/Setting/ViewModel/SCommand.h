//
//  SCommand.h
//  SelfSell
//
//  Created by liqiang on 2017/12/28.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>
#import "SInput.h"

@interface SCommand : RACCommand

- (instancetype)initWithSignal:(RACSignal * (^)(SInput * input))signalBlock;

@end
