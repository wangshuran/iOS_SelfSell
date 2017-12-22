//
//  SSettingService.h
//  SelfSell
//
//  Created by liqiang on 2017/12/22.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SObject.h"
#import "SSettingModel.h"
@interface SSettingService : SObject

- (NSArray<SSettingModel *> *)getAll;

@end
