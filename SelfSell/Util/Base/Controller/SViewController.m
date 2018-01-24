//
//  SViewController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SViewController.h"
#import "UINavigationItem+Margin.h"

@interface SViewController ()

@property (nonatomic, strong) SButton * btnLeft;

@end

@implementation SViewController

#pragma mark - Interface

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (self.navigationController) {
        UIColor * color = self.navigationController.navigationBar.barTintColor;
        if (color) {
            return [color isDark] ? UIStatusBarStyleLightContent : UIStatusBarStyleDefault;
        }
    }
    
    return UIStatusBarStyleDefault;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (SButton *)btnLeft {
    if (!_btnLeft) {
        _btnLeft = [[SButton alloc] init];
        _btnLeft.backgroundColor = [UIColor clearColor];
        _btnLeft.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
        _btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0.0f, 10.0f, 0.0f, 0.0f);
        [_btnLeft setImage:[UIImage imageNamed:@"common_fanhui"] forState:UIControlStateNormal];
        [_btnLeft setImage:[UIImage imageNamed:@"common_fanhui_qian"] forState:UIControlStateHighlighted];
        [_btnLeft addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _btnLeft;
}

- (SView *)vNavLeft {
    if (!_vNavLeft) {
        _vNavLeft = [[SView alloc] init];
        _vNavLeft.backgroundColor = [UIColor clearColor];
        _vNavLeft.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
        [_vNavLeft addSubview:self.btnLeft];
    }
    
    return _vNavLeft;
}

- (SView *)vNavRight {
    if (!_vNavRight) {
        _vNavRight = [[SView alloc] init];
        _vNavRight.backgroundColor = [UIColor clearColor];
        _vNavRight.frame = CGRectMake(0.0f, 0.0f, 64.0f, 44.0f);
    }
    
    return _vNavRight;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        self.vNavLeft.hidden = NO;
    }else {
        self.vNavLeft.hidden = YES;
    }
}

- (void)loadView {
    [super loadView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.vNavLeft];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.vNavRight];
    self.navigationItem.leftMargin = 0.0f;
    self.navigationItem.rightMargin = 0.0f;
}

#pragma mark - LReflectProtocol

- (BOOL)reflect:(NSDictionary *)obj {
    [self mj_setKeyValues:obj];
    return YES;
}

//#pragma mark - LInitProtocol
//
//- (void)initialize {
//    [super initialize];
//}

@end
