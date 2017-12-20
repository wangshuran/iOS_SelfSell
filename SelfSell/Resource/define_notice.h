//
//  define_notice.h
//  SelfSell
//
//  Created by liqiang on 2017/12/20.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#ifndef define_notice_h
#define define_notice_h

#define SNotificationCenter [NSNotificationCenter defaultCenter]//通知对象
#define SAddObsver(methodName, noteName) [SNotificationCenter addObserver:self selector:@selector(methodName) name:noteName object:nil];//添加监听
#define SRemoveObsver [SNotificationCenter removeObserver:self];//移除监听
#define SPostNotification(noteName) [SNotificationCenter postNotificationName:noteName object:nil];//发送通知


#define kNoticeClearCache @"kNoticeClearCache"//清空缓存通知
#define kNoticeToLogin @"kNoticeToLogin"//去登录通知
#define kNoticeFinishLogin @"kNoticeFinishLogin"//完成登录通知
#define kNoticeToLogout @"kNoticeToLogout"//去登出通知
#define kNoticeFinishLogout @"kNoticeFinishLogout"//完成登出通知

#endif /* define_notice_h */
