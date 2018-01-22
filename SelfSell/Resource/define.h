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


#define kColorOrange [UIColor colorWithRed:239.0f / 255.0f green:143.0f / 255.0f blue:16.0f / 255.0f alpha:1.0f]
#define kColorDarkGray [UIColor colorWithRed:100.0f / 255.0f green:100.0f / 255.0f blue:100.0f / 255.0f alpha:1.0f]
#define kColorLightGray [UIColor colorWithRed:242.0f / 255.0f green:242.0f / 255.0f blue:242.0f / 255.0f alpha:1.0f]
#define kColorBlack [UIColor colorWithRed:12.0f / 255.0f green:12.0f / 255.0f blue:12.0f / 255.0f alpha:1.0f]

#endif /* define_h */
