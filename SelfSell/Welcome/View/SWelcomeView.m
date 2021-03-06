//
//  SWelcomeView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SWelcomeView.h"

@interface SWelcomeView()

@property (nonatomic, strong) SImageView * imgLogo;

@end

@implementation SWelcomeView

#pragma mark - Interface

- (SImageView *)imgLogo {
    if (!_imgLogo) {
        _imgLogo = [[SImageView alloc] init];
    }
    
    return _imgLogo;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (self.block) {
        self.block();
    }
}

- (void)setModel:(SWelcomeModel *)model {
    _model = model;
    [self.imgLogo sd_setImageWithURL:[NSURL URLWithString:model.imgUrl]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [self addSubview:self.imgLogo];
    [self.imgLogo mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf);
    }];
}

@end
