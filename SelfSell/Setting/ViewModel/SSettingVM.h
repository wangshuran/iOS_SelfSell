//
//  SSettingViewModel.h
//  SelfSell
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SInput.h"

@interface SSettingVM : NSObject

/**
 命令
 */
@property (nonatomic, strong) RACCommand * command;

/**
 订阅
 */
@property (nonatomic, strong) RACSubject * subject;

@end
