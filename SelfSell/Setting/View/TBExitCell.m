//
//  TBExitCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBExitCell.h"

@interface TBExitCell()

@property (nonatomic, strong) SButton * btnExit;

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
        make.height.mas_greaterThanOrEqualTo(40.0f);
    }];
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    [self.btnExit setTitle:model.title forState:UIControlStateNormal];
}

- (SButton *)btnExit {
    if (!_btnExit) {
        __weak typeof(self) weakSelf = self;
        _btnExit = [[SButton alloc] init];
        _btnExit.layer.cornerRadius = 5.0f;
        _btnExit.layer.masksToBounds = YES;
        _btnExit.layer.borderColor = [UIColor grayColor].CGColor;
        _btnExit.layer.borderWidth = 0.5f;
        [_btnExit setTitleColor:kColorWhite10 forState:UIControlStateNormal];
        [[_btnExit rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            SButton * btn = x;
            btn.userInteractionEnabled = NO;
            [SNotificationCenter postNotificationName:kNoticeCellEvent object:weakSelf];
            btn.userInteractionEnabled = YES;
        }];
    }
    
    return _btnExit;
}

@end
