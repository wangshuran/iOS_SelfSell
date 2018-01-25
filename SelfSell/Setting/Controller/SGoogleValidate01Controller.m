//
//  SGoogleValidate01Controller.m
//  SelfSell
//
//  Created by liqiang on 2018/1/18.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SGoogleValidate01Controller.h"
#import "SEnableGoogleAuthRequest.h"
#import "SDisableGoogleAuthRequest.h"
#import "SGoogleValidate02Controller.h"

@interface SGoogleValidate01Controller ()

@property (nonatomic, strong) SView * v0;

@property (nonatomic, strong) STextField * txGoogleCode;

@property (nonatomic, strong) SButton * btnClose;

@property (nonatomic, strong) SView * vOpen;

@property (nonatomic, strong) SView * vOpenTop;

@property (nonatomic, strong) SImageView * imgGoogleAuth;

@property (nonatomic, strong) SLabel * lbGoogleAuth;

@property (nonatomic, strong) SLabel * lbInfo;

@property (nonatomic, strong) SButton * btnCopy;

@property (nonatomic, strong) SButton * btnOpen;

@end

@implementation SGoogleValidate01Controller

#pragma mark - Interface

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (![[AppContext sharedAppContext].accountModel.googleAuthStatus isEqualToString:@"ON"]) {
        CGPoint point = [touches.anyObject locationInView:self.view];
        CGRect frame = self.vOpenTop.frame;
        if (CGRectContainsPoint(frame, point)) {
            NSString * googleAuth = self.lbGoogleAuth.text;
            if (![NSString isNullOrEmpty:googleAuth]) {
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                pasteboard.string = googleAuth;
                [MBProgressHUD showTitleToView:self.view postion:NHHUDPostionCenten title:SLocal(@"google_fuzhidao")];
            }
        }
    }
}

- (NSString *)title {
    return [[AppContext sharedAppContext].accountModel.googleAuthStatus isEqualToString:@"ON"] ? SLocal(@"google_title_guanbi") : SLocal(@"google_title_kaiqi");
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
            [weakSelf updateBtnClose];
        }];
    }
    
    return _txGoogleCode;
}

- (SButton *)btnClose {
    if (!_btnClose) {
        __weak typeof(self) weakSelf = self;
        _btnClose = [[SButton alloc] init];
        _btnClose.layer.cornerRadius = 5.0f;
        _btnClose.layer.masksToBounds = YES;
        _btnClose.backgroundColor = kColorBlack;
        [_btnClose setTitle:SLocal(@"google_guanbi") forState:UIControlStateNormal];
        [_btnClose setTitleColor:kColorLightGray forState:UIControlStateNormal];
        [[_btnClose rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            SButton * btn = x;
            btn.userInteractionEnabled = NO;
            NSString * googleCode = weakSelf.txGoogleCode.text;
            SDisableGoogleAuthRequest * request = [[SDisableGoogleAuthRequest alloc] init];
            request.id = [AppContext sharedAppContext].accountModel.id;
            request.googleAuthCode = googleCode;
            [SNetwork request:request block:^(LRequest * request, LResponse * response) {
                btn.userInteractionEnabled = YES;
                if (!response.status) {
                    [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
                    return;
                }
                [AppContext sharedAppContext].accountModel.googleAuthStatus = @"OFF";
                [[AppContext sharedAppContext] updateLoginAccount:[AppContext sharedAppContext].accountModel];
                //liqiang要不要刷新页面
                [weakSelf pop];
            }];
        }];
    }
    
    return _btnClose;
}

- (SView *)vOpen {
    if (!_vOpen) {
        _vOpen = [[SView alloc] init];
        [_vOpen addSubview:self.vOpenTop];
        [_vOpen addSubview:self.btnCopy];
        [_vOpen addSubview:self.btnOpen];
    }
    
    return _vOpen;
}

- (SView *)vOpenTop {
    if (!_vOpenTop) {
        _vOpenTop = [[SView alloc] init];
        [_vOpenTop addSubview:self.imgGoogleAuth];
        [_vOpenTop addSubview:self.lbGoogleAuth];
        [_vOpenTop addSubview:self.lbInfo];
    }
    
    return _vOpenTop;
}

- (SImageView *)imgGoogleAuth {
    if (!_imgGoogleAuth) {
        _imgGoogleAuth = [[SImageView alloc] init];
    }
    
    return _imgGoogleAuth;
}

- (SLabel *)lbGoogleAuth {
    if (!_lbGoogleAuth) {
        _lbGoogleAuth = [[SLabel alloc] init];
        _lbGoogleAuth.textAlignment = NSTextAlignmentCenter;
        _lbGoogleAuth.font = kLbFontBigger;
    }
    
    return _lbGoogleAuth;
}

- (SLabel *)lbInfo {
    if (!_lbInfo) {
        _lbInfo = [[SLabel alloc] init];
        _lbInfo.textColor = [kColorBlack alpha:0.5f];
        _lbInfo.font = kLbFontSmaller;
        if ([[AppContext sharedAppContext].accountModel.googleAuthStatus isEqualToString:@"ON"]) {
            _lbInfo.text = SLocal(@"google_xinxi");
        }else {
            _lbInfo.text = SLocal(@"google_beifen");
            _lbInfo.textAlignment = NSTextAlignmentCenter;
        }
    }
    
    return _lbInfo;
}

- (SButton *)btnCopy {
    if (!_btnCopy) {
        _btnCopy = [[SButton alloc] init];
        __weak typeof(self) weakSelf = self;
        _btnCopy = [[SButton alloc] init];
        _btnCopy.layer.cornerRadius = 5.0f;
        _btnCopy.layer.masksToBounds = YES;
        _btnCopy.backgroundColor = kColorBlack;
        [_btnCopy setTitle:SLocal(@"google_kaobeimiyao") forState:UIControlStateNormal];
        [_btnCopy setTitleColor:kColorLightGray forState:UIControlStateNormal];
        [[_btnCopy rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            NSString * googleAuth = self.lbGoogleAuth.text;
            if (![NSString isNullOrEmpty:googleAuth]) {
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                pasteboard.string = googleAuth;
                [MBProgressHUD showTitleToView:self.view postion:NHHUDPostionCenten title:SLocal(@"google_fuzhidao")];
            }
        }];
    }
    
    return _btnCopy;
}

- (SButton *)btnOpen {
    if (!_btnOpen) {
        __weak typeof(self) weakSelf = self;
        _btnOpen = [[SButton alloc] init];
        _btnOpen.layer.cornerRadius = 5.0f;
        _btnOpen.layer.masksToBounds = YES;
        _btnOpen.backgroundColor = kColorBlack;
        [_btnOpen setTitle:SLocal(@"google_xiayibu") forState:UIControlStateNormal];
        [_btnOpen setTitleColor:kColorLightGray forState:UIControlStateNormal];
        [[_btnOpen rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf push:[[SGoogleValidate02Controller alloc] init]];
        }];
    }
    
    return _btnOpen;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    if ([[AppContext sharedAppContext].accountModel.googleAuthStatus isEqualToString:@"ON"]) {
        [self.view addSubview:self.lbInfo];
        [self.view addSubview:self.v0];
        [self.view addSubview:self.btnClose];
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
        [self.btnClose mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.mas_equalTo(weakSelf.v0.mas_bottom).mas_offset(20.0f);
            make.left.mas_equalTo(weakSelf.view).mas_offset(10.0f);
            make.right.mas_equalTo(weakSelf.view).mas_offset(-10.0f);
            make.height.mas_equalTo(50.0f);
        }];
    }else {
        [self.view addSubview:self.vOpen];
        [self.vOpen mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.bottom.left.right.mas_equalTo(weakSelf.view);
        }];
        [self.vOpenTop mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.left.right.mas_equalTo(weakSelf.vOpen);
            make.height.mas_equalTo(330.0f);
        }];
        [self.imgGoogleAuth mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.mas_equalTo(weakSelf.vOpenTop).mas_offset(80.0f);
            make.centerX.mas_equalTo(weakSelf.vOpenTop);
            make.height.with.mas_equalTo(200.0f);
        }];
        [self.lbGoogleAuth mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.mas_equalTo(weakSelf.imgGoogleAuth.mas_bottom);
            make.left.right.mas_equalTo(weakSelf.vOpenTop);
            make.height.mas_equalTo(30.0f);
        }];
        [self.lbInfo mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.mas_equalTo(weakSelf.lbGoogleAuth.mas_bottom);
            make.left.right.mas_equalTo(weakSelf.vOpenTop);
            make.height.mas_equalTo(20.0f);
        }];
        [self.btnCopy mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.mas_equalTo(weakSelf.vOpenTop.mas_bottom).mas_offset(20.0f);
            make.left.mas_equalTo(weakSelf.vOpen).mas_offset(10.0f);
            make.right.mas_equalTo(weakSelf.vOpen).mas_offset(-10.0f);
            make.height.mas_equalTo(50.0f);
        }];
        [self.btnOpen mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.mas_equalTo(weakSelf.btnCopy.mas_bottom).mas_offset(10.0f);
            make.left.mas_equalTo(weakSelf.vOpen).mas_offset(10.0f);
            make.right.mas_equalTo(weakSelf.vOpen).mas_offset(-10.0f);
            make.height.mas_equalTo(50.0f);
        }];
    }
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    __weak typeof(self) weakSelf = self;
    if ([[AppContext sharedAppContext].accountModel.googleAuthStatus isEqualToString:@"ON"]) {
        
    }else {
        SEnableGoogleAuthRequest * request = [[SEnableGoogleAuthRequest alloc] init];
        request.id = [AppContext sharedAppContext].accountModel.id;
        request.step = @"0";
        [SNetwork request:request block:^(LRequest * request, LResponse * response) {
            if (!response.status) {
                [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
                return;
            }
            SEnableGoogleAuthResponse * model = (SEnableGoogleAuthResponse *)response;
            weakSelf.lbGoogleAuth.text = model.googleAuthKey;
            weakSelf.imgGoogleAuth.image = [[UIImage alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:model.googleAuthQrcode options:NSDataBase64DecodingIgnoreUnknownCharacters]];
        }];
    }
}

- (void)updateBtnClose {
    NSString * googleCode = self.txGoogleCode.text;
    if ([NSString isNullOrEmpty:googleCode]) {
        self.btnClose.userInteractionEnabled = NO;
        [self.btnClose setTitleColor:[kColorLightGray alpha:0.5f] forState:UIControlStateNormal];
    }else {
        self.btnClose.userInteractionEnabled = YES;
        [self.btnClose setTitleColor:kColorLightGray forState:UIControlStateNormal];
    }
}

@end
