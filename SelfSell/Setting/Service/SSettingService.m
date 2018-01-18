//
//  SSettingService.m
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingService.h"
#import "SGoogleValidateController.h"
#import "SSetting1Controller.h"
#import "SUpdatePWDController.h"
#import "SLanguageController.h"
#import "SAboutController.h"

LCmd * const LCmdGetSetting0 = @"LCmdGetSetting0";
LCmd * const LCmdGetSetting1 = @"LCmdGetSetting1";


@implementation SSettingService

#pragma mark - LCmdProtocol

- (RACDisposable *)cmdHandle:(LCmdTransfer *)transfer subscriber:(id<RACSubscriber>)subscriber {
    if ([transfer.cmd isEqualToString:LCmdGetSetting0]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getSetting0]]];
    }else if ([transfer.cmd isEqualToString:LCmdGetSetting1]) {
        [self.subject sendNext:[LCmdTransfer cmd:transfer.cmd value:[self getSetting1]]];
    }
    
    [subscriber sendNext:transfer];
    [subscriber sendCompleted];
    
    return nil;
}

#pragma mark - Private

- (NSArray<NSArray<TBModel *> *> *)getSetting0 {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    {
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kwodetuijianma;
        model.title = @"我的推荐码";
        model.value = @"677844";
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kgugeyanzheng;
        model.title = @"谷歌验证";
        model.value = @"已开启";
        model.destVCClass = SGoogleValidateController.class;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kshezhi;
        model.title = @"设置";
        model.destVCClass = SSetting1Controller.class;
        [data addObject:model];
    }{
        TBExitModel * model = [[TBExitModel alloc] init];
        model.uid = ktuichu;
        model.title = @"退出";
        [data addObject:model];
    }
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = data;
    
    return [NSArray arrayWithObject:section];
}

- (NSArray<NSArray<TBModel *> *> *)getSetting1 {
    NSMutableArray *data = [[NSMutableArray alloc] init];
    {
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kgenggaimima;
        model.title = @"更改密码";
        model.destVCClass = SUpdatePWDController.class;
        [data addObject:model];
    }{
        TBSwitchModel * model = [[TBSwitchModel alloc] init];
        model.uid = kzhiwen;
        model.title = @"指纹";
        model.isOn = NO;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kyuyan;
        model.title = @"语言";
        model.destVCClass = SLanguageController.class;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kguanyu;
        model.title = @"关于";
        model.value = [NSString stringWithFormat:@"%@.%@", [LAppInfo CFBundleShortVersionString], [LAppInfo CFBundleVersion]];
        model.destVCClass = SAboutController.class;
        [data addObject:model];
    }
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.items = data;
    
    return [NSArray arrayWithObject:section];
}

@end
