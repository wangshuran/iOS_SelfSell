//
//  SWelcomeView.h
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SView.h"
#import "SWelcomeModel.h"

typedef void(^TouchBlock)(void);

@interface SWelcomeView : SView

@property (nonatomic, strong) SWelcomeModel * model;

@property (nonatomic, copy) TouchBlock block;

@end
