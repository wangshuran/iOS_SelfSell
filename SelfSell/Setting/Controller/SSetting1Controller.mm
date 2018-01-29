//
//  SSetting1Controller.m
//  SelfSell
//
//  Created by liqiang on 2018/1/16.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSetting1Controller.h"
#import "SSettingService.h"
#import "SettingTableView.h"
#import "STouchID.h"
#import "SDao+Category.h"
#import "SCommonModel+WCTTableCoding.h"

@interface SSetting1Controller ()

@property (nonatomic, strong) SSettingService * settingService;

@property (nonatomic, strong) TBTableView * tableView;

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
            
            weakSelf.tableView.data = model;
            [weakSelf.tableView reloadData];
        }];
    }
    
    return _settingService;
}

- (TBTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SettingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.isEnableHeader = NO;
        _tableView.isEnableFooter = NO;
    }
    
    return _tableView;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker * make) {
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
    NSArray<TBSectionModel *> * sections = self.tableView.data;
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
            if (switchCell.btnSwitch.on) {
                __weak typeof(self) weakSelf = self;
                STouchID * touchID = [[STouchID alloc] init];
                if (![touchID canPolicy]) {
                    switchModel.isOn = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakSelf.tableView reloadData];
                    });
                    [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:SLocal(@"setting1_kaiqitouchid")];
                    
                    return;
                }
            }
            
            SCommonModel * commonModel = (SCommonModel *)[[AppContext sharedAppContext].accountDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kIsOpenTouchID];
            commonModel.value = switchCell.btnSwitch.on ? @"1" : @"0";
            [[AppContext sharedAppContext].accountDao updateObject:commonModel property:SCommonModel.value];
            
            return;
        }
    }
}

@end
