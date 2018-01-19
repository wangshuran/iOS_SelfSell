//
//  TBSectionModel.m
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "TBSectionModel.h"

@implementation TBSectionModel

#pragma mark - Interface

+ (instancetype)sectionWithItems:(NSArray<TBModel *> *)items {
    TBSectionModel * model = [[TBSectionModel alloc] init];
    model.items = items;
    
    return model;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.headerHeight = 0.0f;
    self.footerHeight = 0.0f;
}

@end
