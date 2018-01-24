//
//  TBTextCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/16.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBTextCell.h"

@implementation TBTextCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;    
    
    __weak typeof(self) weakSelf = self;
    [self.lbTitle mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(10.0f);
        make.bottom.mas_equalTo(-10.0f);
        make.left.mas_equalTo(10.0f);
        make.right.mas_equalTo(-10.0f);
        make.height.mas_greaterThanOrEqualTo(30.0f);
    }];
    
    [self.lbValue mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(10.0f);
        make.bottom.mas_equalTo(-10.0f);
        make.left.mas_equalTo(10.0f);
        make.right.mas_equalTo(-10.0f);
        make.height.mas_greaterThanOrEqualTo(30.0f);
    }];
    
    return self;
}

@end
