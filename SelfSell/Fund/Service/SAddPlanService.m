//
//  SAddPlanService.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SAddPlanService.h"

@implementation SAddPlanService

#pragma mark - LCmdProtocol

- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    if ([transfer.cmd isEqualToString:LCmdGetAll]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getAll]]];
    }
    
    [subscriber sendNext:transfer];
    [subscriber sendCompleted];
    
    return nil;
}

#pragma mark - Private

- (NSArray<NSArray<TBModel *> *> *)getAll {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    {
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kxuanzejihua;
        model.title = SLocal(@"addplan_xuanzejihua");
        model.value = SLocal(@"addplan_qingxuanze");
        [data addObject:model];
    }
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = data;
    
    return [NSArray arrayWithObject:section];
}

@end
