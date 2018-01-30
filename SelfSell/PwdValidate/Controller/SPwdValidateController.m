//
//  SPwdValidateController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/30.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SPwdValidateController.h"

@interface SPwdValidateController ()

@end

@implementation SPwdValidateController

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    self.hiddenNavbar = YES;
    self.hiddenTabar = YES;
    //self.view.backgroundColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.2f];
    self.view.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.2f];
    self.view.alpha = 0.0f;
}

@end
