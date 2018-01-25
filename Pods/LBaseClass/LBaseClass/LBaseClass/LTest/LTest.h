//
//  LTest.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"
#import "LView.h"

@interface LTest : LObject

/**
  给视图及其子视图上颜色
 */
+ (void)randomColorView:(UIView *)view;

@end
