//
//  SSetting0Controller.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSetting0Controller.h"
#import "SSettingService.h"
#import "TBTableView.h"

@interface SSetting0Controller ()

@property (nonatomic, strong) SSettingService * settingService;

@property (nonatomic, strong) TBTableView * tbTableView;

@end

@implementation SSetting0Controller

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)title {
    return SLocal(@"setting0_title");
}

- (SSettingService *)settingService {
    if (!_settingService) {
        __weak typeof(self) weakSelf = self;
        _settingService = [[SSettingService alloc] init];
        [_settingService subscribeNext:LCmdGetSetting0 nextBlock:^(LCmdTransfer * transfer) {
            NSArray<TBSectionModel *> * model = transfer.value;
            
            weakSelf.tbTableView.data = model;
            [weakSelf.tbTableView reloadData];
        }];
    }
    
    return _settingService;
}

- (TBTableView *)tbTableView {
    if (!_tbTableView) {
        _tbTableView = [[TBTableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    
    return _tbTableView;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.tbTableView];
    
    [self.tbTableView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    
    
    [self.settingService execute:[LCmdTransfer cmd:LCmdGetSetting0 value:nil]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    SAddObsver(noticeCellSelect:, kNoticeCellSelect)
}

#pragma mark - NSNotification

- (void)noticeCellSelect:(NSNotification *)notification {
    TBModel * model = notification.object;
    if (!model) {
        return;
    }
    
    if ([model.uid isEqualToString:@"wodetuijianma"]) {
        
    }else if ([model.uid isEqualToString:@"gugeyanzheng"]) {
        
    }else if ([model.uid isEqualToString:@"shezhi"]) {
        [self push:[[NSClassFromString(@"SSetting1Controller") alloc] init]];
    }else if ([model.uid isEqualToString:@"tuichu"]) {
        
    }
}

@end
