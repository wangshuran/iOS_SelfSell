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
 登录类型，默认LoginTypeNone
 */
@property (nonatomic, assign) LoginType loginType;

/**
 语言类型，默认App语言
 */
@property (nonatomic, assign, readonly) Language language;

/**
 语言类型代码，默认App语言
 */
@property (nonatomic, copy) NSString * languageCode;

/**
 是否已经注销（注销用户时保留用户数据，该属性为YES），默认NO
 */
@property (nonatomic, assign) BOOL isLogout;

/////////////////////////////////////////////////////

@property (nonatomic, copy) NSString * token;

@property (nonatomic, copy) NSString * id;

@property (nonatomic, copy) NSString * email;

@property (nonatomic, copy) NSString * status;

//ON、OFF，默认OFF
@property (nonatomic, copy) NSString * googleAuthStatus;

@property (nonatomic, copy) NSString * inviteCode;

@property (nonatomic, copy) NSString * createTime;

/**
 是否为合法并登录用户
 */
- (BOOL)isLoginUser;

@end
