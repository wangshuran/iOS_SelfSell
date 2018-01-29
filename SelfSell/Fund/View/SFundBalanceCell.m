//
//  SFundBalanceCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundBalanceCell.h"

@interface SFundBalanceCell()

@property (nonatomic, strong) SView * vBackground;

@property (nonatomic, strong) SLabel * lbMoneyAndCount;

@property (nonatomic, strong) SButton * btnTurnInto;

@property (nonatomic, strong) SButton * btnTurnOut;

@end

@implementation SFundBalanceCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.vBackground];
    [self.contentView addSubview:self.lbMoneyAndCount];
    [self.contentView addSubview:self.btnTurnInto];
    [self.contentView addSubview:self.btnTurnOut];
    CGFloat height = CGRectGetHeight(UIScreen.mainScreen.bounds);
    
    __weak typeof(self) weakSelf = self;
    [self.vBackground mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.mas_equalTo(weakSelf.contentView.mas_top);
        make.left.right.mas_equalTo(weakSelf.contentView);
        make.height.mas_equalTo(height);
    }];
    [self.lbMoneyAndCount mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(0.0f);
        make.left.mas_equalTo(10.0f);
        make.right.mas_equalTo(-10.0f);
        make.height.mas_equalTo(70.0f);
    }];
    [self.btnTurnOut mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.lbMoneyAndCount.mas_bottom);
        make.bottom.left.mas_equalTo(weakSelf.contentView);
        make.height.mas_equalTo(50.0f);
    }];
    [self.btnTurnInto mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.lbMoneyAndCount.mas_bottom);
        make.bottom.right.mas_equalTo(weakSelf.contentView);
        make.left.mas_equalTo(weakSelf.btnTurnOut.mas_right);
        make.height.width.mas_equalTo(weakSelf.btnTurnOut);
    }];
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    FundBalanceModel * balanceModel = (FundBalanceModel *)model;
}

- (SView *)vBackground {
    if (!_vBackground) {
        _vBackground = [[SView alloc] init];
        _vBackground.backgroundColor = kColorWhite70;
    }
    
    return _vBackground;
}

- (SLabel *)lbMoneyAndCount {
    if (!_lbMoneyAndCount) {
        _lbMoneyAndCount = [[SLabel alloc] init];
        _lbMoneyAndCount.numberOfLines = 2;
        [self updateUI:@"0" count:@"0"];
    }
    
    return _lbMoneyAndCount;
}

- (SButton *)btnTurnOut {
    if (!_btnTurnOut) {
        _btnTurnOut = [[SButton alloc] init];
        [_btnTurnOut setTitle:SLocal(@"fund_zhuanru") forState:UIControlStateNormal];
        [_btnTurnOut setImage:[UIImage imageNamed:@"fund_zhuanru"] forState:UIControlStateNormal];
        [_btnTurnOut setTitleColor:kColorWhite220 forState:UIControlStateNormal];
    }
    
    return _btnTurnOut;
}

- (SButton *)btnTurnInto {
    if (!_btnTurnInto) {
        _btnTurnInto = [[SButton alloc] init];
        [_btnTurnInto setTitle:SLocal(@"fund_zhuanru") forState:UIControlStateNormal];
        [_btnTurnInto setImage:[UIImage imageNamed:@"fund_zhuanru"] forState:UIControlStateNormal];
        [_btnTurnInto setTitleColor:kColorWhite220 forState:UIControlStateNormal];
    }
    
    return _btnTurnInto;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.backgroundColor = kColorWhite70;
}

#pragma mark - Private

- (void)updateUI:(NSString *)money count:(NSString *)count {
    if ([NSString isNullOrEmpty:money]) {
        money = @"0";
    }
    if ([NSString isNullOrEmpty:count]) {
        count = @"0";
    }
    NSString * textPre = [NSString stringWithFormat:@"$%@", money];
    NSString * textSuf = [NSString stringWithFormat:@"%@ SSC", count];
    NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
    NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorWhite160, NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorWhite220, NSForegroundColorAttributeName, [LFont bold_25], NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
    self.lbMoneyAndCount.attributedText = attributedText;
}

@end
