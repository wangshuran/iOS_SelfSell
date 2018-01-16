//
//  TBTableViewCell.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>
#import "TBModel.h"

@interface TBCell : LTableViewCell

@property (nonatomic, strong) TBModel * model;

@end
