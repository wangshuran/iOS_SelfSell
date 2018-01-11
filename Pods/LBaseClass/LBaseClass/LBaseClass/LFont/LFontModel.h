//
//  LFontModel.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/4.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LModel.h"

@interface LFontModel : LModel

@property (nonatomic, copy) NSString * text;

@property (nonatomic, assign) CGFloat size;

@property (nonatomic, assign) UIFontWeight weight;

@end
