//
//  SSetting0Controller.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSetting0Controller.h"
#import "SSettingService.h"
#import "TBTableView.h"
#import "SNavigationBar.h"

@interface SSetting0Controller ()

@property (nonatomic, strong) SSettingService * settingService;

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) SView * vUser;

@property (nonatomic, strong) SButton * btnLogo;

@property (nonatomic, strong) SButton * btnUser;

@property (nonatomic, strong) TBTableView * tbTableView;

@end

@implementation SSetting0Controller

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"setting0_title");
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

- (SView *)vUser {
    if (!_vUser) {
        _vUser = [[SView alloc] init];
        _vUser.backgroundColor = kColorWhite70;
        [_vUser addSubview:self.btnLogo];
        [_vUser addSubview:self.btnUser];
    }
    
    return _vUser;
}

- (SButton *)btnLogo {
    if (!_btnLogo) {
        _btnLogo = [[SButton alloc] init];
        _btnLogo.userInteractionEnabled = NO;
        _btnLogo.layer.cornerRadius = 25.0f;
        _btnLogo.layer.masksToBounds = YES;
    }
    
    return _btnLogo;
}

- (SButton *)btnUser {
    if (!_btnUser) {
        _btnUser = [[SButton alloc] init];
        _btnUser.userInteractionEnabled = NO;
        _btnUser.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_btnUser setTitleColor:kColorWhite220 forState:UIControlStateNormal];
    }
    
    return _btnUser;
}

- (SSettingService *)settingService {
    if (!_settingService) {
        __weak typeof(self) weakSelf = self;
        _settingService = [[SSettingService alloc] init];
        [_settingService subscribeNext:LCmdGetSetting0 nextBlock:^(LCmdTransfer * transfer) {
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
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.vUser];
    [self.view addSubview:self.tbTableView];    
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(kNavHeight);
    }];
    [self.vUser mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.navigationBar.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(60.0f);
    }];
    [self.btnLogo mas_updateConstraints:^(MASConstraintMaker * make) {
        make.centerY.mas_equalTo(weakSelf.vUser.mas_centerY).mas_offset(-5.0f);
        make.left.mas_equalTo(10.0f);
        make.height.width.mas_equalTo(50.0f);
    }];
    [self.btnUser mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(weakSelf.btnLogo.mas_right).mas_offset(10.0f);
        make.bottom.mas_equalTo(weakSelf.vUser).mas_offset(-5.0f);
        make.top.right.mas_equalTo(weakSelf.vUser);
    }];
    [self.tbTableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vUser.mas_bottom);
        make.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![[AppContext sharedAppContext].accountModel isLoginUser]) {
        SPostNotification(kNoticeToLogin);
        return;
    }    
    [self updateUI];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.view.backgroundColor = kColorWhite250;
    SAddObsver(noticeCellEvent:, kNoticeCellEvent)
    SAddObsver(noticeFinishLogin:, kNoticeFinishLogin);
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
    
    if ([model isKindOfClass:TBArrowModel.class]) {
        TBArrowModel * arrowModel = (TBArrowModel *)model;
        if (arrowModel.destVCClass) {
            [self push:[[arrowModel.destVCClass alloc] init]];
        }else if ([arrowModel.uid isEqualToString:kwodetuijianma]) {
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = arrowModel.value;
            [MBProgressHUD showTitleToView:self.view postion:NHHUDPostionCenten title:SLocal(@"google_fuzhidao")];
        }
        return;
    }else if ([model isKindOfClass:TBExitModel.class]) {
        SPostNotification(kNoticeToLogout);
        return;
    }
}

- (void)noticeFinishLogin:(NSNotification *)notification {
    [self updateUI];
}

#pragma mark - Private

- (void)updateUI {
    [self.btnLogo setImage:[UIImage imageNamed:@"setting_logo"] forState:UIControlStateNormal];
    [self.btnUser setTitle:[AppContext sharedAppContext].accountModel.email forState:UIControlStateNormal];
    [self.settingService execute:[LCmdTransfer cmd:LCmdGetSetting0 value:nil]];
}

@end
