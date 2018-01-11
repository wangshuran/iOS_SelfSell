//
//  LSettingVM.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LSettingVM.h"
#import "LSettingService.h"

@implementation LSettingVM

- (instancetype)init {
    self = [super init];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        LSettingService * service = [[LSettingService alloc] init];
        [service subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * x) {
            
        }];
        [service execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
    });
    
    return self;
}

@end
