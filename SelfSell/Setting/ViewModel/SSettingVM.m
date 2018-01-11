//
//  SSettingViewModel.m
//  SelfSell
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingVM.h"

@implementation SSettingVM

#pragma mark - Interface

- (RACCommand *)command {
    if (!_command) {
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                [subscriber sendNext:[[SInput alloc] initWithType:((SInput *)input).type info:NSStringFromSelector(_cmd)]];
                [subscriber sendCompleted];

                return nil;
            }];
        }];
    }

    return _command;
}

- (RACSubject *)subject {
    if (!_subject) {
        _subject = [RACSubject subject];
    }

    return _subject;
}


@end

