//
//  THeaderView.m
//  SelfSell
//
//  Created by liqiang on 2018/1/19.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "THeaderView.h"

@implementation THeaderView

#pragma mark - Interface

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    self.contentView.backgroundColor = kColorWhite250;
    
    return self;
}

@end
