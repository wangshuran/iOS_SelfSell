//
//  SAccountModel.h
//  SelfSell
//
//  Created by liqiang on 2017/12/26.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SModel.h"

@interface SAccountModel : SModel

/**
 用户标示
 */
@property (nonatomic, copy) NSString * accountID;

/**
 用户名
 */
@property (nonatomic, copy) NSString * accountName;

/**
 登录时间
 */
@property (nonatomic, assign) NSTimeInterval loginTime;

@end
