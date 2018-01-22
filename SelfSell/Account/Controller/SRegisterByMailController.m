//
//  SRegisterByMailController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/22.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRegisterByMailController.h"
#import "SRegisterByMailRequest.h"
#import "SSendMailRequest.h"

@interface SRegisterByMailController ()

@property (nonatomic, strong) SView * v0;

@property (nonatomic, strong) SView * v1;

@property (nonatomic, strong) SView * v2;

@property (nonatomic, strong) SView * v3;

@property (nonatomic, strong) SView * v4;

@property (nonatomic, strong) SView * v5;

@property (nonatomic, strong) SView * v6;

@property (nonatomic, strong) SImageView * imgEmail;

@property (nonatomic, strong) SImageView * imgCode;

@property (nonatomic, strong) SImageView * imgPwd;

@property (nonatomic, strong) SImageView * imgComfirmPwd;

@property (nonatomic, strong) SImageView * imgRecommendCode;

@property (nonatomic, strong) STextField * txEmail;

@property (nonatomic, strong) STextField * txCode;

@property (nonatomic, strong) SButton * btnCode;

@property (nonatomic, strong) STextField * txPwd;

@property (nonatomic, strong) STextField * txComfirmPwd;

@property (nonatomic, strong) STextField * txRecommendCode;

@property (nonatomic, strong) SButton * btnRegister;

@property (nonatomic, strong) SLabel * lbInfo;

@property (nonatomic, strong) SButton * btnLogin;


@end

@implementation SRegisterByMailController

#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.vNavLeft.hidden = NO;
}

- (SView *)v0 {
    if (!_v0) {
        _v0 = [self getBlackRect];
        [_v0 addSubview:self.imgEmail];
        [_v0 addSubview:self.txEmail];
    }
    
    return _v0;
}

- (SView *)v1 {
    if (!_v1) {
        _v1 = [self getBlackRect];
        [_v1 addSubview:self.imgCode];
        [_v1 addSubview:self.txCode];
        [_v1 addSubview:self.btnCode];
    }
    
    return _v1;
}

- (SView *)v2 {
    if (!_v2) {
        _v2 = [self getBlackRect];
        [_v2 addSubview:self.imgPwd];
        [_v2 addSubview:self.txPwd];
    }
    
    return _v2;
}

- (SView *)v3 {
    if (!_v3) {
        _v3 = [self getBlackRect];
        [_v3 addSubview:self.imgComfirmPwd];
        [_v3 addSubview:self.txComfirmPwd];
    }
    
    return _v3;
}

- (SView *)v4 {
    if (!_v4) {
        _v4 = [self getBlackRect];
        [_v4 addSubview:self.imgRecommendCode];
        [_v4 addSubview:self.txRecommendCode];
    }
    
    return _v4;
}

- (SView *)v5 {
    if (!_v5) {
        _v5 = [[SView alloc] init];
        [_v5 addSubview:self.btnRegister];
    }
    
    return _v5;
}

- (SView *)v6 {
    if (!_v6) {
        _v6 = [[SView alloc] init];
        [_v6 addSubview:self.lbInfo];
        [_v6 addSubview:self.btnLogin];
    }
    
    return _v6;
}

- (SImageView *)imgEmail {
    if (!_imgEmail) {
        _imgEmail = [[SImageView alloc] init];
        _imgEmail.image = [UIImage imageNamed:@"fund_logo_normal"];
    }
    
    return _imgEmail;
}

- (SImageView *)imgCode {
    if (!_imgCode) {
        _imgCode = [[SImageView alloc] init];
        _imgCode.image = [UIImage imageNamed:@"fund_logo_normal"];
    }
    
    return _imgCode;
}

- (SImageView *)imgPwd {
    if (!_imgPwd) {
        _imgPwd = [[SImageView alloc] init];
        _imgPwd.image = [UIImage imageNamed:@"fund_logo_normal"];
    }
    
    return _imgPwd;
}

- (SImageView *)imgComfirmPwd {
    if (!_imgComfirmPwd) {
        _imgComfirmPwd = [[SImageView alloc] init];
        _imgComfirmPwd.image = [UIImage imageNamed:@"fund_logo_normal"];
    }
    
    return _imgComfirmPwd;
}

- (SImageView *)imgRecommendCode {
    if (!_imgRecommendCode) {
        _imgRecommendCode = [[SImageView alloc] init];
        _imgRecommendCode.image = [UIImage imageNamed:@"fund_logo_normal"];
    }
    
    return _imgRecommendCode;
}

- (STextField *)txEmail {
    if (!_txEmail) {
        
    }
    
    return _txEmail;
}

- (STextField *)txCode {
    if (!_txCode) {
        
    }
    
    return _txCode;
}

- (SButton *)btnCode {
    if (!_btnCode) {
        
    }
    
    return _btnCode;
}

- (STextField *)txPwd {
    if (!_txPwd) {
        
    }
    
    return _txPwd;
}

- (STextField *)txComfirmPwd {
    if (!_txComfirmPwd) {
        
    }
    
    return _txComfirmPwd;
}

- (STextField *)txRecommendCode {
    if (!_txRecommendCode) {
        
    }
    
    return _txRecommendCode;
}

- (SButton *)btnRegister {
    if (!_btnRegister) {
        
    }
    
    return _btnRegister;
}

- (SLabel *)lbInfo {
    if (!_lbInfo) {
        
    }
    
    return _lbInfo;
}

- (SButton *)btnLogin {
    if (!_btnLogin) {
        
    }
    
    return _btnLogin;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.v0];
    [self.view addSubview:self.v1];
    [self.view addSubview:self.v2];
    [self.view addSubview:self.v3];
    [self.view addSubview:self.v4];
    [self.view addSubview:self.v5];
    [self.view addSubview:self.v6];
    [self.v0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(100.0f);
        make.left.mas_equalTo(20.0f);
        make.right.mas_equalTo(-20.0f);
        make.height.mas_equalTo(60.0f);
    }];
    [self.v1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v0.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v1.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v2.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v4 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v3.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v5 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v4.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v6 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v5.mas_bottom).offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.imgEmail mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(weakSelf.v0).offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v0);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.imgPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(weakSelf.v2).offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v0);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.imgComfirmPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(weakSelf.v3).offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v0);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.imgRecommendCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(weakSelf.v4).offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v0);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    
    
    
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    SSendMailRequest * request = [[SSendMailRequest alloc] init];
    request.email = @"liqiang01@new4g.cn";
    request.type = @"REGISTER";
    
    //    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
    //        if (!response.status) {
    //
    //            return;
    //        }
    //
    //    }];
}

#pragma mark - Private

- (SView *)getBlackRect {
    SView * view = [[SView alloc] init];
    view.backgroundColor = kColorBlack;
    view.layer.cornerRadius = 2.0f;
    view.layer.masksToBounds = YES;
    
    return view;
}

@end
