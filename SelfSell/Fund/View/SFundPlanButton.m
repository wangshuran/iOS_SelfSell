//
//  SFundPlanButton.m
//  SelfSell
//
//  Created by liqiang on 2018/1/29.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SFundPlanButton.h"

@implementation SFundPlanButton

#pragma mark - Interface

-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat height = CGRectGetHeight(self.bounds);
    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat imgHeight = 25.0f;
    CGFloat imgWidth = 25.0f;
    CGFloat titleHeight = CGRectGetHeight(self.titleLabel.bounds);
    CGFloat titleWidth = CGRectGetWidth(self.titleLabel.bounds);
    
    self.imageView.frame = CGRectMake((width - imgWidth) / 2.0f, height / 2.0f - imgHeight, imgWidth, imgHeight);
    self.titleLabel.frame = CGRectMake(0.0f, height / 2.0f, width, height / 2.0f);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.backgroundColor = kColorWhite255;
}

@end
