//
//  SSelectTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSelectTableView.h"
#import "SSelectPlanCell.h"
#import "SSelectPlanTitleCell.h"

@implementation SSelectTableView

#pragma mark - Interface

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    [self registerClass:SSelectPlanCell.class forCellReuseIdentifier:NSStringFromClass(SFundAddPlanModel.class)];
    [self registerClass:SSelectPlanTitleCell.class forCellReuseIdentifier:NSStringFromClass(TBTextModel.class)];
    return self;
}

@end
