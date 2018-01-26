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
#import "SRewardRankingCell.h"

@interface SRewardController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SNavigationBar * navigationBar;

@property (nonatomic, strong) SScrollView * scrollView;

@property (nonatomic, strong) SView * scrollContainer;

@property (nonatomic, strong) SView * vContent0;

@property (nonatomic, strong) SView * vContent0Container;

@property (nonatomic, strong) SImageView * imgContent01;

@property (nonatomic, strong) SImageView * imgContent02;

@property (nonatomic, strong) SImageView * imgContent03;

@property (nonatomic, strong) SImageView * imgContent04;

@property (nonatomic, strong) SImageView * imgContent05;

@property (nonatomic, strong) SLabel * lb01;

@property (nonatomic, strong) SLabel * lb02;

@property (nonatomic, strong) SLabel * lb03;

@property (nonatomic, strong) SView * vContent1;

@property (nonatomic, strong) SView * vContent1Container;

@property (nonatomic, strong) SRewardRankingCell * rewardRankingCell01;

@property (nonatomic, strong) SRewardRankingCell * rewardRankingCell02;

@property (nonatomic, strong) SRewardRankingCell * rewardRankingCell03;

@property (nonatomic, strong) SView * vContent2;

@property (nonatomic, strong) SView * vContent2Container;

@property (nonatomic, strong) SButton * btnRecommendCode;

@property (nonatomic, strong) SButton * btnShare;

@property (nonatomic, strong) SView * vContent3;

@property (nonatomic, strong) SButton * btnRecommendFriend;

@property (nonatomic, strong) SImageView * imgRecommendFriend;

@property (nonatomic, strong) SLabel * lbRecommendFriend;

@property (nonatomic, strong) SButton * btnRewardMoney;

@property (nonatomic, strong) SImageView * imgRewardMoney;

@property (nonatomic, strong) SLabel * lbRewardMoney;

@property (nonatomic, strong) SView * vContent4;

@property (nonatomic, strong) SButton * btnRewardPlan;

@end

@implementation SRewardController

#pragma mark - Interface

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
        _scrollView.backgroundColor = [kColorDarkGray alpha:0.1f];
        _scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf loadData];
        }];
        [_scrollView addSubview:self.vContent0Container];
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

- (SView *)vContent0Container {
    if (!_vContent0Container) {
        _vContent0Container = [[SView alloc] init];
        _vContent0Container.backgroundColor = [kColorBlack alpha:0.8f];
    }

    return _vContent0Container;
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
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.8f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _lb01 = [[SLabel alloc] init];
        _lb01.text = text;
        _lb01.textAlignment = NSTextAlignmentCenter;
        _lb01.numberOfLines = 2;
        _lb01.attributedText = attributedText;
    }
    
    return _lb01;
}

- (SLabel *)lb02 {
    if (!_lb02) {
        NSString * textPre = SLocal(@"reward_buzhou2");
        NSString * textSuf = SLocal(@"reward_yaoqinghaoyou");
        NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.8f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _lb02 = [[SLabel alloc] init];
        _lb02.textAlignment = NSTextAlignmentCenter;
        _lb02.numberOfLines = 2;
        _lb02.attributedText = attributedText;
    }
    
    return _lb02;
}

- (SLabel *)lb03 {
    if (!_lb03) {
        NSString * textPre = SLocal(@"reward_buzhou3");
        NSString * textSuf = SLocal(@"reward_dedaojiangli");
        NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorLightGray alpha:0.8f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _lb03 = [[SLabel alloc] init];
        _lb03.textAlignment = NSTextAlignmentCenter;
        _lb03.numberOfLines = 2;
        _lb03.attributedText = attributedText;
    }
    
    return _lb03;
}

- (SView *)vContent1 {
    if (!_vContent1) {
        _vContent1 = [[SView alloc] init];
        _vContent1.backgroundColor = [kColorDarkGray alpha:0.1f];
        [_vContent1 addSubview:self.vContent1Container];
    }
    
    return _vContent1;
}

- (SView *)vContent1Container {
    if (!_vContent1Container) {
        _vContent1Container = [[SView alloc] init];
        _vContent1Container.layer.cornerRadius = 5.0f;
        _vContent1Container.layer.masksToBounds = YES;
        _vContent1Container.backgroundColor = kColorLightGray;
        [_vContent1Container addSubview:self.rewardRankingCell01];
        [_vContent1Container addSubview:self.rewardRankingCell02];
        [_vContent1Container addSubview:self.rewardRankingCell03];
    }
    
    return _vContent1Container;
}

- (SRewardRankingCell *)rewardRankingCell01 {
    if (!_rewardRankingCell01) {
        _rewardRankingCell01 = [[SRewardRankingCell alloc] init];
    }
    
    return _rewardRankingCell01;
}

- (SRewardRankingCell *)rewardRankingCell02 {
    if (!_rewardRankingCell02) {
        _rewardRankingCell02 = [[SRewardRankingCell alloc] init];
    }
    
    return _rewardRankingCell02;
}

- (SRewardRankingCell *)rewardRankingCell03 {
    if (!_rewardRankingCell03) {
        _rewardRankingCell03 = [[SRewardRankingCell alloc] init];
    }
    
    return _rewardRankingCell03;
}

- (SView *)vContent2 {
    if (!_vContent2) {
        _vContent2 = [[SView alloc] init];
        _vContent2.backgroundColor = [kColorDarkGray alpha:0.1f];
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
        [_vContent2Container addSubview:self.btnRecommendCode];
        [_vContent2Container addSubview:self.btnShare];
    }
    
    return _vContent2Container;
}

- (SButton *)btnRecommendCode {
    if (!_btnRecommendCode) {
        __weak typeof(self) weakSelf = self;
        NSString * textPre = SLocal(@"reward_wodetuijianma");
        NSString * textMid = [AppContext sharedAppContext].accountModel.inviteCode;
        NSString * textSuf = SLocal(@"reward_fuzhi");
        NSString * text = [NSString stringWithFormat:@"%@ %@ %@", textPre, textMid, textSuf];
        NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorDarkGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorOrange, NSForegroundColorAttributeName, [LFont bold_25], NSFontAttributeName, nil] range:[text rangeOfString:textMid]];
        [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorDarkGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
        _btnRecommendCode = [[SButton alloc] init];
        _btnRecommendCode.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_btnRecommendCode setAttributedTitle:attributedText forState:UIControlStateNormal];
        [[_btnRecommendCode rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            UIPasteboard * pasteboard = [UIPasteboard generalPasteboard];
            pasteboard.string = [AppContext sharedAppContext].accountModel.inviteCode;
            [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:SLocal(@"google_fuzhidao")];
        }];
    }
    
    return _btnRecommendCode;
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
        _vContent3.backgroundColor = [kColorDarkGray alpha:0.1f];
        [_vContent3 addSubview:self.btnRecommendFriend];
        [_vContent3 addSubview:self.btnRewardMoney];
    }
    
    return _vContent3;
}

- (SButton *)btnRecommendFriend {
    if (!_btnRecommendFriend) {
        _btnRecommendFriend = [[SButton alloc] init];
        _btnRecommendFriend.layer.cornerRadius = 5.0f;
        _btnRecommendFriend.layer.masksToBounds = YES;
        _btnRecommendFriend.backgroundColor = kColorLightGray;
        [_btnRecommendFriend addSubview:self.imgRecommendFriend];
        [_btnRecommendFriend addSubview:self.lbRecommendFriend];
    }
    
    return _btnRecommendFriend;
}

- (SImageView *)imgRecommendFriend {
    if (!_imgRecommendFriend) {
        _imgRecommendFriend = [[SImageView alloc] init];
        _imgRecommendFriend.image = [UIImage imageNamed:@"reward_people"];
        _imgRecommendFriend.contentMode = UIViewContentModeCenter;
    }
    
    return _imgRecommendFriend;
}

- (SLabel *)lbRecommendFriend {
    if (!_lbRecommendFriend) {
        _lbRecommendFriend = [[SLabel alloc] init];
        _lbRecommendFriend.numberOfLines = 2;
        [self updateRecommendFriend:@"0"];
    }
    
    return _lbRecommendFriend;
}

- (SButton *)btnRewardMoney {
    if (!_btnRewardMoney) {
        _btnRewardMoney = [[SButton alloc] init];
        _btnRewardMoney.layer.cornerRadius = 5.0f;
        _btnRewardMoney.layer.masksToBounds = YES;
        _btnRewardMoney.backgroundColor = kColorLightGray;
        [_btnRewardMoney addSubview:self.imgRewardMoney];
        [_btnRewardMoney addSubview:self.lbRewardMoney];
    }
    
    return _btnRewardMoney;
}

- (SImageView *)imgRewardMoney {
    if (!_imgRewardMoney) {
        _imgRewardMoney = [[SImageView alloc] init];
        _imgRewardMoney.image = [UIImage imageNamed:@"reward_finace"];
        _imgRewardMoney.contentMode = UIViewContentModeCenter;
    }
    
    return _imgRewardMoney;
}

- (SLabel *)lbRewardMoney {
    if (!_lbRewardMoney) {
        _lbRewardMoney = [[SLabel alloc] init];
        _lbRewardMoney.numberOfLines = 2;
        [self updateRewardMoney:@"0"];
    }
    
    return _lbRewardMoney;
}

- (SView *)vContent4 {
    if (!_vContent4) {
        _vContent4 = [[SView alloc] init];
        _vContent4.backgroundColor = [kColorDarkGray alpha:0.1f];
        [_vContent4 addSubview:self.btnRewardPlan];
    }
    
    return _vContent4;
}

- (SButton *)btnRewardPlan {
    if (!_btnRewardPlan) {
        _btnRewardPlan = [[SButton alloc] init];
        _btnRewardPlan.backgroundColor = kColorLightGray;
        [_btnRewardPlan setTitleColor:kColorDarkGray forState:UIControlStateNormal];
        [_btnRewardPlan setTitle:SLocal(@"reward_jianglijihua") forState:UIControlStateNormal];
    }
    
    return _btnRewardPlan;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.navigationBar];
    [self.view addSubview:self.scrollView];
    CGFloat navHeight = isIPhoneX ? 84.0f : 64.0f;
    CGFloat width = CGRectGetWidth(self.view.bounds);
    CGFloat height = CGRectGetHeight(self.view.bounds);
    
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
        make.height.mas_equalTo(170.0f);
    }];
    [self.vContent0Container mas_updateConstraints:^(MASConstraintMaker * make) {
        make.bottom.mas_equalTo(weakSelf.scrollView.mas_top);
        make.left.right.mas_equalTo(weakSelf.scrollView);
        make.height.mas_equalTo(height);
    }];
    [self.imgContent01 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.height.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.right.mas_equalTo(weakSelf.imgContent02.mas_left).mas_offset(-10.0f);
    }];
    [self.imgContent02 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.height.mas_equalTo(20.0f);
        make.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.right.mas_equalTo(weakSelf.imgContent03.mas_left).mas_offset(-10.0f);
    }];
    [self.imgContent03 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.height.width.mas_equalTo(50.0f);
        make.top.mas_equalTo(weakSelf.vContent0).mas_offset(10.0f);
        make.centerX.mas_equalTo(weakSelf.vContent0);
    }];
    [self.imgContent04 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.height.mas_equalTo(20.0f);
        make.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.left.mas_equalTo(weakSelf.imgContent03.mas_right).mas_offset(10.0f);
    }];
    [self.imgContent05 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.height.width.mas_equalTo(50.0f);
        make.centerY.mas_equalTo(weakSelf.imgContent03);
        make.left.mas_equalTo(weakSelf.imgContent04.mas_right).mas_offset(10.0f);
    }];
    [self.lb01 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.imgContent01.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.imgContent01);
        make.height.mas_equalTo(50.0f);
        make.width.mas_equalTo(100.0f);
    }];
    [self.lb02 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.imgContent03.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.imgContent03);
        make.height.mas_equalTo(50.0f);
        make.width.mas_equalTo(100.0f);
    }];
    [self.lb03 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.imgContent05.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.imgContent05);
        make.height.mas_equalTo(50.0f);
        make.width.mas_equalTo(100.0f);
    }];
    [self.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(145.0f);
    }];
    [self.vContent1Container mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent1).mas_offset(-40.0f);
        make.left.mas_equalTo(weakSelf.vContent1).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.vContent1).mas_offset(-10.0f);
        make.height.mas_equalTo(180.0f);
    }];
    [self.rewardRankingCell01 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent1Container);
        make.left.right.mas_equalTo(weakSelf.vContent1Container);
        make.height.mas_equalTo(60.0f);
    }];
    [self.rewardRankingCell02 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.rewardRankingCell01.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.vContent1Container);
        make.height.mas_equalTo(60.0f);
    }];
    [self.rewardRankingCell03 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.rewardRankingCell02.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.vContent1Container);
        make.height.mas_equalTo(60.0f);
    }];
    [self.vContent2 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent1.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(70.0f);
    }];
    [self.vContent2Container mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent2).mas_offset(5.0f);
        make.bottom.mas_equalTo(weakSelf.vContent2).mas_offset(-5.0f);
        make.left.mas_equalTo(weakSelf.vContent2).mas_offset(10.0f);
        make.right.mas_equalTo(weakSelf.vContent2).mas_offset(-10.0f);
    }];
    [self.btnRecommendCode mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.mas_equalTo(weakSelf.vContent2Container).mas_offset(10.0f);
        make.top.mas_equalTo(weakSelf.vContent2Container).mas_offset(5.0f);
        make.bottom.mas_equalTo(weakSelf.vContent2Container).mas_offset(-5.0f);
        make.right.mas_equalTo(weakSelf.btnShare.mas_left);
    }];
    [self.btnShare mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent2Container).mas_offset(5.0f);
        make.bottom.mas_equalTo(weakSelf.vContent2Container).mas_offset(-5.0f);
        make.right.mas_equalTo(weakSelf.vContent2Container);
        make.width.mas_equalTo(weakSelf.vContent2Container.mas_height);
    }];
    [self.vContent3 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent2.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(weakSelf.scrollContainer.mas_width).multipliedBy(0.5f);
    }];
    [self.btnRecommendFriend mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent3.mas_top).mas_offset(5.0f);
        make.bottom.mas_equalTo(weakSelf.vContent3.mas_bottom).mas_equalTo(-5.0f);
        make.left.mas_equalTo(weakSelf.vContent3).mas_offset(10.0f);
        make.width.mas_equalTo(weakSelf.vContent3.mas_width).multipliedBy(0.5f).mas_equalTo(-15.0f);
    }];
    [self.imgRecommendFriend mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(width / 8.0f);
        make.left.mas_equalTo(width / 8.0f);
        make.height.width.mas_equalTo(30.0f);
    }];
    [self.lbRecommendFriend mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.imgRecommendFriend.mas_bottom).mas_offset(5.0f);
        make.left.mas_equalTo(weakSelf.imgRecommendFriend.mas_left);
        make.right.mas_equalTo(weakSelf.btnRecommendFriend).mas_offset(-10.0f);
        make.height.mas_equalTo(60.0f);
    }];
    [self.btnRewardMoney mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent3.mas_top).mas_offset(5.0f);
        make.bottom.mas_equalTo(weakSelf.vContent3.mas_bottom).mas_equalTo(-5.0f);
        make.right.mas_equalTo(weakSelf.vContent3).mas_offset(-10.0f);
        make.width.mas_equalTo(weakSelf.vContent3.mas_width).multipliedBy(0.5f).mas_offset(-15.0f);
    }];
    [self.imgRewardMoney mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(width / 8.0f);
        make.left.mas_equalTo(width / 8.0f);
        make.height.width.mas_equalTo(30.0f);
    }];
    [self.lbRewardMoney mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.imgRewardMoney.mas_bottom).mas_offset(5.0f);
        make.left.mas_equalTo(weakSelf.imgRewardMoney.mas_left);
        make.right.mas_equalTo(weakSelf.btnRewardMoney).mas_offset(-10.0f);
        make.height.mas_equalTo(60.0f);
    }];
    [self.vContent4 mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent3.mas_bottom);
        make.left.right.mas_equalTo(weakSelf.scrollContainer);
        make.height.mas_equalTo(65.0f);
    }];
    [self.btnRewardPlan mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.vContent4).mas_offset(5.0f);
        make.bottom.left.right.mas_equalTo(weakSelf.vContent4);
    }];
    // 设置过渡视图的底边距（此设置将影响到scrollView的contentSize）
    [self.scrollContainer mas_makeConstraints:^(MASConstraintMaker * make) {
        make.bottom.mas_equalTo(weakSelf.vContent4.mas_bottom);
    }];
    [self.scrollView sendSubviewToBack:self.vContent0Container];
}

#pragma mark - UIScrollViewDelegate

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.frame.size.height) {
//        scrollView.contentOffset = CGPointMake(0.0f, scrollView.contentSize.height - scrollView.frame.size.height);
//        return;
//    }
//}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    self.view.backgroundColor = kColorLightGray;
    [self loadData];
}

#pragma mark - Private

- (void)loadData {
    __weak typeof(self) weakSelf = self;
    SRewardRequest * request = [[SRewardRequest alloc] init];
    request.id = [AppContext sharedAppContext].accountModel.id;
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        if (!response.status) {
            [weakSelf.scrollView.mj_header endRefreshing];
            [MBProgressHUD showTitleToView:weakSelf.view postion:NHHUDPostionCenten title:response.msg];
            return;
        }
        SRewardResponse * model = (SRewardResponse *)response;
        [weakSelf updateRecommendFriend:model.inviteNum];
        [weakSelf updateRewardMoney:model.reward];
        NSArray<SRewardRankingModel *> * models = model.rewardRankList;
        if (models.count > 2) {
            SRewardRankingModel * model1 = [models objectAtIndex:0];
            SRewardRankingModel * model2 = [models objectAtIndex:1];
            SRewardRankingModel * model3 = [models objectAtIndex:2];
            model1.imageName = @"reward_01";
            model2.imageName = @"reward_02";
            model3.imageName = @"reward_03";
            weakSelf.rewardRankingCell01.model = model1;
            weakSelf.rewardRankingCell02.model = model2;
            weakSelf.rewardRankingCell03.model = model3;
            [weakSelf.vContent1 addSubview:weakSelf.vContent1Container];
            [weakSelf.vContent1Container addSubview:weakSelf.rewardRankingCell01];
            [weakSelf.vContent1Container addSubview:weakSelf.rewardRankingCell02];
            [weakSelf.vContent1Container addSubview:weakSelf.rewardRankingCell03];
            [weakSelf.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.scrollContainer);
                make.height.mas_equalTo(145.0f);
            }];
            [self.vContent1Container mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent1).mas_offset(-40.0f);
                make.left.mas_equalTo(weakSelf.vContent1).mas_offset(10.0f);
                make.right.mas_equalTo(weakSelf.vContent1).mas_offset(-10.0f);
                make.height.mas_equalTo(180.0f);
            }];
            [self.rewardRankingCell01 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent1Container);
                make.left.right.mas_equalTo(weakSelf.vContent1Container);
                make.height.mas_equalTo(60.0f);
            }];
            [self.rewardRankingCell02 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.rewardRankingCell01.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.vContent1Container);
                make.height.mas_equalTo(60.0f);
            }];
            [self.rewardRankingCell03 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.rewardRankingCell02.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.vContent1Container);
                make.height.mas_equalTo(60.0f);
            }];
        }else if (models.count == 2) {
            SRewardRankingModel * model1 = [models objectAtIndex:0];
            SRewardRankingModel * model2 = [models objectAtIndex:1];
            model1.imageName = @"reward_01";
            model2.imageName = @"reward_02";
            weakSelf.rewardRankingCell01.model = model1;
            weakSelf.rewardRankingCell02.model = model2;
            [weakSelf.vContent1 addSubview:weakSelf.vContent1Container];
            [weakSelf.vContent1Container addSubview:weakSelf.rewardRankingCell01];
            [weakSelf.vContent1Container addSubview:weakSelf.rewardRankingCell02];
            [weakSelf.rewardRankingCell03 removeFromSuperview];
            [weakSelf.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.scrollContainer);
                make.height.mas_equalTo(85.0f);
            }];
            [self.vContent1Container mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent1).mas_offset(-40.0f);
                make.left.mas_equalTo(weakSelf.vContent1).mas_offset(10.0f);
                make.right.mas_equalTo(weakSelf.vContent1).mas_offset(-10.0f);
                make.height.mas_equalTo(120.0f);
            }];
            [self.rewardRankingCell01 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent1Container);
                make.left.right.mas_equalTo(weakSelf.vContent1Container);
                make.height.mas_equalTo(60.0f);
            }];
            [self.rewardRankingCell02 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.rewardRankingCell01.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.vContent1Container);
                make.height.mas_equalTo(60.0f);
            }];
        }else if (models.count == 1) {
            SRewardRankingModel * model1 = [models objectAtIndex:0];
            model1.imageName = @"reward_01";
            weakSelf.rewardRankingCell01.model = model1;
            [weakSelf.vContent1 addSubview:weakSelf.vContent1Container];
            [weakSelf.vContent1Container addSubview:weakSelf.rewardRankingCell01];
            [weakSelf.rewardRankingCell02 removeFromSuperview];
            [weakSelf.rewardRankingCell03 removeFromSuperview];
            [weakSelf.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.scrollContainer);
                make.height.mas_equalTo(25.0f);
            }];
            [self.vContent1Container mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent1).mas_offset(-40.0f);
                make.left.mas_equalTo(weakSelf.vContent1).mas_offset(10.0f);
                make.right.mas_equalTo(weakSelf.vContent1).mas_offset(-10.0f);
                make.height.mas_equalTo(60.0f);
            }];
            [self.rewardRankingCell01 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent1Container);
                make.left.right.mas_equalTo(weakSelf.vContent1Container);
                make.height.mas_equalTo(60.0f);
            }];
        }else {
            [weakSelf.vContent1Container removeFromSuperview];
            [self.vContent1 mas_updateConstraints:^(MASConstraintMaker * make) {
                make.top.mas_equalTo(weakSelf.vContent0.mas_bottom);
                make.left.right.mas_equalTo(weakSelf.scrollContainer);
                make.height.mas_equalTo(5.0f);
            }];
        }
        [weakSelf.scrollView.mj_header endRefreshing];
    }];
}

- (void)updateRecommendFriend:(NSString *)num {
    if ([NSString isNullOrEmpty:num]) {
        num = @"0";
    }
    NSString * textPre = SLocal(@"reward_tuijianhaoyoushuliang");
    NSString * textSuf = num;
    NSString * text = [NSString stringWithFormat:@"%@\n%@", textPre, textSuf];
    NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorDarkGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorBlack, NSForegroundColorAttributeName, [LFont thin_25], NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
    self.lbRecommendFriend.attributedText = attributedText;
}

- (void)updateRewardMoney:(NSString *)money {
    if ([NSString isNullOrEmpty:money]) {
        money = @"0";
    }
    NSString * textPre = SLocal(@"reward_jianglijie");
    NSString * textMid = money;
    NSString * textSuf = @"SSC";
    NSString * text = [NSString stringWithFormat:@"%@\n%@%@", textPre, textMid, textSuf];
    NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[kColorDarkGray alpha:0.5f], NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorBlack, NSForegroundColorAttributeName, [LFont thin_25], NSFontAttributeName, nil] range:[text rangeOfString:textMid]];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorBlack, NSForegroundColorAttributeName, kLbFontSmaller, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
    self.lbRewardMoney.attributedText = attributedText;
    
}

@end
