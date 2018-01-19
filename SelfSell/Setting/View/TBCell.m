//
//  TBCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBCell.h"

@implementation TBCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    [self.contentView addSubview:self.lbTitle];
    [self.contentView addSubview:self.lbValue];
    [self.contentView addSubview:self.vLine];

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setModel:(TBModel *)model {
    _model = model;
    
    self.lbTitle.text = model.title;
    self.lbValue.text = model.value;
}

- (UILabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [[UILabel alloc] init];
        _lbTitle.numberOfLines = 0;
        _lbTitle.font = kTitleFont;
        _lbTitle.textAlignment = NSTextAlignmentLeft;
        _lbTitle.textColor = kTitleNormalColor;
    }
    
    return _lbTitle;
}

- (UILabel *)lbValue {
    if (!_lbValue) {
        _lbValue = [[UILabel alloc] init];
        _lbValue.numberOfLines = 0;
        _lbValue.font = kValueFont;
        _lbValue.textAlignment = NSTextAlignmentRight;
        _lbValue.textColor = kValueColor;
    }
    
    return _lbValue;
}

- (UIView *)vLine {
    if (!_vLine) {
        _vLine = [[UIView alloc] init];
        _vLine.backgroundColor = [UIColor randomColor];
    }
    
    return _vLine;
}

@end
