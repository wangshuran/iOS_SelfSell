//
//  SFundController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundController.h"
#import "SNavigationBar.h"

@interface SFundController ()

@property (nonatomic, strong) SNavigationBar * navigationBar;

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

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.navigationBar];
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(kNavHeight);
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
