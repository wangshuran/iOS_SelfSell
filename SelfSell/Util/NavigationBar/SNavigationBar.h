//
//  SNavigationBar.h
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SView.h"

@interface SNavigationBar : SView

@property (nonatomic, strong) SView * vLeft;

@property (nonatomic, strong) SButton * btnLeft;

@property (nonatomic, strong) SView * vTitle;

@property (nonatomic, strong) SLabel * lbTitle;

@property (nonatomic, strong) SView * vRight;

@end
