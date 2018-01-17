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
        [weakSelf updateRightItem];
    });
}

#pragma mark - Private

- (void)updateRightItem {
    //UIImageView * saveImgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    //saveImgv.image=[UIImage imageNamed:@"保存.png"];
    
    //UIImageView * shareImgv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    //shareImgv.image = [UIImage imageNamed:@"分享.png"];
    
    //SButton * saveImgv = [[SButton alloc] init];
    UIButton * saveImgv = [[UIButton alloc] init];
    saveImgv.frame = CGRectMake(0, 0, 22, 22);
    saveImgv.backgroundColor = [UIColor randomColor];
    [saveImgv addTarget:self action:@selector(fdsfd) forControlEvents:UIControlEventTouchUpInside];
    
    //SButton * shareImgv = [[SButton alloc] init];
    UIButton * shareImgv = [[UIButton alloc] init];
    shareImgv.frame = CGRectMake(0, 0, 22, 22);
    shareImgv.backgroundColor = [UIColor randomColor];
    [shareImgv addTarget:self action:@selector(fdsfd) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * saveBitem = [[UIBarButtonItem alloc] initWithCustomView:saveImgv];
    UIBarButtonItem * shareBitem = [[UIBarButtonItem alloc] initWithCustomView:shareImgv];
    UIBarButtonItem * spaceBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:@selector(fdsfd)];
    spaceBar.width = 15;//间隔作用
    
    self.navigationItem.rightBarButtonItems = @[shareBitem, spaceBar, saveBitem];
}

- (void)fdsfd {
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
