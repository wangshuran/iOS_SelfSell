//
//  SAboutController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SAboutController.h"

@interface SAboutController ()

@property (nonatomic, strong) SImageView * imgLogo;

@property (nonatomic, strong) SLabel * lbVersion;

@end

@implementation SAboutController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"about_title");
}

- (SImageView *)imgLogo {
    if (!_imgLogo) {
        _imgLogo = [[SImageView alloc] init];
        _imgLogo.image = [UIImage imageNamed:@"common_logo"];
    }
    
    return _imgLogo;
}

- (SLabel *)lbVersion {
    if (!_lbVersion) {
        _lbVersion = [[SLabel alloc] init];
        _lbVersion.text = [NSString stringWithFormat:@"V %@.%@", [LAppInfo CFBundleShortVersionString], [LAppInfo CFBundleVersion]];
        _lbVersion.textColor = kColorWhite100;
    }
    
    return _lbVersion;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.imgLogo];
    [self.view addSubview:self.lbVersion];
    CGFloat width = self.imgLogo.image.size.width;
    CGFloat height = self.imgLogo.image.size.height;
    CGFloat maxWidth = 250.0f;
    if (width > maxWidth) {
        height = height * (maxWidth / width);
        width = maxWidth;
    }
    [self.imgLogo mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(kNavHeight + 100.0f);
        make.height.mas_equalTo(100.0f);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
    }];
    [self.lbVersion mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.imgLogo.mas_bottom).mas_offset(10.0f);
        make.height.mas_equalTo(30.0f);
        make.centerX.mas_equalTo(weakSelf.imgLogo.mas_centerX);
    }];
}

@end
