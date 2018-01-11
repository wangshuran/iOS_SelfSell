//
//  LService.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"
#import "LCmdProtocol.h"


FOUNDATION_EXPORT LCmd * const LCmdGetAll;//全部数据
FOUNDATION_EXPORT LCmd * const LCmdGetLastPage;//上一页数据
FOUNDATION_EXPORT LCmd * const LCmdGetNextPage;//下一页数据


@interface LService : LObject<LCmdProtocol>

@end
