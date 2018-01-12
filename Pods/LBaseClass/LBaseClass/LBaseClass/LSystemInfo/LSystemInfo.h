//
//  LSystemInfo.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"

@interface LSystemInfo : LObject

+ (BOOL)higheriOS9;

+ (BOOL)higheriOS10;

+ (BOOL)higheriOS11;

+ (float)systemVersion;

@end
