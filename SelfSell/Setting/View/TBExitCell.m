//
//  TBExitCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBExitCell.h"

@interface TBExitCell()

@property (nonatomic, strong) UIButton * btnExit;

@end

@implementation TBExitCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.contentView addSubview:self.btnExit];
    
    __weak typeof(self) weakSelf = self;
    [self.btnExit mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(10.0f);
        make.bottom.mas_equalTo(-10.0f);
        make.left.mas_equalTo(10.0f);
        make.right.mas_equalTo(-10.0f);
        make.height.mas_greaterThanOrEqualTo(30.0f);
    }];
    
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    [self.btnExit setTitle:model.title forState:UIControlStateNormal];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UIButton *)btnExit {
    if (!_btnExit) {
        _btnExit = [[UIButton alloc] init];
        _btnExit.layer.cornerRadius = 5.0f;
        _btnExit.layer.masksToBounds = YES;
        _btnExit.layer.borderColor = [UIColor grayColor].CGColor;
        _btnExit.layer.borderWidth = 0.5f;
        _btnExit.titleLabel.font = kTitleFont;
        [_btnExit setTitleColor:kTitleColor forState:UIControlStateNormal];
    }
    
    return _btnExit;
}

@end
