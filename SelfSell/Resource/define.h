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




#define kIsIPhoneX (CGRectGetWidth(UIScreen.mainScreen.bounds) == 375.0f)//是否是iPhoneX
#define kNavHeight (kIsIPhoneX ? 84.0f : 64.0f)

#define kBtnFontBigger [LFont bold_18]//按钮大字体
#define kBtnFontNormal [LFont bold_16]//按钮正常字体
#define kBtnFontSmaller [LFont thin_15]//按钮小字体

#define kLbFontBigger [LFont thin_18]//文本大字体
#define kLbFontNormal [LFont thin_16]//文本正常字体
#define kLbFontSmaller [LFont thin_14]//文本小字体

#define kLastInitDBVersion @"kLastInitDBVersion"//最后初始化数据库版本
#define kIsOpenTouchID @"kIsOpenTouchID"//是否开启指纹验证
#define kLastWelcomeVersion @"kLastWelcomeVersion"//最后显示欢迎页的版本



#define kColorClear [UIColor clearColor]
#define kColorOrange [UIColor colorWithRed:239.0f / 255.0f green:143.0f / 255.0f blue:16.0f / 255.0f alpha:1.0f]
#define kColorWhite0 [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f]
#define kColorWhite10 [UIColor colorWithRed:10.0f / 255.0f green:10.0f / 255.0f blue:10.0f / 255.0f alpha:1.0f]
#define kColorWhite40 [UIColor colorWithRed:40.0f / 255.0f green:40.0f / 255.0f blue:40.0f / 255.0f alpha:1.0f]
#define kColorWhite70 [UIColor colorWithRed:70.0f / 255.0f green:70.0f / 255.0f blue:70.0f / 255.0f alpha:1.0f]
#define kColorWhite100 [UIColor colorWithRed:100.0f / 255.0f green:100.0f / 255.0f blue:100.0f / 255.0f alpha:1.0f]
#define kColorWhite130 [UIColor colorWithRed:130.0f / 255.0f green:130.0f / 255.0f blue:130.0f / 255.0f alpha:1.0f]
#define kColorWhite160 [UIColor colorWithRed:160.0f / 255.0f green:160.0f / 255.0f blue:160.0f / 255.0f alpha:1.0f]
#define kColorWhite190 [UIColor colorWithRed:190.0f / 255.0f green:190.0f / 255.0f blue:190.0f / 255.0f alpha:1.0f]
#define kColorWhite220 [UIColor colorWithRed:220.0f / 255.0f green:220.0f / 255.0f blue:220.0f / 255.0f alpha:1.0f]
#define kColorWhite250 [UIColor colorWithRed:250.0f / 255.0f green:250.0f / 255.0f blue:250.0f / 255.0f alpha:1.0f]
#define kColorWhite255 [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f]

#endif /* define_h */
