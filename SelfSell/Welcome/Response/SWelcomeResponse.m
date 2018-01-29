//
//  SWelcomeResponse.m
//  SelfSell
//
//  Created by liqiang on 2018/1/25.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SWelcomeResponse.h"

@implementation SWelcomeResponse

- (BOOL)reflect:(NSDictionary *)obj {
    [super reflect:obj];
    NSArray * data = [obj objectForKey:@"data"];
    if (data && ![data isEqual:[NSNull null]]) {
        NSMutableArray * models = [[NSMutableArray alloc] initWithCapacity:data.count];
        for (NSDictionary * welcome in data) {
            if (welcome && ![welcome isEqual:[NSNull null]]) {
                SWelcomeModel * model = [[SWelcomeModel alloc] init];
                [model reflect:welcome];
                [models addObject:model];
            }
        }
        self.data = models.count > 0 ? models : nil;
    }
    return YES;
}

@end
