//
//  SNavigationController.m
//  SelfSell
//
//  Created by liqiang on 2017/12/18.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "SNavigationController.h"

@interface SNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation SNavigationController

#pragma mark - Interface

- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.viewControllers.count > 1;
}

#pragma mark - UINavigationBarDelegate

//- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPushItem:(UINavigationItem *)item {
//    UIBarButtonItem * back = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    item.backBarButtonItem = back;
//
//    UIImage *image = [[UIImage imageNamed:@"qqzoneShare"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    navigationBar.backIndicatorImage = image;
//    navigationBar.backIndicatorTransitionMaskImage = image;
//
//    return YES;
//}

//- (void)navigationBar:(UINavigationBar *)navigationBar didPushItem:(UINavigationItem *)item {
//}
//
//- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
//}
//
//- (void)navigationBar:(UINavigationBar *)navigationBar didPopItem:(UINavigationItem *)item {
//}


@end
