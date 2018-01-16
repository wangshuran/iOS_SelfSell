//
//  TBSectionModel.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>
#import "TBModel.h"

@interface TBSectionModel : LModel

+ (instancetype)sectionWithItems:(NSArray<TBModel *> *)items;

@property (nonatomic, strong) NSArray<TBModel *> * items;

@end
