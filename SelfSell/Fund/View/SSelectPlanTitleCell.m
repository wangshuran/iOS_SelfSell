//
//  SSelectPlanTitleCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSelectPlanTitleCell.h"

@implementation SSelectPlanTitleCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.lbTitle.textAlignment = NSTextAlignmentCenter;
    self.lbTitle.font = kLbFontBigger;
    return self;
}

@end
