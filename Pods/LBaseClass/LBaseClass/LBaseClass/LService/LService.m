//
//  LService.m
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LService.h"
#import "NSString+Parser.h"


LCmd * const LCmdGetAll = @"LCmdGetAll";//全部数据
LCmd * const LCmdGetLastPage = @"LCmdGetLastPage";//上一页数据
LCmd * const LCmdGetNextPage = @"LCmdGetNextPage";//下一页数据


@implementation LService

#pragma mark - LCmdProtocol

@synthesize command = _command;//命令信号
@synthesize subject = _subject;//订阅信号

/**
 命令信号
 */
- (RACCommand *)command {
    if (!_command) {
        __weak typeof(self) weakSelf = self;
        _command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            if (input == nil || [NSString isNullOrEmpty:((LCmdTransfer *)input).cmd]) {
                return nil;
            }
            __strong typeof(weakSelf) strongSelf = weakSelf;
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                return [strongSelf cmdHandle:input subscriber:subscriber];
            }];
        }];
    }
    
    return _command;
}

/**
 订阅信号
 */
- (RACSubject *)subject {
    if (!_subject) {
        _subject = [[RACSubject alloc] init];
    }
    
    return _subject;
}

/**
 订阅具体类型的命令，建议使用该方法订阅命令，使代码更清晰
 */
- (RACDisposable *)subscribeNext:(LCmd *)cmd nextBlock:(void (^)(LCmdTransfer * x))nextBlock {
    return [self.subject subscribeNext:^(id x) {
        LCmdTransfer * transfer = x;
        if ([transfer.cmd isEqualToString:cmd] && nextBlock) {
            nextBlock(x);
        }
    }];
}

/**
 执行具体类型的命令，建议使用该方法执行命令，使代码更清晰
 */
- (RACSignal *)execute:(LCmdTransfer *)transfer {
    return [self.command execute:transfer];
}

/**
 命令处理中心，外部不调用
 */
- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    [subscriber sendNext:transfer];
    [subscriber sendCompleted];
    
    return nil;
}

@end
