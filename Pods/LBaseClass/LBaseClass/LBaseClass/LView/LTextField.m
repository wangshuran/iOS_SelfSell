//
//  LTextField.m
//  LBaseClass
//
//  Created by liqiang on 2017/11/30.
//  Copyright © 2017年 liqiang. All rights reserved.
//

#import "LTextField.h"

@implementation LTextField

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

- (void)setPlaceholderFont:(UIFont *)font {
    [self setValue:font forKey:@"_placeholderLabel.font"];
}

- (void)setPlaceholderColor:(UIColor *)color {
    [self setValue:color forKey:@"_placeholderLabel.textColor"];
}

- (void)setPlaceholderAligment:(NSTextAlignment)alignment {
    [self setValue:[NSNumber numberWithInteger:alignment] forKey:@"_placeholderLabel.textAligment"];
}

#pragma mark - LInitProtocol

- (void)initialize {
    if (self.uid) {
        @throw [NSException exceptionWithName:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] reason:[NSString stringWithFormat:@"repeat execute %@", NSStringFromSelector(_cmd)] userInfo:nil];
    }
    
    _uid = [NSUUID UUID].UUIDString;
    _createTime = [[NSDate date] timeIntervalSince1970];
    
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
}

@end
