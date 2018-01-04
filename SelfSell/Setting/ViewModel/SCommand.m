//
//  SCommand.m
//  SelfSell
//
//  Created by liqiang on 2017/12/28.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SCommand.h"

@implementation SCommand

#pragma mark - Interface

- (instancetype)initWithSignal:(RACSignal *(^)(SInput *))signalBlock {
    self = [super initWithSignalBlock:^RACSignal *(id input) {
        SInput * dd = input;
        //dd.
        return [RACSignal createSignal:^RACDisposable *(id subscriber) {
            //[subscriber sendNext:NSStringFromSelector(_cmd)];
            //[subscriber sendCompleted];
            
            return nil;
        }];
    }];
    
    return self;
}

@end
