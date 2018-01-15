//
//  TBTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBTableView.h"
#import "TBCell.h"

@interface TBTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TBTableView

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    __weak typeof(self) weakSelf = self;
    
    self.dataSource = self;
    self.delegate = self;
    
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBCell.class)];
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
    if (self.data.count > section) {
        return 0;
    }
    
    return [self.data objectAtIndex:section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
