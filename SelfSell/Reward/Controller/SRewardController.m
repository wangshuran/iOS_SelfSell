//
//  SRewardController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRewardController.h"
#import "SRewardRequest.h"
#import "SNavigationBar.h"

@interface SRewardController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) SScrollView * scrollView;

@property (nonatomic, strong) SView * scrollContainer;

@property (nonatomic, strong) SView * vContent0;

@property (nonatomic, strong) SImageView * imgContent01;

@property (nonatomic, strong) SImageView * imgContent02;

@property (nonatomic, strong) SImageView * imgContent03;

@property (nonatomic, strong) SImageView * imgContent04;

@property (nonatomic, strong) SImageView * imgContent05;

@property (nonatomic, strong) SLabel * lb01;

@property (nonatomic, strong) SLabel * lb02;

@property (nonatomic, strong) SLabel * lb03;



@property (nonatomic, strong) SView * vContent1;

@property (nonatomic, strong) SView * vContent2;

@property (nonatomic, strong) SView * vContent2Container;

@property (nonatomic, strong) SLabel * lbRecommendCode;

@property (nonatomic, strong) SButton * btnCopy;

@property (nonatomic, strong) SButton * btnShare;

@property (nonatomic, strong) SView * vContent3;

@property (nonatomic, strong) SView * vContent4;

@end

@implementation SRewardController

#pragma mark - Interface
//reward_01
//reward_02
//reward_03
//
//
//
//
//
- (NSString *)title {
    return SLocal(@"reward_title");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (SNavigationBar *)navigationBar {
    if (!_navigationBar) {
        __weak typeof(self) weakSelf = self;
        _navigationBar = [[SNavigationBar alloc] init];
        _navigationBar.backgroundColor = [kColorBlack alpha:0.8f];
        [_navigationBar.btnLeft setImage:[UIImage imageNamed:@"common_fanhui_white"] forState:UIControlStateNormal];
        _navigationBar.lbTitle.text = self.title;
        _navigationBar.lbTitle.textColor = [UIColor whiteColor];
        [[_navigationBar.btnLeft rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf pop];
        }];
    }
    
    return _navigationBar;
}

- (SScrollView *)scrollView {
    if (!_scrollView) {
        __weak typeof(self) weakSelf = self;
        _scrollView = [[SScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [kColorBlack alpha:0.8f];
        _scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf.scrollView.mj_header endRefreshing];
        }];
        [_scrollView addSubview:self.scrollContainer];
    }
    
    return _scrollView;
}

- (SView *)scrollContainer {
    if (!_scrollContainer) {
        _scrollContainer = [[SView alloc] init];
        _scrollContainer.backgroundColor = kColorLightGray;
        [_scrollContainer addSubview:self.vContent0];
        [_scrollContainer addSubview:self.vContent1];
        [_scrollContainer addSubview:self.vContent2];
        [_scrollContainer addSubview:self.vContent3];
        [_scrollContainer addSubview:self.vContent4];
    }
    
    return _scrollContainer;
}

- (SView *)vContent0 {
    if (!_vContent0) {
        _vContent0 = [[SView alloc] init];
        _vContent0.backgroundColor = [kColorBlack alpha:0.8f];
        [_vContent0 addSubview:self.imgContent01];
        [_vContent0 addSubview:self.imgContent02];
        [_vContent0 addSubview:self.imgContent03];
        [_vContent0 addSubview:self.imgContent04];
        [_vContent0 addSubview:self.imgContent05];
        [_vContent0 addSubview:self.lb01];
        [_vContent0 addSubview:self.lb02];
        [_vContent0 addSubview:self.lb03];
    }
    
    return _vContent0;
}

- (SImageView *)imgContent01 {
    if (!_imgContent01) {
        _imgContent01 = [[SImageView alloc] init];
        _imgContent01.layer.cornerRadius = 25.0f;
        _imgContent01.layer.masksToBounds = YES;
        _imgContent01.layer.borderWidth = 1.0f;
        _imgContent01.layer.borderColor = kColorOrange.CGColor;
        _imgContent01.contentMode = UIViewContentModeCenter;
        _imgContent01.image = [UIImage imageNamed:@"reward_04"];
    }
    
    return _imgContent01;
}

- (SImageView *)imgContent02 {
    if (!_imgContent02) {
        _imgContent02 = [[SImageView alloc] init];
        _imgContent02.contentMode = UIViewContentModeCenter;
        _imgContent02.image = [UIImage imageNamed:@"reward_arrow"];
    }
    
    return _imgContent02;
}

- (SImageView *)imgContent03 {
    if (!_imgContent03) {
        _imgContent03 = [[SImageView alloc] init];
        _imgContent03.layer.cornerRadius = 25.0f;
        _imgContent03.layer.masksToBounds = YES;
        _imgContent03.layer.borderWidth = 1.0f;
        _imgContent03.layer.borderColor = kColorOrange.CGColor;
        _imgContent03.contentMode = UIViewContentModeCenter;
        _imgContent03.image = [UIImage imageNamed:@"reward_people"];
    }
    
    return _imgContent03;
}

- (SImageView *)imgContent04 {
    if (!_imgContent04) {
        _imgContent04 = [[SImageView alloc] init];
        _imgContent04.contentMode = UIViewContentModeCenter;
        _imgContent04.image = [UIImage imageNamed:@"reward_arrow"];
    }
    
    return _imgContent04;
}

- (SImageView *)imgContent05 {
    if (!_imgContent05) {
        _imgContent05 = [[SImageView alloc] init];
        _imgContent05.layer.cornerRadius = 25.0f;
        _imgContent05.layer.masksToBounds = YES;
        _imgContent05.layer.borderWidth = 1.0f;
        _imgContent05.layer.borderColor = kColorOrange.CGColor;
        _imgContent05.contentMode = UIViewContentModeCenter;
        _imgContent05.image = [UIImage imageNamed:@"reward_finace"];
    }
    
    return _imgContent05;
}

- (SLabel *)lb01 {
    if (!_lb01) {
        NSString * textPre = SLocal(@"reward_buzhou1");
        NSString * textSuf = SLocal(@"reward_huoqutuijianma");
        NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
        
        _lb01 = [[SLabel alloc] init];
        _lb01.text = text;
        _lb01.textAlignment = NSTextAlignmentCenter;
        _lb01.numberOfLines = 2;
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.8f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _lb01.attributedText = attributedText;
    }
    
    return _lb01;
}

- (SLabel *)lb02 {
    if (!_lb02) {
        NSString * textPre = SLocal(@"reward_buzhou2");
        NSString * textSuf = SLocal(@"reward_yaoqinghaoyou");
        NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
        
        _lb02 = [[SLabel alloc] init];
        _lb02.text = text;
        _lb02.textAlignment = NSTextAlignmentCenter;
        _lb02.numberOfLines = 2;
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.8f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _lb02.attributedText = attributedText;
    }
    
    return _lb02;
}

- (SLabel *)lb03 {
    if (!_lb03) {
        NSString * textPre = SLocal(@"reward_buzhou3");
        NSString * textSuf = SLocal(@"reward_dedaojiangli");
        NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
        
        _lb03 = [[SLabel alloc] init];
        _lb03.text = text;
        _lb03.textAlignment = NSTextAlignmentCenter;
        _lb03.numberOfLines = 2;
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.8f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _lb03.attributedText = attributedText;
    }
    
    return _lb03;
}

- (SView *)vContent1 {
    if (!_vContent1) {
        _vContent1 = [[SView alloc] init];
    }
    
    return _vContent1;
}

- (SView *)vContent2 {
    if (!_vContent2) {
        _vContent2 = [[SView alloc] init];
        [_vContent2 addSubview:self.vContent2Container];
    }
    
    return _vContent2;
}

- (SView *)vContent2Container {
    if (!_vContent2Container) {
        _vContent2Container = [[SView alloc] init];
        _vContent2Container.layer.cornerRadius = 5.0f;
        _vContent2Container.layer.masksToBounds = YES;
        _vContent2Container.backgroundColor = kColorLightGray;
        [_vContent2Container addSubview:self.lbRecommendCode];
        [_vContent2Container addSubview:self.btnCopy];
        [_vContent2Container addSubview:self.btnShare];
    }
    
    return _vContent2Container;
}

- (SLabel *)lbRecommendCode {
    if (!_lbRecommendCode) {
        _lbRecommendCode = [[SLabel alloc] init];
        _lbRecommendCode.text = SLocal(@"reward_wodetuijianma");
    }
    
    return _lbRecommendCode;
}

- (SButton *)btnCopy {
    if (!_btnCopy) {
        _btnCopy = [[SButton alloc] init];
    }
    
    return _btnCopy;
}

- (SButton *)btnShare {
    if (!_btnShare) {
        _btnShare = [[SButton alloc] init];
        [_btnShare setImage:[UIImage imageNamed:@"reward_share"] forState:UIControlStateNormal];
    }
    
    return _btnShare;
}

- (SView *)vContent3 {
    if (!_vContent3) {
        _vContent3 = [[SView alloc] init];
    }
    
    return _vContent3;
}

- (SView *)vContent4 {
    if (!_vContent4) {
        _vContent4 = [[SView alloc] init];
    }
    
    return _vContent4;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.scrollView];
    CGFloat navHeight = isIPhoneX ? 84.0f : 64.0f;
    
    [self.navigationBar mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.view);
        make.height.mas_equalTo(navHeight);
    }];
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.navigationBar.mas_bottom);
        make.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    //设置scrollView的子视图，即过渡视图contentSize，并设置其约束
    [self.scrollContainer mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.equalTo(weakSelf.scrollView).with.insets(UIEdgeInsetsZero);
        make.width.equalTo(weakSelf.scrollView);
    }];
    [self.vContent0 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(0.0f);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(200.0f);
    }];
    [self.imgContent01 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.right.mas_equalTo(weakSelf.imgContent02.mas_left).mas_offset(-10.0f);
    }];
    [self.imgContent02 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20.0f);
        make.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.right.mas_equalTo(weakSelf.imgContent03.mas_left).mas_offset(-10.0f);
    }];
    [self.imgContent03 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(50.0f);
        make.top.mas_equalTo(weakSelf.vContent0).mas_offset(10.0f);
        make.centerX.mas_equalTo(weakSelf.vContent0);
    }];
    [self.imgContent04 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(20.0f);
        make.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.left.mas_equalTo(weakSelf.imgContent03.mas_right).mas_offset(10.0f);
    }];
    [self.imgContent05 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.left.mas_equalTo(weakSelf.imgContent04.mas_right).mas_offset(10.0f);
    }];
    [self.lb01 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imgContent01.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.imgContent01);
        make.height.mas_equalTo(50.0f);
        make.width.mas_equalTo(100.0f);
    }];
    [self.lb02 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imgContent03.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.imgContent03);
        make.height.mas_equalTo(50.0f);
        make.width.mas_equalTo(100.0f);
    }];
    [self.lb03 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.imgContent05.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.imgContent05);
        make.height.mas_equalTo(50.0f);
        make.width.mas_equalTo(100.0f);
    }];
    
    
    
    
    
    
    
    [self.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    [self.vContent2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent1.mas_bottom).mas_offset(10.0f);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(50.0f);
    }];
    [self.vContent2Container mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(weakSelf.vContent2);
        make.left.mas_equalTo(weakSelf.vContent2).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.vContent2).mas_offset(-10.0f);
    }];
    [self.lbRecommendCode mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(weakSelf.vContent2Container).mas_offset(10.0f);
        make.top.bottom.mas_equalTo(weakSelf.vContent2Container);
        make.right.mas_equalTo(weakSelf.btnShare.mas_left);
    }];
//    [self.btnCopy mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.bottom.left.right.mas_equalTo(weakSelf.vContent2);
//    }];
    [self.btnShare mas_updateConstraints:^(MASConstraintMaker *make) {
        //make.right.mas_equalTo(weakSelf.vContent2Container).mas_offset(-10.0f);
        make.top.bottom.right.mas_equalTo(weakSelf.vContent2Container);
        make.width.mas_equalTo(weakSelf.vContent2Container.mas_height);
    }];
    
    
    [self.vContent3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent2.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    [self.vContent4 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent3.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(400.0f);
    }];
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [self.scrollContainer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.vContent4.mas_bottom);
    }];
    
    
    //[LTest randomColorView:self.scrollView];
    //[self.scrollView.mj_header beginRefreshing];
}

//reward_jiangli = "奖励";
//reward_ssc = "SSC";
// = "我的推荐码";
//reward_fuzhi = "复制";
//reward_tuijianhaoyoushuliang = "推荐好友数量";
//reward_jianglijie = "奖励金额";
//reward_jianglijihua = "奖励计划";

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height) {
        scrollView.contentOffset = CGPointMake(0.0f, scrollView.contentSize.height - scrollView.frame.size.height);
        return;
    }
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    __weak typeof(self) weakSelf = self;
    SRewardRequest * request = [[SRewardRequest alloc] init];
    request.id = [AppContext sharedAppContext].accountModel.id;
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        if (!response.status) {
            [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
            return;
        }
    }];
}

@end
