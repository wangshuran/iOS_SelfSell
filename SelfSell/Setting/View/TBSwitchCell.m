//
//  TBSwitchCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBSwitchCell.h"

@interface TBSwitchCell()

@end

@implementation TBSwitchCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
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
        make.height.mas_greaterThanOrEqualTo(30.0f);
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

- (UISwitch *)btnSwitch {
    if (!_btnSwitch) {
        _btnSwitch = [[UISwitch alloc] init];
        _btnSwitch.onTintColor = [UIColor greenColor];
        _btnSwitch.tintColor = [UIColor grayColor];
        //[[_btnSwitch rac_newOnChannel] subscribeNext:^(NSNumber * x) {
        //[SNotificationCenter postNotificationName:kNoticeCellEvent object:weakSelf];
        //}];
        [_btnSwitch addTarget:self action:@selector(updateSwitch:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnSwitch;
}

#pragma mark - Private

- (void)updateSwitch:(UISwitch *)sender {
    __weak typeof(self) weakSelf = self;
    [SNotificationCenter postNotificationName:kNoticeCellEvent object:weakSelf];
}

@end
