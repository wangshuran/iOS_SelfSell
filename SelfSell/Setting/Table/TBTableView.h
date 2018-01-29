//
//  TBTableView.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>
#import "TBSectionModel.h"
#import "TBArrowCell.h"
#import "TBCell.h"
#import "TBCheckCell.h"
#import "SettingExitCell.h"
#import "TBSwitchCell.h"
#import "TBTextCell.h"
#import "THeaderView.h"

@interface TBTableView : STableView

@property (nonatomic, strong) NSArray<TBSectionModel *> * data;

@property (nonatomic, assign) BOOL isEnableHeader;

@property (nonatomic, assign) BOOL isEnableFooter;

@end
