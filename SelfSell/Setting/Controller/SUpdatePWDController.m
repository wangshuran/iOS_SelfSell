//
//  SUpdatePWDController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SUpdatePWDController.h"
#import "SUpdatePwdRequest.h"

@interface SUpdatePWDController ()

@property (nonatomic, strong) SView * v0;

@property (nonatomic, strong) SView * v1;

@property (nonatomic, strong) SView * v2;

@property (nonatomic, strong) SView * v3;

@property (nonatomic, strong) SView * vLine0;

@property (nonatomic, strong) SView * vLine1;

@property (nonatomic, strong) STextField * txOldPwd;

@property (nonatomic, strong) STextField * txPwd;

@property (nonatomic, strong) STextField * txComfirmPwd;

@property (nonatomic, strong) SButton * btnFinish;

@end

@implementation SUpdatePWDController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"updatepwd_title");
}

- (SView *)v0 {
    if (!_v0) {
        _v0 = [[SView alloc] init];
        _v0.backgroundColor = kColorWhite255;
        [_v0 addSubview:self.txOldPwd];
        [_v0 addSubview:self.vLine0];
    }
    
    return _v0;
}

- (SView *)v1 {
    if (!_v1) {
        _v1 = [[SView alloc] init];
        _v1.backgroundColor = kColorWhite255;
        [_v1 addSubview:self.txPwd];
        [_v1 addSubview:self.vLine1];
    }
    
    return _v1;
}

- (SView *)v2 {
    if (!_v2) {
        _v2 = [[SView alloc] init];
        _v2.backgroundColor = kColorWhite255;
        [_v2 addSubview:self.txComfirmPwd];
    }
    
    return _v2;
}

- (SView *)v3 {
    if (!_v3) {
        _v3 = [[SView alloc] init];
        _v3.backgroundColor = kColorClear;
        [_v3 addSubview:self.btnFinish];
    }
    
    return _v3;
}

- (SView *)vLine0 {
    if (!_vLine0) {
        _vLine0 = [[SView alloc] init];
        _vLine0.backgroundColor = kColorWhite220;
    }
    
    return _vLine0;
}

- (SView *)vLine1 {
    if (!_vLine1) {
        _vLine1 = [[SView alloc] init];
        _vLine1.backgroundColor = kColorWhite220;
    }
    
    return _vLine1;
}

- (STextField *)txOldPwd {
    if (!_txOldPwd) {
        __weak typeof(self) weakSelf = self;
        _txOldPwd = [[STextField alloc] init];
        _txOldPwd.placeholder = SLocal(@"updatepwd_jiumima");
        _txOldPwd.backgroundColor = kColorClear;
        _txOldPwd.secureTextEntry = YES;
        [_txOldPwd.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            [weakSelf updateBtnFinish];
        }];
    }
    
    return _txOldPwd;
}

- (STextField *)txPwd {
    if (!_txPwd) {
        __weak typeof(self) weakSelf = self;
        _txPwd = [[STextField alloc] init];
        _txPwd.placeholder = SLocal(@"updatepwd_mima");
        _txPwd.backgroundColor = kColorClear;
        _txPwd.secureTextEntry = YES;
        [_txPwd.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            [weakSelf updateBtnFinish];
        }];
    }
    
    return _txPwd;
}

- (STextField *)txComfirmPwd {
    if (!_txComfirmPwd) {
        __weak typeof(self) weakSelf = self;
        _txComfirmPwd = [[STextField alloc] init];
        _txComfirmPwd.placeholder = SLocal(@"updatepwd_querenmima");
        _txComfirmPwd.backgroundColor = kColorClear;
        _txComfirmPwd.secureTextEntry = YES;
        [_txComfirmPwd.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            [weakSelf updateBtnFinish];
        }];
    }
    
    return _txComfirmPwd;
}

- (SButton *)btnFinish {
    if (!_btnFinish) {
        __weak typeof(self) weakSelf = self;
        _btnFinish = [[SButton alloc] init];
        _btnFinish.layer.cornerRadius = 5.0f;
        _btnFinish.layer.masksToBounds = YES;
        _btnFinish.backgroundColor = kColorWhite10;
        [_btnFinish setTitle:SLocal(@"updatepwd_tijiao") forState:UIControlStateNormal];
        [_btnFinish setTitleColor:kColorWhite250 forState:UIControlStateNormal];
        [[_btnFinish rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            SButton * btn = x;
            btn.userInteractionEnabled = NO;
            NSString * oldPwd = self.txOldPwd.text;
            NSString * pwd = self.txPwd.text;
            SUpdatePwdRequest * request = [[SUpdatePwdRequest alloc] init];
            request.password = oldPwd;
            request.passwordNew = pwd;
            [SNetwork request:request block:^(LRequest * request, LResponse * response) {
                btn.userInteractionEnabled = YES;
                if (!response.status) {
                    [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
                    return;
                }
                [AppContext sharedAppContext].accountModel.pwd = pwd;
                [[AppContext sharedAppContext] updateLoginAccount:[AppContext sharedAppContext].accountModel];
                [weakSelf pop];
            }];
        }];
    }
    
    return _btnFinish;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.v0];
    [self.view addSubview:self.v1];
    [self.view addSubview:self.v2];
    [self.view addSubview:self.v3];
    [self.v0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(kNavHeight + 20.0f);
        make.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(50.0f);
    }];
    [self.v1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v0.mas_bottom);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v1.mas_bottom);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v2.mas_bottom).mas_offset(30.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.vLine0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.right.mas_equalTo(weakSelf.v0);
        make.left.mas_equalTo(weakSelf.v0).mas_offset(10.0f);
        make.height.mas_equalTo(0.5f);
    }];
    [self.vLine1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.right.mas_equalTo(weakSelf.v1);
        make.left.mas_equalTo(weakSelf.v1).mas_offset(10.0f);
        make.height.mas_equalTo(0.5f);
    }];
    [self.txOldPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v0);
        make.left.mas_equalTo(weakSelf.v0).mas_offset(10.0f);
    }];
    [self.txPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v1);
        make.left.mas_equalTo(weakSelf.v1).mas_offset(10.0f);
    }];
    [self.txComfirmPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v2);
        make.left.mas_equalTo(weakSelf.v2).mas_offset(10.0f);
    }];
    [self.btnFinish mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(weakSelf.v3);
        make.left.mas_equalTo(weakSelf.v3).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.v3).mas_offset(-10.0f);
    }];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
}

#pragma mark - Private

- (void)updateBtnFinish {
    //self.txOldPwd.text = [AppContext sharedAppContext].accountModel.pwd;
    //self.txPwd.text = [AppContext sharedAppContext].accountModel.pwd;
    //self.txComfirmPwd.text = [AppContext sharedAppContext].accountModel.pwd;
    
    NSString * oldPwd = self.txOldPwd.text;
    NSString * pwd = self.txPwd.text;
    NSString * comfirmPwd = self.txComfirmPwd.text;
    if ([NSString isNullOrEmpty:oldPwd] || [NSString isNullOrEmpty:pwd] || [NSString isNullOrEmpty:comfirmPwd] || ![oldPwd isEqualToString:[AppContext sharedAppContext].accountModel.pwd] || ![pwd isEqualToString:comfirmPwd] || comfirmPwd.length < 6) {
        self.btnFinish.userInteractionEnabled = NO;
        [self.btnFinish setTitleColor:kColorWhite100 forState:UIControlStateNormal];
    }else {
        self.btnFinish.userInteractionEnabled = YES;
        [self.btnFinish setTitleColor:kColorWhite220 forState:UIControlStateNormal];
    }
}

@end
