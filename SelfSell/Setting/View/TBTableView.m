//
//  TBTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBTableView.h"
#import "TBArrowCell.h"
#import "TBCell.h"
#import "TBExitCell.h"
#import "TBSwitchCell.h"
#import "TBTextCell.h"

@interface TBTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TBTableView

#pragma mark - Interface

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:TBArrowCell.class forCellReuseIdentifier:NSStringFromClass(TBArrowModel.class)];
    [self registerClass:TBExitCell.class forCellReuseIdentifier:NSStringFromClass(TBExitModel.class)];
    [self registerClass:TBSwitchCell.class forCellReuseIdentifier:NSStringFromClass(TBSwitchModel.class)];
    [self registerClass:TBTextCell.class forCellReuseIdentifier:NSStringFromClass(TBTextModel.class)];
    
    __weak typeof(self) weakSelf = self;
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.mj_header endRefreshing];
    }];
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf.mj_footer endRefreshing];
    }];
    
    return self;
}

#pragma mark - UITableViewDelegate


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.data.count <= section) {
        return 0;
    }
    return [self.data objectAtIndex:section].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.data.count <= indexPath.section) {
        return nil;
    }
    TBSectionModel * section =[self.data objectAtIndex:indexPath.section];
    if (section.items.count <= indexPath.row) {
        return nil;
    }
    
    TBModel * model = [section.items objectAtIndex:indexPath.row];
    TBCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(model.class) forIndexPath:indexPath];
    cell.model = model;
    
    return cell;
}

@end
