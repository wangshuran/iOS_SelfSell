//
//  LResponse.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LModel.h"

@interface LResponse : LModel

/**
 请求状态
 */
@property (nonatomic, assign) BOOL status;

/**
 返回消息
 */
@property (nonatomic, copy) NSString * msg;

@end
