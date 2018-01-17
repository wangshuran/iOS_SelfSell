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

@interface SLanguageController ()

@property (nonatomic, strong) SLanguageService * languageService;

@property (nonatomic, strong) TBTableView * tbTableView;

@end

@implementation SLanguageController

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
    
    
    [self.languageService execute:[LCmdTransfer cmd:LCmdGetAll value:nil]];
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
        
    }
}

@end
