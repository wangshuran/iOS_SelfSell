//
//  SSettingService.m
//  SelfSell
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSettingService.h"
#import "SGoogleValidate01Controller.h"
#import "SSetting1Controller.h"
#import "SUpdatePWDController.h"
#import "SLanguageController.h"
#import "SAboutController.h"
#import "SDao+Category.h"
#import "SCommonModel+WCTTableCoding.h"
#import "SRewardController.h"


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
        model.title = SLocal(@"setting0_tuijianma");
        model.value = [AppContext sharedAppContext].accountModel.inviteCode;
        model.destVCClass = SRewardController.class;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kgugeyanzheng;
        model.title = SLocal(@"setting0_gugeyanzheng");
        model.value = [[AppContext sharedAppContext].accountModel.googleAuthStatus isEqualToString:@"ON"] ? SLocal(@"setting0_gugeyikaiqi") : SLocal(@"setting0_gugeyiguanbi");
        model.destVCClass = SGoogleValidate01Controller.class;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kshezhi;
        model.title = SLocal(@"setting0_shezhi");
        model.destVCClass = SSetting1Controller.class;
        [data addObject:model];
    }{
        TBExitModel * model = [[TBExitModel alloc] init];
        model.uid = ktuichu;
        model.title = SLocal(@"setting0_tuichu");
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
        model.title = SLocal(@"setting1_xiugaimima");
        model.destVCClass = SUpdatePWDController.class;
        [data addObject:model];
    }{
        TBSwitchModel * model = [[TBSwitchModel alloc] init];
        model.uid = kzhiwen;
        model.title = SLocal(@"setting1_zhiwen");
        SCommonModel * commonModel = (SCommonModel *)[[AppContext sharedAppContext].accountDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kIsOpenTouchID];
        model.isOn = commonModel.value.boolValue;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kyuyan;
        model.title = SLocal(@"setting1_yuyan");
        model.destVCClass = SLanguageController.class;
        [data addObject:model];
    }{
        TBArrowModel * model = [[TBArrowModel alloc] init];
        model.uid = kguanyu;
        model.title = SLocal(@"setting1_guanyu");
        model.value = [NSString stringWithFormat:@"V %@.%@", [LAppInfo CFBundleShortVersionString], [LAppInfo CFBundleVersion]];
        model.destVCClass = SAboutController.class;
        [data addObject:model];
    }
    
    TBSectionModel * section = [[TBSectionModel alloc] init];
    section.headerHeight = 20.0f;
    section.items = data;
    
    return [NSArray arrayWithObjects:section, nil];
}

@end
