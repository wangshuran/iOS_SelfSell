
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
#import "SFundBalanceRequest.h"
#import "SFundAddPlanRequest.h"
#import "SFundSectionModel.h"
#import "STurnOutController.h"
#import "STurnIntoController.h"
#import "SAddPlanController.h"

@interface SFundController ()

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) SFundTableView * tableView;

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
        return;
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
            [weakSelf updateBalance];
            [weakSelf updateAddPlan];
        }];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    }
    
    return _tableView;
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

- (void)noticeCoinTurnOut:(NSNotification *)notification {
    [self push:[[STurnOutController alloc] init]];
}

- (void)noticeCoinTurnInto:(NSNotification *)notification {
    [self push:[[STurnIntoController alloc] init]];
}

- (void)noticeRefreshFund:(NSNotification *)notification {
    [self.tableView.mj_header beginRefreshing];
}

- (void)noticeAddPlan:(NSNotification *)notification {
    //[self push:[[SAddPlanController alloc] init]];
    //[UIViewController present:[[SNavigationController alloc] initWithRootViewController:[[NSClassFromString(@"SPwdValidateController") alloc] init]]];
    //[UIViewController present:[[NSClassFromString(@"SPwdValidateController") alloc] init]];
    [self push:[[NSClassFromString(@"SPwdValidateController") alloc] init]];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    self.hiddenTabar = NO;
    SAddObsver(noticeFinishLogin:, kNoticeFinishLogin);
    SAddObsver(noticeCoinTurnInto:, kNoticeCoinTurnInto);
    SAddObsver(noticeCoinTurnOut:, kNoticeCoinTurnOut);
    SAddObsver(noticeRefreshFund:, kNoticeRefreshFund);
    SAddObsver(noticeAddPlan:, kNoticeAddPlan);
    
    
    SPostNotification(kNoticeRefreshFund);
}

#pragma mark - Private

- (void)updateBalance {
    __weak typeof(self) weakSelf = self;
    SFundBalanceRequest * request = [[SFundBalanceRequest alloc] init];
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        [weakSelf.tableView.mj_header endRefreshing];
        if (!response.status) {
            return;
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            SFundBalanceResponse * model = (SFundBalanceResponse *)response;
            weakSelf.data.balanceModel = model.balanceModel;
            weakSelf.data.myPlanModels = model.balanceModel.fundDetail;
            [weakSelf.data reloadData];
            weakSelf.tableView.data = [NSArray arrayWithObject:weakSelf.data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
        });
    }];
}

- (void)updateAddPlan {
    __weak typeof(self) weakSelf = self;
    SFundAddPlanRequest * request = [[SFundAddPlanRequest alloc] init];
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        [weakSelf.tableView.mj_header endRefreshing];
        if (!response.status) {
            return;
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            SFundAddPlanResponse * model = (SFundAddPlanResponse *)response;
            SFundAddPlansModel * plans = [[SFundAddPlansModel alloc] init];
            plans.plans = model.plans;
            weakSelf.data.addPlansModel = plans;
            [weakSelf.data reloadData];
            weakSelf.tableView.data = [NSArray arrayWithObject:weakSelf.data];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
        });
    }];
}

@end
