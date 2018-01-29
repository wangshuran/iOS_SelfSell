
//
//  SFundController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundController.h"
#import "SNavigationBar.h"
#import "SFundTableView.h"
#import "SFundService.h"
#import "SFundBalanceRequest.h"
#import "SFundAddPlanRequest.h"
#import "SFundSectionModel.h"

@interface SFundController ()

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) SFundTableView * tableView;

@property (nonatomic, strong) SFundService * fundService;

@property (nonatomic, strong) SFundSectionModel * data;

@end

@implementation SFundController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"fund_title");
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![[AppContext sharedAppContext].accountModel isLoginUser]) {
        SPostNotification(kNoticeToLogin);
    }
    
    [self.fundService execute:[LCmdTransfer cmd:LCmdGetLastPage value:nil]];
    
    
    {
        __weak typeof(self) weakSelf = self;
        SFundBalanceRequest * request = [[SFundBalanceRequest alloc] init];
        [SNetwork request:request block:^(LRequest * request, LResponse * response) {
            if (!response.status) {
                return;
            }
            SFundBalanceResponse * model = (SFundBalanceResponse *)response;
            weakSelf.data.balanceModel = model.balanceModel;
            weakSelf.data.myPlanModels = model.balanceModel.fundDetail;
            [weakSelf.data reloadData];
            [weakSelf.tableView reloadData];
        }];
    }{
        __weak typeof(self) weakSelf = self;
        SFundAddPlanRequest * request = [[SFundAddPlanRequest alloc] init];
        [SNetwork request:request block:^(LRequest * request, LResponse * response) {
            if (!response.status) {
                return;
            }
            SFundAddPlanResponse * model = (SFundAddPlanResponse *)response;
            SFundAddPlansModel * plans = [[SFundAddPlansModel alloc] init];
            plans.plans = model.plans;
            weakSelf.data.addPlansModel = plans;
            [weakSelf.data reloadData];
            [weakSelf.tableView reloadData];
        }];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (SNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[SNavigationBar alloc] init];
        _navigationBar.lbTitle.text = self.title;
        _navigationBar.lbTitle.textColor = kColorWhite250;
        _navigationBar.vLeft.hidden = YES;
        _navigationBar.backgroundColor = kColorWhite70;
    }
    
    return _navigationBar;
}

- (SFundTableView *)tableView {
    if (!_tableView) {
        __weak typeof(self) weakSelf = self;
        _tableView = [[SFundTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.fundService execute:[LCmdTransfer cmd:LCmdGetLastPage value:nil]];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.fundService execute:[LCmdTransfer cmd:LCmdGetNextPage value:nil]];
        }];
    }
    
    return _tableView;
}

- (SFundService *)fundService {
    if (!_fundService) {
        __weak typeof(self) weakSelf = self;
        _fundService = [[SFundService alloc] init];
        [_fundService subscribeNext:LCmdGetLastPage nextBlock:^(LCmdTransfer * transfer) {
            //NSArray<TBSectionModel *> * model = transfer.value;
            //weakSelf.tableView.data = model;
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        }];
        [_fundService subscribeNext:LCmdGetNextPage nextBlock:^(LCmdTransfer * transfer) {
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    }
    
    return _fundService;
}

- (SFundSectionModel *)data {
    if (!_data) {
        _data = [[SFundSectionModel alloc] init];
    }
    
    return _data;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    CGFloat height = CGRectGetHeight(self.view.bounds);
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.tableView];
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(kNavHeight);
    }];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.navigationBar.mas_bottom);
        make.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
}

#pragma mark - NSNotification

- (void)noticeFinishLogin:(NSNotification *)notification {
    //[self updateUI];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    self.hiddenTabar = NO;
    SAddObsver(noticeFinishLogin:, kNoticeFinishLogin);
}

@end
