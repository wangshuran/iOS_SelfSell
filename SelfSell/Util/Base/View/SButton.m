//
//  SButton.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SButton.h"

@implementation SButton

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state {
    [super setTitleColor:color forState:state];
    
    if (state == UIControlStateNormal) {
        [self setTitleColor:[UIColor colorWithRed:[color getR] green:[color getG] blue:[color getB] alpha:[color getA] * 0.5f] forState:UIControlStateHighlighted];
    }
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.titleLabel.font = kBtnFontNormal;
}

@end
