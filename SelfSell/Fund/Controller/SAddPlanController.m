//
//  SAddPlanController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SAddPlanController.h"
#import "SSelectPlanView.h"
#import "SAddPlanService.h"
#import "TBTableView.h"

@interface SAddPlanController()

@property (nonatomic, strong) SAddPlanService * addPlanService;

@property (nonatomic, strong) SSelectPlanView * selectPlanView;

@property (nonatomic, strong) TBTableView * tableView;

@end

@implementation SAddPlanController

// = "加入SSC持有计划";
//addplan_xuanzejihua = "选择计划";
//addplan_qingxuanze = "请选择";
//addplan_shuliang = "数量";
//addplan_qingshurujiarushuliang = "请输入加入数量";
//addplan_googlerenzhengma = "谷歌认证码";
//addplan_qingshurugooglerenzhengma = "请输入谷歌认证码";
//addplan_queding = "确定";
// = "选择SSC持有计划";

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"addplan_title");
}

- (SAddPlanService *)addPlanService {
    if (!_addPlanService) {
        __weak typeof(self) weakSelf = self;
        _addPlanService = [[SAddPlanService alloc] init];
        [_addPlanService subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * transfer) {
            NSArray<TBSectionModel *> * model = transfer.value;
            weakSelf.tableView.data = model;
            [weakSelf.tableView reloadData];
        }];
    }
    
    return _addPlanService;
}

- (SSelectPlanView *)selectPlanView {
    if (!_selectPlanView) {
        _selectPlanView = [[SSelectPlanView alloc] init];
    }
    
    return _selectPlanView;
}

- (TBTableView *)tableView {
    if (!_tableView) {
        _tableView = [[TBTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
}

#pragma mark - NSNotification

- (void)noticeSelectPlan:(NSNotification *)notification {
    //SFundAddPlanModel * addPlanModel = notification.object;
    
}

- (void)noticeCellEvent:(NSNotification *)notification {
    TBCell * cell = notification.object;
    TBModel * model = cell.model;
    if (!model) {
        return;
    }
    
    if ([model.uid isEqualToString:kxuanzejihua]) {
        __weak typeof(self) weakSelf = self;
        self.selectPlanView.hidden = NO;
        [self.view addSubview:self.selectPlanView];
        [self.selectPlanView mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.bottom.left.right.mas_equalTo(weakSelf.view);
        }];
        return;
    }
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    SAddObsver(noticeSelectPlan:, kNoticeSelectPlan);
    SAddObsver(noticeCellEvent:, kNoticeCellEvent)
    
    [self.addPlanService execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
}

#pragma mark - Private


@end
