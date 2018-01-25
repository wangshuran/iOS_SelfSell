//
//  SLoginByMailController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLoginByMailController.h"
#import "SNavigationBar.h"
#import "SForgetPWDByMailController.h"
#import "SRegisterByMailController.h"
#import "SLoginByMailRequest.h"

@interface SLoginByMailController ()

@property (nonatomic, strong) SView * v0;

@property (nonatomic, strong) SView * v1;

@property (nonatomic, strong) SView * v2;

@property (nonatomic, strong) SView * v3;

@property (nonatomic, strong) SView * v4;

@property (nonatomic, strong) SImageView * imgLogo;

@property (nonatomic, strong) SImageView * imgEmail;

@property (nonatomic, strong) SImageView * imgPwd;

@property (nonatomic, strong) STextField * txEmail;

@property (nonatomic, strong) STextField * txPwd;

@property (nonatomic, strong) SButton * btnFinish;

@property (nonatomic, strong) SButton * btnForgetPwd;

@property (nonatomic, strong) SButton * btnRegister;

@property (nonatomic, strong) SNavigationBar * navigationBar;

@end

@implementation SLoginByMailController

#pragma mark - Interface

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (SView *)v0 {
    if (!_v0) {
        _v0 = [self getBlackRect];
        _v0.backgroundColor = [UIColor clearColor];
        [_v0 addSubview:self.imgLogo];
    }
    
    return _v0;
}

- (SView *)v1 {
    if (!_v1) {
        _v1 = [self getBlackRect];
        [_v1 addSubview:self.imgEmail];
        [_v1 addSubview:self.txEmail];
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
        _v3.backgroundColor = [UIColor clearColor];
        [_v3 addSubview:self.btnFinish];
    }
    
    return _v3;
}

- (SView *)v4 {
    if (!_v4) {
        _v4 = [self getBlackRect];
        _v4.backgroundColor = [UIColor clearColor];
        [_v4 addSubview:self.btnForgetPwd];
        [_v4 addSubview:self.btnRegister];
    }
    
    return _v4;
}

- (SImageView *)imgLogo {
    if (!_imgLogo) {
        _imgLogo = [[SImageView alloc] init];
        _imgLogo.image = [UIImage imageNamed:@"common_logo"];
    }
    
    return _imgLogo;
}

- (SImageView *)imgEmail {
    if (!_imgEmail) {
        _imgEmail = [[SImageView alloc] init];
        _imgEmail.image = [UIImage imageNamed:@"login_email"];
    }
    
    return _imgEmail;
}

- (SImageView *)imgPwd {
    if (!_imgPwd) {
        _imgPwd = [[SImageView alloc] init];
        _imgPwd.image = [UIImage imageNamed:@"login_lock"];
    }
    
    return _imgPwd;
}

- (STextField *)txEmail {
    if (!_txEmail) {
        __weak typeof(self) weakSelf = self;
        _txEmail = [[STextField alloc] init];
        _txEmail.placeholder = SLocal(@"register_youxiang");
        _txEmail.backgroundColor = [UIColor clearColor];
        _txEmail.keyboardType = UIKeyboardTypeEmailAddress;
        _txEmail.textColor = [UIColor whiteColor];
        [_txEmail setPlaceholderColor:[UIColor colorWithRed:92.0f / 255.0f green:92.0f / 255.0f blue:92.0f / 255.0f alpha:1.0f]];
        [_txEmail.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            [weakSelf updateBtnFinish];
        }];
    }
    
    return _txEmail;
}

- (STextField *)txPwd {
    if (!_txPwd) {
        __weak typeof(self) weakSelf = self;
        _txPwd = [[STextField alloc] init];
        _txPwd.placeholder = SLocal(@"login_mima");
        _txPwd.backgroundColor = [UIColor clearColor];
        _txPwd.textColor = [UIColor whiteColor];
        _txPwd.secureTextEntry = YES;
        [_txPwd setPlaceholderColor:[UIColor colorWithRed:92.0f / 255.0f green:92.0f / 255.0f blue:92.0f / 255.0f alpha:1.0f]];
        [_txPwd.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
            [weakSelf updateBtnFinish];
        }];
    }
    
    return _txPwd;
}

- (SButton *)btnFinish {
    if (!_btnFinish) {
        __weak typeof(self) weakSelf = self;
        _btnFinish = [[SButton alloc] init];
        _btnFinish.backgroundColor = kColorLightGray;
        _btnFinish.layer.cornerRadius = 5.0f;
        _btnFinish.layer.masksToBounds = YES;
        [_btnFinish setTitle:SLocal(@"login_denglu") forState:UIControlStateNormal];
        [[_btnFinish rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            SButton * btn = x;
            btn.userInteractionEnabled = NO;
            [weakSelf.view endEditing:YES];
            NSString * email = weakSelf.txEmail.text;
            NSString * pwd = weakSelf.txPwd.text;
            
            SLoginByMailRequest * request = [[SLoginByMailRequest alloc] init];
            request.email = email;
            request.password = pwd;
            //request.googleAuthCode = pwd;
            [SNetwork request:request block:^(LRequest * request, LResponse * response) {
                if (!response.status) {
                    btn.userInteractionEnabled = YES;
                    [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
                    return;
                }
                SLoginByMailResponse * model = (SLoginByMailResponse *)response;
                //判断是否需要验证GoogleCode
                model.data.pwd = pwd;
                model.data.loginType = LoginTypeAccount;
                model.data.loginTime = [[NSDate date] timeIntervalSince1970];
                [[AppContext sharedAppContext].accountDao close];
                [AppContext sharedAppContext].accountDao = nil;
                [AppContext sharedAppContext].accountModel = model.data;
                [[AppContext sharedAppContext] updateLoginAccount:[AppContext sharedAppContext].accountModel];
                SPostNotification(kNoticeFinishLogin);
                btn.userInteractionEnabled = YES;
                [weakSelf dismiss];
            }];
        }];
    }
    
    return _btnFinish;
}

- (SButton *)btnForgetPwd {
    if (!_btnForgetPwd) {
        __weak typeof(self) weakSelf = self;
        _btnForgetPwd = [[SButton alloc] init];
        _btnForgetPwd.backgroundColor = [UIColor clearColor];
        _btnForgetPwd.layer.cornerRadius = 5.0f;
        _btnForgetPwd.layer.masksToBounds = YES;
        _btnForgetPwd.titleLabel.textAlignment = NSTextAlignmentLeft;
        _btnForgetPwd.titleLabel.font = kBtnFontSmaller;
        [_btnForgetPwd setTitle:SLocal(@"login_wangjimima") forState:UIControlStateNormal];
        [_btnForgetPwd setTitleColor:kColorOrange forState:UIControlStateNormal];
        [[_btnForgetPwd rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf push:[[SForgetPWDByMailController alloc] init]];
        }];
    }
    
    return _btnForgetPwd;
}

- (SButton *)btnRegister {
    if (!_btnRegister) {
        __weak typeof(self) weakSelf = self;
        _btnRegister = [[SButton alloc] init];
        _btnRegister.backgroundColor = [UIColor clearColor];
        _btnRegister.titleLabel.textAlignment = NSTextAlignmentRight;
        _btnRegister.titleLabel.font = kBtnFontSmaller;
        NSString * textPre = SLocal(@"login_meiyouzhanghu");
        NSString * textSuf = SLocal(@"login_zhuce");
        NSString * text = [textPre stringByAppendingString:textSuf];
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:142.0f / 255.0f green:142.0f / 255.0f blue:142.0f / 255.0f alpha:1.0f] range:[text rangeOfString:textPre]];
        [attributedText addAttribute:NSForegroundColorAttributeName value:kColorOrange range:[text rangeOfString:textSuf]];
        [_btnRegister setTitle:text forState:UIControlStateNormal];
        [_btnRegister setAttributedTitle:attributedText forState:UIControlStateNormal];
        [[_btnRegister rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf push:[[SRegisterByMailController alloc] init]];
        }];
    }
    
    return _btnRegister;
}

- (SNavigationBar *)navigationBar {
    if (!_navigationBar) {
        __weak typeof(self) weakSelf = self;
        _navigationBar = [[SNavigationBar alloc] init];
        _navigationBar.backgroundColor = [UIColor clearColor];
        _navigationBar.lbTitle.text = self.title;
        _navigationBar.lbTitle.textColor = [UIColor whiteColor];
        [_navigationBar.btnLeft setImage:[UIImage imageNamed:@"common_fanhui_white"] forState:UIControlStateNormal];
        [[_navigationBar.btnLeft rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [[AppContext sharedAppContext] setSelectVC:[AppContext sharedAppContext].activityNav];
            [weakSelf dismiss];
        }];
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
    CGFloat navHeight = isIPhoneX ? 84.0f : 64.0f;
    
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(navHeight);
    }];
    [self.v0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(64.0f);
        make.left.mas_equalTo(20.0f);
        make.right.mas_equalTo(-20.0f);
        make.height.mas_equalTo(140.0f);
    }];
    [self.v1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v0.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(50.0f);
    }];
    [self.v2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v1.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v1.mas_height);
    }];
    [self.v3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v2.mas_bottom).mas_offset(20.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v1.mas_height);
    }];
    [self.v4 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.v3.mas_bottom).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.v0.mas_left);
        make.right.mas_equalTo(weakSelf.v0.mas_right);
        make.height.mas_equalTo(weakSelf.v1.mas_height);
    }];
    [self.imgLogo mas_updateConstraints:^(MASConstraintMaker * make) {
        make.center.mas_equalTo(weakSelf.v0);
    }];
    [self.imgEmail mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v1);
        make.height.mas_equalTo(25.0f);
        make.width.mas_equalTo(25.0f);
    }];
    [self.imgPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_offset(10.0f);
        make.centerY.mas_equalTo(weakSelf.v2);
        make.height.mas_equalTo(weakSelf.imgEmail.mas_height);
        make.width.mas_equalTo(weakSelf.imgEmail.mas_width);
    }];
    [self.txEmail mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v1);
        make.left.mas_equalTo(weakSelf.imgEmail.mas_right).mas_offset(10.0f);
    }];
    [self.txPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v2);
        make.left.mas_equalTo(weakSelf.imgPwd.mas_right).mas_offset(10.0f);
    }];
    [self.btnFinish mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.v3);
    }];
    CGFloat btnForgetPwdWidth = [self.btnForgetPwd.titleLabel.text boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.btnForgetPwd.titleLabel.font, NSFontAttributeName, nil] context:nil].size.width + 10.0f;
    [self.btnForgetPwd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.mas_equalTo(weakSelf.v4);
        make.width.mas_equalTo(btnForgetPwdWidth);
    }];
    CGFloat btnRegisterWidth = [self.btnRegister.titleLabel.text boundingRectWithSize:CGSizeZero options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.btnRegister.titleLabel.font, NSFontAttributeName, nil] context:nil].size.width + 10.0f;
    [self.btnRegister mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.right.mas_equalTo(weakSelf.v4);
        make.width.mas_equalTo(btnRegisterWidth);
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

- (void)updateBtnFinish {
    self.txEmail.text = @"liqiang01@new4g.cn";
    self.txPwd.text = @"123456";
    
    NSString * email = self.txEmail.text;
    NSString * pwd = self.txPwd.text;
    if ([NSString isNullOrEmpty:email] || [NSString isNullOrEmpty:pwd]) {
        self.btnFinish.userInteractionEnabled = NO;
        [self.btnFinish setTitleColor:[kColorBlack alpha:0.5f] forState:UIControlStateNormal];
    }else {
        self.btnFinish.userInteractionEnabled = YES;
        [self.btnFinish setTitleColor:kColorBlack forState:UIControlStateNormal];
    }
}

@end
