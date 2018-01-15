//
//  TBTableView.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>
#import "TBModel.h"

@interface TBTableView : LTableView

@property (nonatomic, strong) NSArray<NSArray<TBModel *> *> * data;

@end
