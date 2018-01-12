//
//  SAccountController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SAccountController.h"
#import "SSettingService.h"

@interface SAccountController ()

@property (nonatomic, strong) SSettingService * settingService;

@end

@implementation SAccountController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)title {
    return SLocal(@"account_title");
}

- (SSettingService *)settingService {
    if (!_settingService) {
        __weak typeof(self) weakSelf = self;
        _settingService = [[SSettingService alloc] init];
        [_settingService subscribeNext:LCmdGetAll nextBlock:^(LCmdTransfer * x) {
            NSLog(@"%@", x);
        }];
    }
    
    return _settingService;
}

#pragma mark - Interface

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    [self.settingService execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
}

@end
