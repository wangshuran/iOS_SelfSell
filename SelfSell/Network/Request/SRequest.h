//
//  SRequest.h
//  SelfSell
//
//  Created by liqiang on 2017/12/21.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>

@interface SRequest : LRequest

/**
 通过Url初始化
 */
- (instancetype)initWithUrl:(NSString *)url;

@end
