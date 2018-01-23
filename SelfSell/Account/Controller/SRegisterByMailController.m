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
#import "SNavigationBar.h"
#import "SLoginByMailController.h"

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

@property (nonatomic, strong) SButton * btnLogin;

@property (nonatomic, strong) SNavigationBar * navigationBar;

@end

@implementation SRegisterByMailController

#pragma mark - Interface

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSString *)title {
    return SLocal(@"register_title");
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
        _v5.backgroundColor = [UIColor clearColor];
        [_v5 addSubview:self.btnRegister];
    }
    
    return _v5;
}

- (SView *)v6 {
    if (!_v6) {
        _v6 = [[SView alloc] init];
        _v6.backgroundColor = [UIColor clearColor];
        [_v6 addSubview:self.btnLogin];
    }
    
    return _v6;
}

- (SImageView *)imgEmail {
    if (!_imgEmail) {
        _imgEmail = [[SImageView alloc] init];
        _imgEmail.image = [UIImage imageNamed:@"login_email"];
    }
    
    return _imgEmail;
}

- (SImageView *)imgCode {
    if (!_imgCode) {
        _imgCode = [[SImageView alloc] init];
        _imgCode.image = [UIImage imageNamed:@"login_code"];
    }
    
    return _imgCode;
}

- (SImageView *)imgPwd {
    if (!_imgPwd) {
        _imgPwd = [[SImageView alloc] init];
        _imgPwd.image = [UIImage imageNamed:@"login_lock"];
    }
    
    return _imgPwd;
}

- (SImageView *)imgComfirmPwd {
    if (!_imgComfirmPwd) {
        _imgComfirmPwd = [[SImageView alloc] init];
        _imgComfirmPwd.image = [UIImage imageNamed:@"login_coinfirmpassword"];
    }
    
    return _imgComfirmPwd;
}

- (SImageView *)imgRecommendCode {
    if (!_imgRecommendCode) {
        _imgRecommendCode = [[SImageView alloc] init];
        _imgRecommendCode.image = [UIImage imageNamed:@"login_recomcode"];
    }
    
    return _imgRecommendCode;
}

- (STextField *)txEmail {
    if (!_txEmail) {
        _txEmail = [[STextField alloc] init];
        _txEmail.placeholder = SLocal(@"register_youxiang");
        _txEmail.backgroundColor = [UIColor clearColor];
        _txEmail.keyboardType = UIKeyboardTypeEmailAddress;
        _txEmail.textColor = [UIColor whiteColor];
        [_txEmail setPlaceholderColor:[UIColor colorWithRed:52.0f / 255.0f green:52.0f / 255.0f blue:52.0f / 255.0f alpha:1.0f]];
    }
    
    return _txEmail;
}

- (STextField *)txCode {
    if (!_txCode) {
        _txCode = [[STextField alloc] init];
        _txCode.placeholder = SLocal(@"register_youxiangrenzhengma");
        _txCode.backgroundColor = [UIColor clearColor];
        _txCode.textColor = [UIColor whiteColor];
        [_txCode setPlaceholderColor:[UIColor colorWithRed:52.0f / 255.0f green:52.0f / 255.0f blue:52.0f / 255.0f alpha:1.0f]];
    }
    
    return _txCode;
}

- (SButton *)btnCode {
    if (!_btnCode) {
        __weak typeof(self) weakSelf = self;
        _btnCode = [[SButton alloc] init];
        _btnCode.backgroundColor = [UIColor clearColor];
        _btnCode.titleLabel.font = kBtnFontSmaller;
        [_btnCode setTitle:SLocal(@"register_huoqurenzhengma") forState:UIControlStateNormal];
        [_btnCode setTitleColor:kColorOrange forState:UIControlStateNormal];
        [[_btnCode rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            SButton * btn = x;
            btn.userInteractionEnabled = NO;
            NSString * email = weakSelf.txEmail.text;
            if ([NSString isNullOrEmpty:email]) {
                btn.userInteractionEnabled = YES;
                return;
            }
            
            SSendMailRequest * request = [[SSendMailRequest alloc] init];
            request.email = email;
            request.type = @"REGISTER";
            [SNetwork request:request block:^(LRequest * request, LResponse * response) {
                if (!response.status) {
                    btn.userInteractionEnabled = YES;
                    
                    return;
                }
                [btn setTitleColor:kColorDarkGray forState:UIControlStateNormal];
                __block NSUInteger count = 10;
                [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] take:count] subscribeNext:^(NSDate * _Nullable x) {
                    count--;
                    if (count < 1) {
                        [btn setTitle:SLocal(@"register_huoqurenzhengma") forState:UIControlStateNormal];
                        [btn setTitleColor:kColorOrange forState:UIControlStateNormal];
                        btn.userInteractionEnabled = YES;
                    }else {
                        [btn setTitle:[NSString stringWithFormat:@"%lus", count] forState:UIControlStateNormal];
                    }
                }];
            }];
        }];
    }
    
    return _btnCode;
}

- (STextField *)txPwd {
    if (!_txPwd) {
        _txPwd = [[STextField alloc] init];
        _txPwd.placeholder = SLocal(@"register_mima");
        _txPwd.backgroundColor = [UIColor clearColor];
        _txPwd.textColor = [UIColor whiteColor];
        _txPwd.secureTextEntry = YES;
        [_txPwd setPlaceholderColor:[UIColor colorWithRed:52.0f / 255.0f green:52.0f / 255.0f blue:52.0f / 255.0f alpha:1.0f]];
    }
    
    return _txPwd;
}

- (STextField *)txComfirmPwd {
    if (!_txComfirmPwd) {
        _txComfirmPwd = [[STextField alloc] init];
        _txComfirmPwd.placeholder = SLocal(@"register_querenmiam");
        _txComfirmPwd.backgroundColor = [UIColor clearColor];
        _txComfirmPwd.textColor = [UIColor whiteColor];
        _txComfirmPwd.secureTextEntry = YES;
        [_txComfirmPwd setPlaceholderColor:[UIColor colorWithRed:52.0f / 255.0f green:52.0f / 255.0f blue:52.0f / 255.0f alpha:1.0f]];
    }
    
    return _txComfirmPwd;
}

- (STextField *)txRecommendCode {
    if (!_txRecommendCode) {
        _txRecommendCode = [[STextField alloc] init];
        _txRecommendCode.placeholder = SLocal(@"register_tuijianma");
        _txRecommendCode.backgroundColor = [UIColor clearColor];
        _txRecommendCode.textColor = [UIColor whiteColor];
        [_txRecommendCode setPlaceholderColor:[UIColor colorWithRed:52.0f / 255.0f green:52.0f / 255.0f blue:52.0f / 255.0f alpha:1.0f]];
    }
    
    return _txRecommendCode;
}

- (SButton *)btnRegister {
    if (!_btnRegister) {
        _btnRegister = [[SButton alloc] init];
        _btnRegister.titleLabel.font = kBtnFontNormal;
        _btnRegister.layer.cornerRadius = 5.0f;
        _btnRegister.layer.masksToBounds = YES;
        [_btnRegister setTitle:SLocal(@"register_zhuce") forState:UIControlStateNormal];
        [_btnRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnRegister setTitleColor:kColorDarkGray forState:UIControlStateHighlighted];
    }
    
    return _btnRegister;
}

- (SButton *)btnLogin {
    if (!_btnLogin) {
        __weak typeof(self) weakSelf = self;
        _btnLogin = [[SButton alloc] init];
        _btnLogin.backgroundColor = [UIColor clearColor];
        _btnLogin.titleLabel.font = kBtnFontSmaller;
        NSString * textPre = SLocal(@"register_yiyouzhanghao");
        NSString * textSuf = SLocal(@"register_denglu");
        NSString * text = [textPre stringByAppendingString:textSuf];
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:142.0f / 255.0f green:142.0f / 255.0f blue:142.0f / 255.0f alpha:1.0f] range:[text rangeOfString:textPre]];
        [attributedText addAttribute:NSForegroundColorAttributeName value:kColorOrange range:[text rangeOfString:textSuf]];
        [_btnLogin setTitle:text forState:UIControlStateNormal];
        [_btnLogin setAttributedTitle:attributedText forState:UIControlStateNormal];
        [[_btnLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf push:[[SLoginByMailController alloc] init]];
        }];
    }
    
    return _btnLogin;
}

- (SNavigationBar *)navigationBar {
    if (!_navigationBar) {
        _navigationBar = [[SNavigationBar alloc] init];
        _navigationBar.backgroundColor = [UIColor clearColor];
        [_navigationBar.btnLeft setImage:[UIImage imageNamed:@"common_fanhui_white"] forState:UIControlStateNormal];
        _navigationBar.lbTitle.text = self.title;
        _navigationBar.lbTitle.textColor = [UIColor whiteColor];
        [_navigationBar.btnLeft addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _navigationBar;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;    
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.v0];
    [self.view addSubview:self.v1];
    [self.view addSubview:self.v2];
    [self.view addSubview:self.v3];
    [self.view addSubview:self.v4];
    [self.view addSubview:self.v5];
    [self.view addSubview:self.v6];
    CGFloat navHeight = isIPhoneX ? 84.0f : 64.0f;
    
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(navHeight);
    }];
    [self.v0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(100.0f);
        make.left.mas_equalTo(20.0f);
        make.right.mas_equalTo(-20.0f);
        make.height.mas_equalTo(50.0f);
    }];
    [self.v1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v0.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v1.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v2.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v4 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v3.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v5 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v4.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.v6 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v5.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v0.mas_height);
    }];
    [self.imgEmail mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v0);
        make.height.mas_equalTo(25.0f);
        make.width.mas_equalTo(25.0f);
    }];
    [self.imgCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v1);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.imgPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v2);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.imgComfirmPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v3);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.imgRecommendCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v4);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.txEmail mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v0);
        make.left.mas_equalTo(weakSelf.imgEmail.mas_right).mas_offset(10.0f);
    }];
    
    CGFloat btnCodeWidth = [self.btnCode.titleLabel.text boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.btnCode.titleLabel.font, NSFontAttributeName, nil] context:nil].size.width + 10.0f;
    
    [self.btnCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v1);
        make.width.mas_equalTo(btnCodeWidth);
    }];
    [self.txCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(weakSelf.v1);
        make.right.mas_equalTo(weakSelf.v1).mas_offset(-btnCodeWidth);
        make.left.mas_equalTo(weakSelf.imgCode.mas_right).mas_offset(10.0f);
    }];
    [self.txPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v2);
        make.left.mas_equalTo(weakSelf.imgPwd.mas_right).mas_offset(10.0f);
    }];
    [self.txComfirmPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v3);
        make.left.mas_equalTo(weakSelf.imgComfirmPwd.mas_right).mas_offset(10.0f);
    }];
    [self.txRecommendCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v4);
        make.left.mas_equalTo(weakSelf.imgRecommendCode.mas_right).mas_offset(10.0f);
    }];
    [self.btnRegister mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.v5);
    }];
    [self.btnLogin mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.v6);
    }];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    self.view.backgroundColor = [UIColor colorWithRed:26.0f / 255.0f green:26.0f / 255.0f blue:26.0f / 255.0f alpha:1.0f];
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
