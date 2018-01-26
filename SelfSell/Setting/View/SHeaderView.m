//
//  SHeaderView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/19.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SHeaderView.h"

@implementation SHeaderView

#pragma mark - Interface

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    self.contentView.backgroundColor = kColorWhite220;
    
    return self;
}

@end
