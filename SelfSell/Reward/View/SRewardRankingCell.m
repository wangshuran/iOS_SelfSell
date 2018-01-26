//
//  SRewardRankingCell.m
//  SelfSell
//
//  Created by liqiang on 2018/1/26.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SRewardRankingCell.h"

@interface SRewardRankingCell()

@property (nonatomic, strong) SImageView * imgIco;

@property (nonatomic, strong) SLabel * lbEmail;

@property (nonatomic, strong) SLabel * lbReward;

@end

@implementation SRewardRankingCell

#pragma mark - Interface

- (void)setModel:(SRewardRankingModel *)model {
    _model = model;
    self.imgIco.image = [UIImage imageNamed:model.imageName];
    [self updateEmail:model.email];
    [self updateReward:model.reward];
}

- (SImageView *)imgIco {
    if (!_imgIco) {
        _imgIco = [[SImageView alloc] init];
        _imgIco.contentMode = UIViewContentModeCenter;
        _imgIco.image = [UIImage imageNamed:@"reward_01"];
    }
    
    return _imgIco;
}

- (SLabel *)lbEmail {
    if (!_lbEmail) {
        _lbEmail = [[SLabel alloc] init];
        _lbEmail.textAlignment = NSTextAlignmentLeft;
        _lbEmail.textColor = kColorWhite190;
        _lbEmail.font = kLbFontBigger;
        [self updateEmail:@"***@***.com"];
    }
    
    return _lbEmail;
}

- (SLabel *)lbReward {
    if (!_lbReward) {
        _lbReward = [[SLabel alloc] init];
        _lbReward.textAlignment = NSTextAlignmentRight;
        [self updateReward:@"0"];
    }
    
    return _lbReward;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self addSubview:self.imgIco];
    [self addSubview:self.lbEmail];
    [self addSubview:self.lbReward];
    [self.imgIco mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(weakSelf);
        make.left.mas_equalTo(weakSelf);
        make.width.mas_equalTo(weakSelf.mas_height);
    }];
    [self.lbEmail mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(weakSelf);
        make.left.mas_equalTo(weakSelf.imgIco.mas_right);
        make.right.mas_equalTo(weakSelf).mas_offset(-10.0f);
    }];
    [self.lbReward mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.mas_equalTo(weakSelf);
        make.left.mas_equalTo(weakSelf.imgIco.mas_right);
        make.right.mas_equalTo(weakSelf).mas_offset(-10.0f);
    }];
}

#pragma mark - Private

- (void)updateEmail:(NSString *)email {
    NSRange etRange = [email rangeOfString:@"@"];
    if (etRange.location == NSNotFound) {
        self.lbEmail.text = email;
    }else {
        NSString * name = [email substringToIndex:etRange.location];
        if ([NSString isNullOrEmpty:name]) {
            self.lbEmail.text = email;
        }else {
            if (name.length < 3) {
                while (name.length < 6) {
                    name = [name stringByAppendingString:@"*"];
                }
            }else {
                name = [[name substringToIndex:3] stringByAppendingString:@"***"];
            }
            NSString * type_suf = [email substringFromIndex:etRange.location];
            NSRange pointRange = [type_suf rangeOfString:@"."];
            if (pointRange.location == NSNotFound) {
                self.lbEmail.text = email;
            }else {
                NSString * suf = [type_suf substringFromIndex:pointRange.location];
                self.lbEmail.text = [NSString stringWithFormat:@"%@@***%@", name, suf];
            }
        }
    }
}

- (void)updateReward:(NSString *)reward {
    NSString * textPre = SLocal(@"reward_jiangli");
    NSString * textMid = reward;
    NSString * textSuf = @"SSC";
    NSString * text = [NSString stringWithFormat:@"%@ %@ %@", textPre, textMid, textSuf];
    NSMutableAttributedString * attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorWhite190, NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textPre]];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorWhite40, NSForegroundColorAttributeName, [LFont bold_20], NSFontAttributeName, nil] range:[text rangeOfString:textMid]];
    [attributedText addAttributes:[NSDictionary dictionaryWithObjectsAndKeys:kColorWhite190, NSForegroundColorAttributeName, kLbFontNormal, NSFontAttributeName, nil] range:[text rangeOfString:textSuf]];
    self.lbReward.attributedText = attributedText;
}

@end
