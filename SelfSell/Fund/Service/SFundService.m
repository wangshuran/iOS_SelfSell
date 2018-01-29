//
//  SFundService.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundService.h"

@implementation SFundService


#pragma mark - LCmdProtocol

- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    if ([transfer.cmd isEqualToString:LCmdGetLastPage]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getLastPage]]];
    }else if ([transfer.cmd isEqualToString:LCmdGetNextPage]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getNextPage]]];
    }
    
    [subscriber sendNext:transfer];
    [subscriber sendCompleted];
    
    return nil;
}

#pragma mark - Private

- (NSArray<NSArray<TBModel *> *> *)getLastPage {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    {
        SFundBalanceModel * model = [[SFundBalanceModel alloc] init];
        [data addObject:model];
    }{
        SFundPlanModel * model = [[SFundPlanModel alloc] init];
        [data addObject:model];
    }{
        SFundPlanModel * model = [[SFundPlanModel alloc] init];
        [data addObject:model];
    }{
        SFundAddPlanModel * model = [[SFundAddPlanModel alloc] init];
        [data addObject:model];
    }{
        SFundTradeTitleModel * model = [[SFundTradeTitleModel alloc] init];
        [data addObject:model];
    }{
        for (int ii = 0; ii < 10; ii++) {
            SFundTradeDetailModel * model = [[SFundTradeDetailModel alloc] init];
            [data addObject:model];
        }
    }
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = data;
    
    return [NSArray arrayWithObject:section];
}

- (NSArray<NSArray<TBModel *> *> *)getNextPage {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.headerHeight = 20.0f;
    section.items = data;
    
    return [NSArray arrayWithObjects:section, nil];
}

@end
