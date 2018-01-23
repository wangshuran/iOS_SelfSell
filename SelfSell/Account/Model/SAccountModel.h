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
 登录时间
 */
@property (nonatomic, assign) NSTimeInterval loginTime;

@property (nonatomic, copy) NSString * token;

@property (nonatomic, copy) NSString * id;

@property (nonatomic, copy) NSString * email;

@property (nonatomic, copy) NSString * status;

@property (nonatomic, copy) NSString * googleAuthStatus;

@property (nonatomic, copy) NSString * inviteCode;

@property (nonatomic, copy) NSString * createTime;

@end
