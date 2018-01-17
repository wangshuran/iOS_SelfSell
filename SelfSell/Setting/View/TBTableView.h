//
//  TBTableView.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>
#import "TBSectionModel.h"

#define kNoticeCellSelect @"kNoticeCellSelect"//单元格选中通知

@interface TBTableView : UITableView

@property (nonatomic, strong) NSArray<TBSectionModel *> * data;

@end
