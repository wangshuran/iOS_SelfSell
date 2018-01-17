//
//  TBTableViewCell.h
//  SelfSell
//
//  Created by liqiang on 2018/1/15.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import <LBaseClass/LBaseClass.h>
#import "TBModel.h"

#define kTitleNormalColor [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:1.0f]

#define kTitleSelectColor [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.4f]

#define kValueColor [UIColor blackColor]

#define kTitleFont [LFont bold_15]

#define kValueFont [LFont thin_14]

@interface TBCell : LTableViewCell

@property (nonatomic, strong) TBModel * model;

@property (nonatomic, strong) UILabel * lbTitle;

@property (nonatomic, strong) UILabel * lbValue;

@end
