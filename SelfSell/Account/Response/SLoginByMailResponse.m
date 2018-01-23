//
//  SLoginByMailResponse.m
//  SelfSell
//
//  Created by liqiang on 2018/1/23.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SLoginByMailResponse.h"

@implementation SLoginByMailResponse

- (BOOL)reflect:(NSDictionary *)obj {
    [super reflect:obj];
    NSDictionary * data = [obj objectForKey:@"data"];
    if (data) {
        SAccountModel * model = [[SAccountModel alloc] init];
        [model reflect:data];
        self.data = model;
    }
    return YES;
}

@end
