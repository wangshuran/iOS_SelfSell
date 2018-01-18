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
        _tbTableView.isEnableFooter = NO;
        _tbTableView.isEnableHeader = NO;
    }
    
    return _tbTableView;
}

- (SButton *)btnRight {
    if (!_btnRight) {
        _btnRight = [[SButton alloc] init];
        _btnRight.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
        _btnRight.backgroundColor = [UIColor randomColor];
        [_btnRight addTarget:self action:@selector(updateLanguage:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnRight;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.tbTableView];
    [self updateRightItem];
    
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
    TBCheckModel * model = notification.object;
    if (!model) {
        return;
    }
    
    NSArray<TBSectionModel *> * sections = self.tbTableView.data;
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

- (void)updateRightItem {
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc] initWithCustomView:self.btnRight];
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = 15.0f;//间隔作用
    
    self.navigationItem.rightBarButtonItems = @[rightItem, spaceItem];
}

- (void)updateRightBtn {
    self.btnRight.backgroundColor = [UIColor randomColor];
}

- (void)updateLanguage:(SButton *)sender {
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
