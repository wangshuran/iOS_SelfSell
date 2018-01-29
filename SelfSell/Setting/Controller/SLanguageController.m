//
//  SLanguageController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLanguageController.h"
#import "SLanguageService.h"
#import "SettingTableView.h"
#import "SLanguage.h"

@interface SLanguageController ()

@property (nonatomic, strong) SLanguageService * languageService;

@property (nonatomic, strong) TBTableView * tableView;

@property (nonatomic, copy) NSString * selectLanguage;

@property (nonatomic, strong) SButton * btnRight;

@end

@implementation SLanguageController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"language_title");
}

- (SLanguageService *)languageService {
    if (!_languageService) {
        __weak typeof(self) weakSelf = self;
        _languageService = [[SLanguageService alloc] init];
        [_languageService subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * transfer) {
            NSArray<TBSectionModel *> * model = transfer.value;
            
            weakSelf.tableView.data = model;
            [weakSelf.tableView reloadData];
        }];
    }
    
    return _languageService;
}

- (TBTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SettingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.isEnableFooter = NO;
        _tableView.isEnableHeader = NO;
    }
    
    return _tableView;
}

- (SButton *)btnRight {
    if (!_btnRight) {
        _btnRight = [[SButton alloc] init];
        _btnRight.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
        [_btnRight setTitle:SLocal(@"common_baocun") forState:UIControlStateNormal];
        [_btnRight setTitleColor:[kColorOrange alpha:0.5f] forState:UIControlStateNormal];
        [_btnRight setTitleColor:[kColorOrange alpha:0.5f] forState:UIControlStateHighlighted];
        [_btnRight addTarget:self action:@selector(updateLanguage:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnRight;
}

- (void)loadView {
    [super loadView];
    
    __weak typeof(self) weakSelf = self;
    [self.vNavRight addSubview:self.btnRight];
    [self.view addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    
    [self.languageService execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.selectLanguage = [AppContext sharedAppContext].accountModel.languageCode;
    SAddObsver(noticeCellEvent:, kNoticeCellEvent)
}

#pragma mark - NSNotification

- (void)noticeCellEvent:(NSNotification *)notification {
    TBCell * cell = notification.object;
    TBCheckModel * model = (TBCheckModel *)cell.model;
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
    
    sections = self.tableView.data;
    for (TBSectionModel * section in sections) {
        for (TBCheckModel * item in section.items) {
            item.isCheck = [model.uid isEqualToString:item.uid];
        }
    }
    self.selectLanguage = model.code;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
        [weakSelf updateRightBtn];
    });
}

#pragma mark - Private

- (void)updateRightBtn {
    SLanguage * language = [[SLanguage alloc] init];
    if ([self.selectLanguage isEqualToString:[AppContext sharedAppContext].accountModel.languageCode]) {
        [self.btnRight setTitleColor:[kColorOrange alpha:0.5f] forState:UIControlStateNormal];
        [self.btnRight setTitleColor:[kColorOrange alpha:0.5f] forState:UIControlStateHighlighted];
    }else {
        [self.btnRight setTitleColor:kColorOrange forState:UIControlStateNormal];
    }
}

- (void)updateLanguage:(SButton *)sender {
    if ([self.selectLanguage isEqualToString:[AppContext sharedAppContext].accountModel.languageCode]) {
        return;
    }
    [AppContext sharedAppContext].accountModel.languageCode = self.selectLanguage;
    [[AppContext sharedAppContext] updateLoginAccount:[AppContext sharedAppContext].accountModel];
    [self.navigationController popToRootViewControllerAnimated:YES];
    SPostNotification(kNoticeSwitchLanguage);
}

@end
