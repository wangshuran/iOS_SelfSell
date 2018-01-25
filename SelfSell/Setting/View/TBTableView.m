//
//  TBTableView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBTableView.h"
#import "SHeaderView.h"

@interface TBTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation TBTableView

#pragma mark - Interface

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    self.isEnableHeader = YES;
    self.isEnableFooter = YES;
    self.dataSource = self;
    self.delegate = self;
    self.estimatedRowHeight = 60.0f;
    self.rowHeight = UITableViewAutomaticDimension;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self registerClass:SHeaderView.class forHeaderFooterViewReuseIdentifier:NSStringFromClass(TBSectionModel.class)];
    [self registerClass:TBArrowCell.class forCellReuseIdentifier:NSStringFromClass(TBArrowModel.class)];
    [self registerClass:TBCell.class forCellReuseIdentifier:NSStringFromClass(TBModel.class)];
    [self registerClass:TBCheckCell.class forCellReuseIdentifier:NSStringFromClass(TBCheckModel.class)];
    [self registerClass:TBExitCell.class forCellReuseIdentifier:NSStringFromClass(TBExitModel.class)];
    [self registerClass:TBSwitchCell.class forCellReuseIdentifier:NSStringFromClass(TBSwitchModel.class)];
    [self registerClass:TBTextCell.class forCellReuseIdentifier:NSStringFromClass(TBTextModel.class)];
    
    return self;
}

- (void)setIsEnableHeader:(BOOL)isEnableHeader {
    _isEnableHeader = isEnableHeader;
    if (_isEnableHeader) {
        __weak typeof(self) weakSelf = self;
        self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.mj_header endRefreshing];
        }];
    }else {
        self.mj_header = nil;
    }
}

- (void)setIsEnableFooter:(BOOL)isEnableFooter {
    _isEnableFooter = isEnableFooter;
    if (_isEnableFooter) {
        __weak typeof(self) weakSelf = self;
        self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf.mj_footer endRefreshing];
        }];
    }else {
        self.mj_footer = nil;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [SNotificationCenter postNotificationName:kNoticeCellEvent object:[tableView cellForRowAtIndexPath:indexPath]];
}

#pragma mark - UITableViewDataSource

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if ([NSString isNullOrEmpty:[self.data objectAtIndex:section].headerTitle]) {
        SHeaderView * headerView = (SHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(TBSectionModel.class)];
        if (!headerView) {
            headerView = [[SHeaderView alloc] init];
        }
        
        return headerView;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.data objectAtIndex:section].headerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.data objectAtIndex:section].headerTitle;
}

//- (UIView *)tableView:(UITableView *)tableView viewForfooterInSection:(NSInteger)section {
//    return [[SSectionView alloc] init];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return [self.data objectAtIndex:section].footerHeight;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
//    return [self.data objectAtIndex:section].footerTitle;
//}

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
