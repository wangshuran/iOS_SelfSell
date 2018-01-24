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
    [self.contentView addSubview:self.vBottomLine];
    
    return self;
}

- (void)setModel:(TBModel *)model {
    _model = model;
    
    self.lbTitle.text = model.title;
    self.lbValue.text = model.value;
}

- (SLabel *)lbTitle {
    if (!_lbTitle) {
        _lbTitle = [[SLabel alloc] init];
        _lbTitle.numberOfLines = 0;
        _lbTitle.textAlignment = NSTextAlignmentLeft;
        _lbTitle.backgroundColor = [UIColor clearColor];
        _lbTitle.font = kBtnFontNormal;
    }
    
    return _lbTitle;
}

- (SLabel *)lbValue {
    if (!_lbValue) {
        _lbValue = [[SLabel alloc] init];
        _lbValue.numberOfLines = 0;
        _lbValue.textAlignment = NSTextAlignmentRight;        
        _lbValue.backgroundColor = [UIColor clearColor];
        _lbValue.font = kLbFontSmaller;
    }
    
    return _lbValue;
}

- (UIView *)vBottomLine {
    if (!_vBottomLine) {
        _vBottomLine = [[UIView alloc] init];
        _vBottomLine.backgroundColor = [UIColor randomColor];
    }
    
    return _vBottomLine;
}

@end
