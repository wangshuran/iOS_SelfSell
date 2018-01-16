//
//  TBSwitchCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBSwitchCell.h"

@interface TBSwitchCell()

@property (nonatomic, strong) UILabel * lbTitle;

@property (nonatomic, strong) UISwitch * btnSwitch;

@end

@implementation TBSwitchCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.lbTitle];
    [self.contentView addSubview:self.btnSwitch];
    
    __weak typeof(self) weakSelf = self;    
    [self.btnSwitch mas_updateConstraints:^(MASConstraintMaker * make) {
        make.right.mas_equalTo(-20.0f);
        make.height.mas_equalTo(31.0f);
        make.width.mas_equalTo(51.0f);
        make.centerY.mas_equalTo(weakSelf.contentView.mas_centerY);
    }];
    
    [self.lbTitle mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(10.0f);
        make.bottom.mas_equalTo(-10.0f);
        make.left.mas_equalTo(10.0f);
        make.right.mas_equalTo(weakSelf.btnSwitch.mas_left).offset(-10.0f);
    }];
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    TBSwitchModel * switchModel = (TBSwitchModel *)model;
    self.lbTitle.text = switchModel.title;
    self.btnSwitch.on = switchModel.isOn;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UILabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [[UILabel alloc] init];
        _lbTitle.numberOfLines = 0;
        _lbTitle.font = [LFont thin_15];
    }
    
    return _lbTitle;
}

- (UISwitch *)btnSwitch {
    if (!_btnSwitch) {
        _btnSwitch = [[UISwitch alloc] init];
        _btnSwitch.onTintColor = [UIColor greenColor];
        _btnSwitch.tintColor = [UIColor grayColor];
    }
    
    return _btnSwitch;
}

@end
