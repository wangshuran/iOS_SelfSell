//
//  SSetting0Controller.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SSetting0Controller.h"
#import "SSetting0Service.h"
#import "TBTableView.h"

@interface SSetting0Controller ()

@property (nonatomic, strong) SSetting0Service * setting0Service;

@property (nonatomic, strong) TBTableView * tbTableView;



@end

@implementation SSetting0Controller

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)title {
    return SLocal(@"setting_title");
}

- (SSetting0Service *)setting0Service {
    if (!_setting0Service) {
        __weak typeof(self) weakSelf = self;
        _setting0Service = [[SSetting0Service alloc] init];
        [_setting0Service subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * transfer) {
            NSArray<TBSectionModel *> * model = transfer.value;
            
            weakSelf.tbTableView.data = model;
            [weakSelf.tbTableView reloadData];
        }];
    }
    
    return _setting0Service;
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
    
    
    [self.setting0Service execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
}

#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];    
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
}

@end
