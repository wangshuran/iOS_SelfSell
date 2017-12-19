//
//  LLabel.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/29.
//  Copyright © 2017年 leeqiang. All rights reserved.
//

#import "LLabel.h"

@implementation LLabel

#pragma mark - Interface

- (instancetype)init {
    self = [super init];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    [self initialize];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    [self initialize];
    
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - LInitProtocol

- (void)initialize {
    self.uid = [NSUUID UUID].UUIDString;
    _createTime = [[NSDate date] timeIntervalSince1970];
}

@end
