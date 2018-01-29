//
//  SFundController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundController.h"
#import "SNavigationBar.h"
#import "FundTableView.h"
#import "SFundService.h"

@interface SFundController ()

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) FundTableView * tableView;

@property (nonatomic, strong) SFundService * fundService;

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

- (FundTableView *)tableView {
    if (!_tableView) {
        __weak typeof(self) weakSelf = self;
        _tableView = [[FundTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
            NSArray<TBSectionModel *> * model = transfer.value;
            weakSelf.tableView.data = model;
            [weakSelf.tableView reloadData];
            [weakSelf.tableView.mj_header endRefreshing];
        }];
        [_fundService subscribeNext:LCmdGetNextPage nextBlock:^(LCmdTransfer * transfer) {
            [weakSelf.tableView.mj_footer endRefreshing];
        }];
    }
    
    return _fundService;
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
