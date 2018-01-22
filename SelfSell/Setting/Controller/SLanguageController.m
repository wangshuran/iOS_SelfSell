//
//  SLanguageController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/17.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLanguageController.h"
#import "SLanguageService.h"
#import "TBTableView.h"
#import "SLanguage.h"

@interface SLanguageController ()

@property (nonatomic, strong) SLanguageService * languageService;

@property (nonatomic, strong) TBTableView * tbTableView;

@property (nonatomic, copy) NSString * strSelectLanguage;

@property (nonatomic, strong) SButton * btnRight;

@end

@implementation SLanguageController

#pragma mark - Interface

- (NSString *)title {
    return SLocal(@"language_title");
}

- (SLanguageService *)languageService {
    if (!_languageService) {
        __weak typeof(self) weakSelf = self;
        _languageService = [[SLanguageService alloc] init];
        [_languageService subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * transfer) {
            NSArray<TBSectionModel *> * model = transfer.value;
            
            weakSelf.tbTableView.data = model;
            [weakSelf.tbTableView reloadData];
        }];
    }
    
    return _languageService;
}

- (TBTableView *)tbTableView {
    if (!_tbTableView) {
        _tbTableView = [[TBTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tbTableView.isEnableFooter = NO;
        _tbTableView.isEnableHeader = NO;
    }
    
    return _tbTableView;
}

- (SButton *)btnRight {
    if (!_btnRight) {
        _btnRight = [[SButton alloc] init];
        _btnRight.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
        [_btnRight setTitle:SLocal(@"保存") forState:UIControlStateNormal];
        [_btnRight setTitleColor:[UIColor colorWithRed:255.0f / 255.0f green:140.0f / 255.0f blue:0.0f / 255.0f alpha:0.3f] forState:UIControlStateNormal];
        [_btnRight setTitleColor:[UIColor colorWithRed:255.0f / 255.0f green:140.0f / 255.0f blue:0.0f / 255.0f alpha:0.3f] forState:UIControlStateHighlighted];
        [_btnRight addTarget:self action:@selector(updateLanguage:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnRight;
}

- (void)loadView {
    [super loadView];
    
    __weak typeof(self) weakSelf = self;
    [self.vNavRight addSubview:self.btnRight];
    [self.view addSubview:self.tbTableView];
    [self.tbTableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    
    [self.languageService execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    SAddObsver(noticeCellEvent:, kNoticeCellEvent)
}

#pragma mark - NSNotification

- (void)noticeCellEvent:(NSNotification *)notification {
    TBCell * cell = notification.object;
    TBCheckModel * model = (TBCheckModel *)cell.model;
    if (!model) {
        return;
    }
    BOOL isExit = NO;
    NSArray<TBSectionModel *> * sections = self.tbTableView.data;
    for (TBSectionModel * section in sections) {
        if ([section.items containsObject:model]) {
            isExit = YES;
            break;
        }
    }
    if (!isExit) {
        return;
    }
    
    sections = self.tbTableView.data;
    for (TBSectionModel * section in sections) {
        for (TBCheckModel * item in section.items) {
            item.isCheck = [model.uid isEqualToString:item.uid];
        }
    }
    self.strSelectLanguage = model.code;
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tbTableView reloadData];
        [weakSelf updateRightBtn];
    });
}

#pragma mark - Private

- (void)updateRightBtn {
    SLanguage * language = [[SLanguage alloc] init];
    if ([self.strSelectLanguage isEqualToString:[language getAppCurrentLanguage]]) {
        [self.btnRight setTitleColor:[UIColor colorWithRed:255.0f / 255.0f green:140.0f / 255.0f blue:0.0f / 255.0f alpha:0.3f] forState:UIControlStateNormal];
        [self.btnRight setTitleColor:[UIColor colorWithRed:255.0f / 255.0f green:140.0f / 255.0f blue:0.0f / 255.0f alpha:0.3f] forState:UIControlStateHighlighted];
    }else {
        [self.btnRight setTitleColor:[UIColor colorWithRed:255.0f / 255.0f green:140.0f / 255.0f blue:0.0f / 255.0f alpha:1.0f] forState:UIControlStateNormal];
    }
}

- (void)updateLanguage:(SButton *)sender {
    sender.backgroundColor = [UIColor randomColor];
    
    SLanguage * language = [[SLanguage alloc] init];
    if ([self.strSelectLanguage isEqualToString:[language getAppCurrentLanguage]]) {
        return;
    }
    
    if ([language setAppCurrentLanguage:self.strSelectLanguage]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
        SPostNotification(kNoticeSwitchLanguage);
    }
}

@end
