//
//  SRewardController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRewardController.h"
#import "SRewardRequest.h"
#import "SNavigationBar.h"

@interface SRewardController ()

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) SScrollView * scrollView;

@property (nonatomic, strong) SView * scrollContainer;

@property (nonatomic, strong) SView * vContent0;

@property (nonatomic, strong) SView * vContent1;

@property (nonatomic, strong) SView * vContent2;

@property (nonatomic, strong) SView * vContent2Container;

@property (nonatomic, strong) SLabel * lbRecommendCode;

@property (nonatomic, strong) SButton * btnCopy;

@property (nonatomic, strong) SButton * btnShare;

@property (nonatomic, strong) SView * vContent3;

@property (nonatomic, strong) SView * vContent4;

@end

@implementation SRewardController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"reward_title");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (SNavigationBar *)navigationBar {
    if (!_navigationBar) {
        __weak typeof(self) weakSelf = self;
        _navigationBar = [[SNavigationBar alloc] init];
        _navigationBar.backgroundColor = [kColorBlack alpha:0.8f];
        _navigationBar.backgroundColor = kColorBlack;
        [_navigationBar.btnLeft setImage:[UIImage imageNamed:@"common_fanhui_white"] forState:UIControlStateNormal];
        _navigationBar.lbTitle.text = self.title;
        _navigationBar.lbTitle.textColor = [UIColor whiteColor];
        [[_navigationBar.btnLeft rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf pop];
        }];
    }
    
    return _navigationBar;
}

- (SScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[SScrollView alloc] init];
        _scrollView.backgroundColor = kColorLightGray;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [_scrollView addSubview:self.scrollContainer];
    }
    
    return _scrollView;
}

- (SView *)scrollContainer {
    if (!_scrollContainer) {
        _scrollContainer = [[SView alloc] init];
        [_scrollContainer addSubview:self.vContent0];
        [_scrollContainer addSubview:self.vContent1];
        [_scrollContainer addSubview:self.vContent2];
        [_scrollContainer addSubview:self.vContent3];
        [_scrollContainer addSubview:self.vContent4];
    }
    
    return _scrollContainer;
}

- (SView *)vContent0 {
    if (!_vContent0) {
        _vContent0 = [[SView alloc] init];
        _vContent0.backgroundColor = [kColorBlack alpha:0.8f];
    }
    
    return _vContent0;
}

- (SView *)vContent1 {
    if (!_vContent1) {
        _vContent1 = [[SView alloc] init];
    }
    
    return _vContent1;
}

- (SView *)vContent2 {
    if (!_vContent2) {
        _vContent2 = [[SView alloc] init];
        [_vContent2 addSubview:self.vContent2Container];
    }
    
    return _vContent2;
}

- (SView *)vContent2Container {
    if (!_vContent2Container) {
        _vContent2Container = [[SView alloc] init];
        _vContent2Container.layer.cornerRadius = 5.0f;
        _vContent2Container.layer.masksToBounds = YES;
        [_vContent2Container addSubview:self.lbRecommendCode];
        [_vContent2Container addSubview:self.btnCopy];
        [_vContent2Container addSubview:self.btnShare];
    }
    
    return _vContent2Container;
}

- (SLabel *)lbRecommendCode {
    if (!_lbRecommendCode) {
        _lbRecommendCode = [[SLabel alloc] init];
    }
    
    return _lbRecommendCode;
}

- (SButton *)btnCopy {
    if (!_btnCopy) {
        _btnCopy = [[SButton alloc] init];
    }
    
    return _btnCopy;
}

- (SButton *)btnShare {
    if (!_btnShare) {
        _btnShare = [[SButton alloc] init];
    }
    
    return _btnShare;
}

- (SView *)vContent3 {
    if (!_vContent3) {
        _vContent3 = [[SView alloc] init];
    }
    
    return _vContent3;
}

- (SView *)vContent4 {
    if (!_vContent4) {
        _vContent4 = [[SView alloc] init];
    }
    
    return _vContent4;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.scrollView];
    CGFloat navHeight = isIPhoneX ? 84.0f : 64.0f;
    
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(navHeight);
    }];
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.navigationBar.mas_bottom);
        make.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    //设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    [self.scrollContainer mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.equalTo(weakSelf.scrollView).with.insets(UIEdgeInsetsZero);
        make.width.equalTo(weakSelf.scrollView);
    }];
    [self.vContent0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(0.0f);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    [self.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    [self.vContent2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent1.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    [self.vContent2Container mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.vContent2);
    }];
    [self.lbRecommendCode mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.vContent2Container).mas_offset(10.0f);
        make.top.bottom.left.right.mas_equalTo(weakSelf.vContent2);

    }];
    [self.btnCopy mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.vContent2);

    }];
    [self.btnShare mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.vContent2Container).mas_offset(-10.0f);
        make.centerY.mas_equalTo(weakSelf.vContent2Container);
        make.height.with.mas_equalTo(30.0f);
    }];
    [self.vContent3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent2.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    [self.vContent4 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent3.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [self.scrollContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.vContent4.mas_bottom);
    }];
    
    
    [LTest randomColorView:self.scrollView];
}

// = "SelfSell推荐奖励计划";
//reward_buzhou1 = "Step1";
//reward_huoqutuijianma = "获取推荐码";
//reward_buzhou2 = "Step2";
//reward_yaoqinghaoyou = "邀请好友";
//reward_buzhou3 = "Step3";
//reward_dedaojiangli = "得到奖励";
//reward_jiangli = "奖励";
//reward_ssc = "SSC";
//reward_wodetuijianma = "我的推荐码";
//reward_fuzhi = "复制";
//reward_tuijianhaoyoushuliang = "推荐好友数量";
//reward_jianglijie = "奖励金额";
//reward_jianglijihua = "奖励计划";

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    self.view.backgroundColor = [kColorBlack alpha:0.8f];
    __weak typeof(self) weakSelf = self;
    SRewardRequest * request = [[SRewardRequest alloc] init];
    request.id = [AppContext sharedAppContext].accountModel.id;
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        if (!response.status) {
            [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
            return;
        }
        
    }];
}


@end
