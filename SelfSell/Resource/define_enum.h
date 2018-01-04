
//
//  define_enum.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#ifndef define_enum_h
#define define_enum_h

typedef enum : NSUInteger {
    LanguageNone,//未知
    LanguageEN,//英文
    LanguageTC,//繁体中文
    LanguageSC,//简体中文
} Language;//语言类型


typedef enum : NSUInteger {
    LoginTypeNone,//未登录
    LoginTypeAccount,//账号登录
} LoginType;//登录类型


typedef enum : NSUInteger {
    CmdTypeNone,
    CmdType1,
    CmdType2,
} CmdType;

#endif /* define_enum_h */
