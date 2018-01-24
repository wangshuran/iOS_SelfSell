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

/**
 密码
 */
@property (nonatomic, copy) NSString * pwd;

/**
 登录类型
 */
@property (nonatomic, assign) LoginType loginType;

/**
 语言类型
 */
@property (nonatomic, assign, readonly) Language language;

/**
 语言类型代码
 */
@property (nonatomic, copy) NSString * languageCode;

/////////////////////////////////////////////////////

@property (nonatomic, copy) NSString * token;

@property (nonatomic, copy) NSString * id;

@property (nonatomic, copy) NSString * email;

@property (nonatomic, copy) NSString * status;

//ON、OFF
@property (nonatomic, copy) NSString * googleAuthStatus;

@property (nonatomic, copy) NSString * inviteCode;

@property (nonatomic, copy) NSString * createTime;

@end
