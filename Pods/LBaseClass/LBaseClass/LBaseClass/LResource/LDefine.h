//
//  LDefine.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#ifndef LDefine_h
#define LDefine_h

//配置控制台输出颜色
#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET XCODE_COLORS_ESCAPE @";" // Clear any foreground or background color

#ifdef DEBUG

//红色
#define _logRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//绿色
#define _logGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//蓝色
#define _logBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//黄色
#define _logYellow(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//黑色
#define _logBlack(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//信息
#define _logInfo(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//重要
#define _logImport(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" @"%s" frmt XCODE_COLORS_RESET), __FUNCTION__, ##__VA_ARGS__);
//警告
#define _logWarn(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,255,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__);
//错误
#define _logError(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" @"%s" frmt XCODE_COLORS_RESET), __FUNCTION__, ##__VA_ARGS__);

#else

//红色
#define _logRed(frmt, ...) nil;
//绿色
#define _logGreen(frmt, ...) nil;
//蓝色
#define _logBlue(frmt, ...) nil;
//黄色
#define _logYellow(frmt, ...) nil;
//黑色
#define _logBlack(frmt, ...) nil;
//信息
#define _logInfo(frmt, ...) nil;
//重要
#define _logImport(frmt, ...) nil;
//警告
#define _logWarn(frmt, ...) nil;
//错误
#define _logError(frmt, ...) nil;

#endif


#endif /* LDefine_h */
