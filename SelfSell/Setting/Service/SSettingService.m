//
//  SSettingService.m
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingService.h"

@implementation SSettingService

- (NSArray<SSettingModel *> *)getAll {
    NSMutableArray *datas = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < 20; i++) {
        SSettingModel *model = [[SSettingModel alloc] init];
        model.title = [NSUUID UUID].UUIDString;
        model.code = [NSUUID UUID].UUIDString;
        
        [datas addObject:model];
    }
    
    return datas;
}

@end
