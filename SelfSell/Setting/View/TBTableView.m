//
//  TBTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBTableView.h"
#import "TBCell.h"

@implementation TBTableView

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    __weak typeof(self) weakSelf = self;
    
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //weakSelf
    }];
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //weakSelf
    }];
    
    return self;
}

@end
