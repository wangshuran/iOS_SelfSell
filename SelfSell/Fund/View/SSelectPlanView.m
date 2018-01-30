//
//  SSelectPlanView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSelectPlanView.h"
#import "SSelectTableView.h"
#import "SFundAddPlanRequest.h"

@interface SSelectPlanView()

@property (nonatomic, strong) SSelectTableView * tableView;

@end

@implementation SSelectPlanView

#pragma mark - Interface

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:1.0f animations:^{
        weakSelf.hidden = YES;
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
    }];
}

- (SSelectTableView *)tableView {
    if (!_tableView) {
        _tableView = [[SSelectTableView alloc] init];
        _tableView.isEnableHeader = NO;
        _tableView.isEnableFooter = NO;
    }
    
    return _tableView;
}

- (void)reloadData {
    __weak typeof(self) weakSelf = self;
    SFundAddPlanRequest * request = [[SFundAddPlanRequest alloc] init];
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        if (!response.status) {
            return;
        }
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            SFundAddPlanResponse * model = (SFundAddPlanResponse *)response;
            TBTextModel * textModel = [[TBTextModel alloc] init];
            textModel.title = SLocal(@"addplan_xuanzesscchiyoujihua");
            NSMutableArray<TBModel *> * items = [[NSMutableArray alloc] init];
            [items addObject:textModel];
            [items addObjectsFromArray:model.plans];
            TBSectionModel * sectionModel = [[TBSectionModel alloc] init];
            sectionModel.items = items;
            weakSelf.tableView.data = [NSArray arrayWithObject:sectionModel];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.tableView reloadData];
            });
        });
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self addSubview:self.tableView];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.left.right.mas_equalTo(weakSelf);
        make.height.mas_equalTo(200.0f);
    }];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    SAddObsver(noticeCellEvent:, kNoticeCellEvent)
    self.backgroundColor = [kColorWhite0 alpha:0.3f];
    [self reloadData];
}

#pragma mark - Private

#pragma mark - NSNotification

- (void)noticeCellEvent:(NSNotification *)notification {
    TBCell * cell = notification.object;
    TBCheckModel * model = (TBCheckModel *)cell.model;
    if (!model || [model isKindOfClass:TBTextModel.class]) {
        return;
    }
    BOOL isExit = NO;
    NSArray<TBSectionModel *> * sections = self.tableView.data;
    for (TBSectionModel * section in sections) {
        if ([section.items containsObject:model]) {
            isExit = YES;
            break;
        }
    }
    if (!isExit) {
        return;
    }
    
    sections = self.tableView.data;
    for (TBSectionModel * section in sections) {
        for (TBModel * item in section.items) {
            if ([item isKindOfClass:TBCheckModel.class]) {
                ((TBCheckModel *)item).isCheck = [model.uid isEqualToString:item.uid];
            }
        }
    }
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableView reloadData];
        [UIView animateWithDuration:1.0f animations:^{
            weakSelf.hidden = YES;
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
        [SNotificationCenter postNotificationName:kNoticeSelectPlan object:model];
    });
}

@end
