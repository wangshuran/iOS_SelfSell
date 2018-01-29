//
//  FundTradeTitleCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "FundTradeTitleCell.h"

@interface FundTradeTitleCell()

@property (nonatomic, strong) SLabel * lbHistory;

@property (nonatomic, strong) SLabel * lbDate;

@property (nonatomic, strong) SLabel * lbTradeType;

@property (nonatomic, strong) SLabel * lbCoin;

@property (nonatomic, strong) SLabel * lbCount;

@end

@implementation FundTradeTitleCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = kColorWhite250;
    [self.contentView addSubview:self.lbHistory];
    [self.contentView addSubview:self.lbDate];
    [self.contentView addSubview:self.lbTradeType];
    [self.contentView addSubview:self.lbCoin];
    [self.contentView addSubview:self.lbCount];
    
    __weak typeof(self) weakSelf = self;
    [self.lbHistory mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.contentView).mas_offset(10.0f);
        make.left.mas_equalTo(weakSelf.contentView).mas_offset(10.0f);
        make.right.right.mas_equalTo(weakSelf.contentView).mas_offset(-10.0f);
        make.height.mas_greaterThanOrEqualTo(50.0f);
    }];
    [self.lbDate mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.lbHistory);
        make.bottom.mas_equalTo(weakSelf.contentView);
        make.left.mas_equalTo(weakSelf.contentView);
        make.height.mas_greaterThanOrEqualTo(20.0f);
    }];
    [self.lbTradeType mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.height.mas_equalTo(weakSelf.lbDate);
        make.left.mas_equalTo(weakSelf.lbDate.mas_right);
    }];
    [self.lbCoin mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.height.mas_equalTo(weakSelf.lbDate);
        make.left.mas_equalTo(weakSelf.lbTradeType.mas_right);
    }];
    [self.lbCount mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.height.mas_equalTo(weakSelf.lbDate);
        make.left.mas_equalTo(weakSelf.lbCoin.mas_right);
        make.height.width.mas_equalTo(weakSelf.lbHistory);
    }];
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    FundTradeTitleModel * tradeTitleModel = (FundTradeTitleModel *)model;
}

- (SLabel *)lbHistory {
    if (!_lbHistory) {
        _lbHistory = [[SLabel alloc] init];
        _lbHistory.text = SLocal(@"fund_lishi");
    }
    
    return _lbHistory;
}

- (SLabel *)lbDate {
    if (!_lbDate) {
        _lbDate = [[SLabel alloc] init];
        _lbDate.text = SLocal(@"fund_riqi");
        _lbDate.backgroundColor = kColorWhite255;
    }
    
    return _lbDate;
}

- (SLabel *)lbTradeType {
    if (!_lbTradeType) {
        _lbTradeType = [[SLabel alloc] init];
        _lbTradeType.text = SLocal(@"fund_jiaoyileixing");
        _lbTradeType.backgroundColor = kColorWhite255;
    }
    
    return _lbTradeType;
}

- (SLabel *)lbCoin {
    if (!_lbCoin) {
        _lbCoin = [[SLabel alloc] init];
        _lbCoin.text = SLocal(@"fund_daibi");
        _lbCoin.backgroundColor = kColorWhite255;
    }
    
    return _lbCoin;
}

- (SLabel *)lbCount {
    if (!_lbCount) {
        _lbCount = [[SLabel alloc] init];
        _lbCount.text = SLocal(@"fund_shuliang");
        _lbCount.backgroundColor = kColorWhite255;
    }
    
    return _lbCount;
}

@end
