//
//  SSettingService.m
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingService.h"

@implementation SSettingService

#pragma mark - LCmdProtocol

- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    if ([transfer.cmd isEqualToString:LCmdGetAll]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getAll]]];
    }
    
    [subscriber sendNext:transfer];
    [subscriber sendCompleted];
    
    return nil;
}


/**
 获取全部设置项
 */
- (NSArray<NSArray<TBModel *> *> *)getAll {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    {
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.title = @"我的推荐码";
        model.value = @"677844";
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.title = @"谷歌验证";
        model.value = @"已开启";
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.title = @"设置";
        model.value = nil;
        [data addObject:model];
    }{
        TBExitModel * model = [[TBExitModel alloc] init];
        model.title = @"退出";
        model.value = nil;
        [data addObject:model];
    }
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = data;
    
    return [NSArray arrayWithObject:section];
}

@end
