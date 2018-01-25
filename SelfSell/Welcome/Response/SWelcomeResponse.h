//
//  SWelcomeResponse.h
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SResponse.h"
#import "SWelcomeModel.h"

@interface SWelcomeResponse : SResponse

@property (nonatomic, strong) NSArray<SWelcomeModel *> * data;

@end
