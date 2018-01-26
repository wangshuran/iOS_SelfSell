//
//  SGoogleValidate02Controller.m
//  SelfSell
//
//  Created by liqiang on 2018/1/24.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SGoogleValidate02Controller.h"
#import "SEnableGoogleAuthRequest.h"

@interface SGoogleValidate02Controller ()

@property (nonatomic, strong) SLabel * lbInfo;

@property (nonatomic, strong) SView * v0;

@property (nonatomic, strong) STextField * txGoogleCode;

@property (nonatomic, strong) SButton * btnFinish;

@end

@implementation SGoogleValidate02Controller

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"google_title_kaiqi");
}

- (SLabel *)lbInfo {
    if (!_lbInfo) {
        _lbInfo = [[SLabel alloc] init];
        _lbInfo.text = SLocal(@"google_xinxi");
        _lbInfo.font = kLbFontSmaller;
        _lbInfo.textColor = kColorWhite70;
    }
    
    return _lbInfo;
}

- (SView *)v0 {
    if (!_v0) {
        _v0 = [[SView alloc] init];
        _v0.backgroundColor = [UIColor whiteColor];
        [_v0 addSubview:self.txGoogleCode];
    }
    
    return _v0;
}

- (STextField *)txGoogleCode {
    if (!_txGoogleCode) {
        __weak typeof(self) weakSelf = self;
        _txGoogleCode = [[STextField alloc] init];
        _txGoogleCode.placeholder = SLocal(@"google_gugerenzhengma");
        _txGoogleCode.backgroundColor = [UIColor clearColor];
        [_txGoogleCode.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            [weakSelf updateBtnFinish];
        }];
    }
    
    return _txGoogleCode;
}

- (SButton *)btnFinish {
    if (!_btnFinish) {
        __weak typeof(self) weakSelf = self;
        _btnFinish = [[SButton alloc] init];
        _btnFinish.layer.cornerRadius = 5.0f;
        _btnFinish.layer.masksToBounds = YES;
        _btnFinish.backgroundColor = kColorWhite10;
        [_btnFinish setTitle:SLocal(@"google_kaiqi") forState:UIControlStateNormal];
        [_btnFinish setTitleColor:kColorWhite220 forState:UIControlStateNormal];
        [[_btnFinish rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            SButton * btn = x;
            btn.userInteractionEnabled = NO;
            NSString * googleCode = weakSelf.txGoogleCode.text;
            SEnableGoogleAuthRequest * request = [[SEnableGoogleAuthRequest alloc] init];
            request.id = [AppContext sharedAppContext].accountModel.id;
            request.step = @"1";
            request.googleAuthCode = googleCode;
            [SNetwork request:request block:^(LRequest * request, LResponse * response) {
                btn.userInteractionEnabled = YES;
                if (!response.status) {
                    [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
                    return;
                }
                [AppContext sharedAppContext].accountModel.googleAuthStatus = @"ON";
                [[AppContext sharedAppContext] updateLoginAccount:[AppContext sharedAppContext].accountModel];
                [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            }];
        }];
    }
    
    return _btnFinish;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.lbInfo];
    [self.view addSubview:self.v0];
    [self.view addSubview:self.btnFinish];
    [self.lbInfo mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.view).mas_offset(84.0f);
        make.left.mas_equalTo(weakSelf.view).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.view).mas_offset(-10.0f);
        make.height.mas_equalTo(30.0f);
    }];
    [self.v0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.lbInfo.mas_bottom);
        make.left.mas_equalTo(weakSelf.view);
        make.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(50.0f);
    }];
    [self.txGoogleCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(weakSelf.v0);
        make.left.mas_equalTo(weakSelf.v0).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.v0).mas_offset(-10.0f);
    }];
    [self.btnFinish mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v0.mas_bottom).mas_offset(20.0f);
        make.left.mas_equalTo(weakSelf.view).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.view).mas_offset(-10.0f);
        make.height.mas_equalTo(50.0f);
    }];
}

#pragma mark - Private

- (void)updateBtnFinish {
    NSString * googleCode = self.txGoogleCode.text;
    if ([NSString isNullOrEmpty:googleCode]) {
        self.btnFinish.userInteractionEnabled = NO;
        [self.btnFinish setTitleColor:kColorWhite100 forState:UIControlStateNormal];
    }else {
        self.btnFinish.userInteractionEnabled = YES;
        [self.btnFinish setTitleColor:kColorWhite220 forState:UIControlStateNormal];
    }
}

@end
