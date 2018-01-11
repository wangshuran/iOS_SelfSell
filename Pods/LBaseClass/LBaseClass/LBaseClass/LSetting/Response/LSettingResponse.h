//
//  LSettingResponse.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/8.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LResponse.h"
#import "LSettingModel.h"

@interface LSettingResponse : LResponse

@property (nonatomic, strong) NSArray<LSettingModel *> * data;

@end
