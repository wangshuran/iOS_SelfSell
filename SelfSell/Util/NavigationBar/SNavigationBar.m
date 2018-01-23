//
//  SNavigationBar.m
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SNavigationBar.h"

@implementation SNavigationBar


#pragma mark - Interface

- (SView *)vLeft {
    if (!_vLeft) {
        _vLeft = [[SView alloc] init];
        _vLeft.backgroundColor = [UIColor clearColor];
        [_vLeft addSubview:self.btnLeft];
    }
    
    return _vLeft;
}

- (SButton *)btnLeft {
    if (!_btnLeft) {
        _btnLeft = [[SButton alloc] init];
        _btnLeft.backgroundColor = [UIColor clearColor];
        _btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 0.0f);
        [_btnLeft setImage:[UIImage imageNamed:@"common_fanhui"] forState:UIControlStateNormal];
    }
    
    return _btnLeft;
}

- (SView *)vTitle {
    if (!_vTitle) {
        _vTitle = [[SView alloc] init];
        _vTitle.backgroundColor = [UIColor clearColor];
        [_vTitle addSubview:self.lbTitle];
    }
    
    return _vTitle;
}

- (SLabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [[SLabel alloc] init];
        _lbTitle.backgroundColor = [UIColor clearColor];
        _lbTitle.textAlignment = NSTextAlignmentCenter;
        _lbTitle.font = kBtnFontNormal;
    }
    
    return _lbTitle;
}

- (SView *)vRight {
    if (!_vRight) {
        _vRight = [[SView alloc] init];
        _vRight.backgroundColor = [UIColor clearColor];
    }
    
    return _vRight;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self addSubview:self.vLeft];
    [self addSubview:self.vTitle];
    [self addSubview:self.vRight];
    [self.lbTitle mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.vTitle);
    }];
    [self.btnLeft mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.vLeft);
    }];
    [self.vLeft mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.left.mas_equalTo(weakSelf);
        make.width.mas_equalTo(64.0f);
        make.height.mas_equalTo(44.0f);
    }];
    [self.vTitle mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.mas_equalTo(weakSelf);
        make.left.mas_equalTo(weakSelf.vLeft.mas_right);
        make.right.mas_equalTo(weakSelf.vRight.mas_left);
        make.height.mas_equalTo(44.0f);
    }];
    [self.vRight mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.right.mas_equalTo(weakSelf);
        make.width.mas_equalTo(64.0f);
        make.height.mas_equalTo(44.0f);
    }];
}

@end
