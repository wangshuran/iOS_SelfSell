//
//  SFundPlanCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundPlanCell.h"

@interface SFundPlanCell()

@property (nonatomic, strong) SView * vBackground;

@end

@implementation SFundPlanCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = kColorWhite250;
    [self.contentView addSubview:self.vBackground];
    
    __weak typeof(self) weakSelf = self;
    [self.vBackground mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.contentView).mas_offset(10.0f);
        make.bottom.mas_equalTo(weakSelf.contentView);
        make.left.mas_equalTo(weakSelf.contentView).mas_offset(10.0f);
        make.right.right.mas_equalTo(weakSelf.contentView).mas_offset(-10.0f);
        make.height.mas_greaterThanOrEqualTo(70.0f);
    }];
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    FundPlanModel * planModel = (FundPlanModel *)model;
}

- (SView *)vBackground {
    if (!_vBackground) {
        _vBackground = [[SView alloc] init];
        _vBackground.backgroundColor = kColorWhite255;
    }
    
    return _vBackground;
}

@end
