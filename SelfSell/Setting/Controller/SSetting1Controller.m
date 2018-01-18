//
//  SSetting1Controller.m
//  SelfSell
//
//  Created by liqiang on 2018/1/16.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SSetting1Controller.h"
#import "SSettingService.h"
#import "TBTableView.h"

@interface SSetting1Controller ()

@property (nonatomic, strong) SSettingService * settingService;

@property (nonatomic, strong) TBTableView * tbTableView;

@end

@implementation SSetting1Controller

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)title {
    return SLocal(@"setting1_title");
}

- (SSettingService *)settingService {
    if (!_settingService) {
        __weak typeof(self) weakSelf = self;
        _settingService = [[SSettingService alloc] init];
        [_settingService subscribeNext:LCmdGetSetting1 nextBlock:^(LCmdTransfer * transfer) {
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
        _tbTableView.isEnableHeader = NO;
        _tbTableView.isEnableFooter = NO;
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
    
    
    [self.settingService execute:[LCmdTransfer cmd:LCmdGetSetting1 value:nil]];
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
    
    if (model.destVCClass) {
        [self push:[[model.destVCClass alloc] init]];
        
        return;
    }
    
}

@end
