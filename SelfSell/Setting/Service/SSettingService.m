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
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    
    NSMutableArray * classs = [[NSMutableArray alloc] init];
    [classs addObject:@"TBArrowCell"];
    [classs addObject:@"TBExitCell"];
    [classs addObject:@"TBSwitchCell"];
    [classs addObject:@"TBTextCell"];
    
    for (NSString * cl in classs) {
        for (NSInteger i = 0; i < 100; i++) {
            TBModel *model = [[NSClassFromString(cl) alloc] init];
            //model.title = [NSUUID UUID].UUIDString;
            //model.code = [NSUUID UUID].UUIDString;
            
            [datas addObject:model];
        }
    }
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = datas;
    
    return [NSArray arrayWithObject:section];
}

@end
