//
//  define.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#ifndef define_h
#define define_h

#define SLocal(key) [[AppContext sharedAppContext] getLocalValue:key]//读取本地化语言

#define kCurrentLanguageCode @"kCurrentLanguageCode"//用户当前使用语言


#define kLastInitDBVersion @"kLastInitDBVersion"//最后初始化数据库版本
#define kIsOpenTouchID @"kIsOpenTouchID"//是否开启指纹验证
#define kLastWelcomeVersion @"kLastWelcomeVersion"//最后显示欢迎页的版本

#endif /* define_h */
