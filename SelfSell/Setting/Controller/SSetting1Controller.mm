//
//  SSetting1Controller.m
//  SelfSell
//
//  Created by liqiang on 2018/1/16.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSetting1Controller.h"
#import "SSettingService.h"
#import "TBTableView.h"
#import "STouchID.h"
#import "SDao+Category.h"
#import "SCommonModel+WCTTableCoding.h"

@interface SSetting1Controller ()

@property (nonatomic, strong) SSettingService * settingService;

@property (nonatomic, strong) TBTableView * tbTableView;

@end

@implementation SSetting1Controller

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"setting1_title");
}

- (SSettingService *)settingService {
    if (!_settingService) {
        __weak typeof(self) weakSelf = self;
        _settingService = [[SSettingService alloc] init];
        [_settingService subscribeNext:LCmdGetSetting1 nextBlock:^(LCmdTransfer * transfer) {
            NSArray<TBSectionModel *> * model = transfer.value;
            
            weakSelf.tbTableView.data = model;
            [weakSelf.tbTableView reloadData];
        }];
    }
    
    return _settingService;
}

- (TBTableView *)tbTableView {
    if (!_tbTableView) {
        _tbTableView = [[TBTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tbTableView.isEnableHeader = NO;
        _tbTableView.isEnableFooter = NO;
    }
    
    return _tbTableView;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.tbTableView];
    
    [self.tbTableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    
    
    [self.settingService execute:[LCmdTransfer cmd:LCmdGetSetting1 value:nil]];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    SAddObsver(noticeCellEvent:, kNoticeCellEvent)
}

#pragma mark - NSNotification

- (void)noticeCellEvent:(NSNotification *)notification {
    TBCell * cell = notification.object;
    TBModel * model = cell.model;
    if (!model) {
        return;
    }
    BOOL isExit = NO;
    NSArray<TBSectionModel *> * sections = self.tbTableView.data;
    for (TBSectionModel * section in sections) {
        if ([section.items containsObject:model]) {
            isExit = YES;
            break;
        }
    }
    if (!isExit) {
        return;
    }
    
    if ([cell isKindOfClass:TBArrowCell.class] && [model isKindOfClass:TBArrowModel.class]) {
        TBArrowModel * arrowModel = (TBArrowModel *)model;
        [self push:[[arrowModel.destVCClass alloc] init]];
        
        return;
    }
    
    if ([cell isKindOfClass:TBSwitchCell.class] && [model isKindOfClass:TBSwitchModel.class]) {
        TBSwitchCell * switchCell = (TBSwitchCell *)cell;
        TBSwitchModel * switchModel = (TBSwitchModel *)model;
        if ([switchModel.uid isEqualToString:kzhiwen]) {
            //if (switchCell.btnSwitch.on) {
            //    STouchID * touchID = [[STouchID alloc] init];
            //    if (![touchID canPolicy]) {
            //        switchCell.btnSwitch.on = NO;
            //
            //        return;
            //    }
            //}
            //
            //SCommonModel * commonModel = (SCommonModel *)[[AppContext sharedAppContext].accountDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kIsOpenTouchID];
            //commonModel.value = switchCell.btnSwitch.on ? @"1" : @"0";
            //[[AppContext sharedAppContext].accountDao updateObject:commonModel property:SCommonModel.value];
            
            return;
        }
    }
}

@end
