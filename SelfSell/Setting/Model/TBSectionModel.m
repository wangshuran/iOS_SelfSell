//
//  TBSectionModel.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBSectionModel.h"

@implementation TBSectionModel

+ (instancetype)sectionWithItems:(NSArray<TBModel *> *)items {
    TBSectionModel * model = [[TBSectionModel alloc] init];
    model.items = items;
    
    return model;
}

@end
