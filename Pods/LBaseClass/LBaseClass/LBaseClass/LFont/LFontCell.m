//
//  LFontCell.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/4.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LFontCell.h"
#import <Masonry/Masonry.h>

@interface LFontCell()

@property (nonatomic, strong) UILabel * info;

@end

@implementation LFontCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];    
    
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

- (UILabel *)info {
    if (!_info) {
        _info = [[UILabel alloc] init];
        _info.numberOfLines = 0;
    }
    
    return _info;
}

- (void)setModel:(LFontModel *)model {
    _model = model;
    
    self.info.text = model.text;
    self.info.font = [UIFont systemFontOfSize:model.size weight:model.weight];
}

- (void)layoutSubviews {
    [self.info mas_makeConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(0.0f);
    }];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    [self.contentView addSubview:self.info];
}

@end
