//
//  SCommonModel+WCTTableCoding.h
//  SelfSell
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <WCDB/WCDB.h>

@interface SCommonModel(WCTTableCoding)<WCTTableCoding>

#pragma mark - 声明表的字段

WCDB_PROPERTY(uid)
WCDB_PROPERTY(createTime)
WCDB_PROPERTY(displayOrder)
WCDB_PROPERTY(version)
WCDB_PROPERTY(key)
WCDB_PROPERTY(value)

@end
