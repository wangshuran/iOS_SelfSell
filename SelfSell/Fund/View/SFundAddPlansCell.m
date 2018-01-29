//
//  SFundAddPlansCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundAddPlansCell.h"
#import <SDWebImage/UIButton+WebCache.h>

@interface SFundAddPlansCell()

@property (nonatomic, strong) SView * vBackground;

@property (nonatomic, strong) SScrollView * scrollView;

@property (nonatomic, strong) SView * scrollViewContainer;

@property (nonatomic, strong) SButton * btnAdd;

@property (nonatomic, assign) CGFloat planWidth;

@end

@implementation SFundAddPlansCell

#pragma mark - Interface

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.vBackground addSubview:self.scrollView];
    [self.vBackground addSubview:self.btnAdd];
    [self.contentView addSubview:self.vBackground];
    CGFloat btnAddheight = 50.0f;
    [LTest randomColorView:self];
    
    __weak typeof(self) weakSelf = self;
    [self.vBackground mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.mas_equalTo(weakSelf.contentView).mas_offset(10.0f);
        make.bottom.mas_equalTo(weakSelf.contentView);
        make.left.mas_equalTo(weakSelf.contentView).mas_offset(10.0f);
        make.right.right.mas_equalTo(weakSelf.contentView).mas_offset(-10.0f);
        make.height.mas_greaterThanOrEqualTo(weakSelf.planWidth + btnAddheight);
    }];
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.left.right.mas_equalTo(weakSelf.vBackground);
        make.bottom.mas_equalTo(weakSelf.btnAdd.mas_top);
        make.height.mas_equalTo(weakSelf.planWidth);
    }];
    [self.btnAdd mas_updateConstraints:^(MASConstraintMaker * make) {
        make.left.right.mas_equalTo(weakSelf.vBackground);
        make.height.mas_equalTo(btnAddheight);
    }];
    
    
    return self;
}

- (void)setModel:(TBModel *)model {
    [super setModel:model];
    
    SFundAddPlansModel * addPlansModel = (SFundAddPlansModel *)model;
    NSArray<SFundAddPlanModel *> * plans = addPlansModel.plans;
    for (NSUInteger i = 0; i < plans.count; i++) {
        SFundAddPlanModel * plan = [plans objectAtIndex:i];
        
        
        SButton * cell = [[SButton alloc] init];
        cell.frame = CGRectMake(i * self.planWidth, 0.0f, self.planWidth, self.planWidth);
        cell.tag = i;
        //cell setAttributedTitle:<#(nullable NSAttributedString *)#> forState:<#(UIControlState)#>
        [cell sd_setImageWithURL:[NSURL URLWithString:plan.iconUrl] forState:UIControlStateNormal];
        [self.scrollView addSubview:cell];
    }
    self.scrollView.contentSize = CGSizeMake(self.planWidth * plans.count, self.planWidth);
}

- (SView *)vBackground {
    if (!_vBackground) {
        _vBackground = [[SView alloc] init];
        _vBackground.backgroundColor = kColorWhite250;
    }
    
    return _vBackground;
}

- (SScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[SScrollView alloc] init];
    }
    
    return _scrollView;
}

- (SView *)scrollViewContainer {
    if (!_scrollViewContainer) {
        _scrollViewContainer = [[SView alloc] init];
    }
    
    return _scrollViewContainer;
}

- (SButton *)btnAdd {
    if (!_btnAdd) {
        _btnAdd = [[SButton alloc] init];
        _btnAdd.layer.cornerRadius = 5.0f;
        _btnAdd.layer.masksToBounds = YES;
        _btnAdd.layer.borderColor = kColorOrange.CGColor;
        _btnAdd.layer.borderWidth = 1.0f;
        [_btnAdd setTitle:SLocal(@"fund_jiaruchiyoujihua") forState:UIControlStateNormal];
        [_btnAdd setTitleColor:kColorOrange forState:UIControlStateNormal];
    }
    
    return _btnAdd;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.planWidth = CGRectGetWidth(UIScreen.mainScreen.bounds) / 3.0f;
}

@end
