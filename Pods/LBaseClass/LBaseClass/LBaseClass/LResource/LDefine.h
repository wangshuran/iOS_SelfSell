//
//  LDefine.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#ifndef LDefine_h
#define LDefine_h


#ifdef DEBUG

#define debugLog(...)          NSLog(__VA_ARGS__);
#define debugMethod()          NSLog(@"__Class:%@__Function:%s", self.class, __FUNCTION__);
#define debugDescription()     NSLog(@"__Class:%@__Function:%s__Line:%d__Description:%@", self.class, __FUNCTION__, __LINE__, self.description);

#else

#define debugLog(...)
#define debugMethod()
#define debugDescription()

#endif


#endif /* LDefine_h */
