//
//  LNetwork.h
//  LBaseClass
//
//  Created by liqiang on 2017/12/25.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LObject.h"
#import "LRequest.h"

typedef void(^LRequestBlock) (LRequest * request, LResponse * response);

@interface LNetwork : LObject

/**
 发送请求
 */
+ (void)request:(LRequest *)request block:(LRequestBlock)block;

@end
