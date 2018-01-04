//
//  SInput.h
//  SelfSell
//
//  Created by liqiang on 2017/12/28.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"

@interface SInput : SObject

- (instancetype)initWithType:(CmdType)type info:(id)info;

@property (nonatomic, assign) CmdType type;

@property (nonatomic, strong) id info;

@end
