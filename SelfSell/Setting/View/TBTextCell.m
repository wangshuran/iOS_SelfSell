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
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
