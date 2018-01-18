//
//  SWelcomeController.m
//  SelfSell
//
//  Created by liqiang on 2018/1/12.
//  Copyright © 2018年 Goopal. All rights reserved.
//

#import "SWelcomeController.h"
#import "SDao+Category.h"
#import "SCommonModel+WCTTableCoding.h"

#define kLastWelcomeVersion @"kLastWelcomeVersion"

@interface SWelcomeController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SScrollView * scrollView;

@property (nonatomic, strong) UIPageControl * pageControl;

@property (nonatomic, assign) NSInteger numberOfPages;

@end

@implementation SWelcomeController

- (instancetype)init {
    SCommonModel * model = (SCommonModel *)[[AppContext sharedAppContext].commonDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kLastWelcomeVersion];
    if (model && [model.value isEqualToString:[LAppInfo CFBundleShortVersionString]]) {
        //return nil;
    }
    
    if (model) {
        model.value = [LAppInfo CFBundleShortVersionString];
        [[AppContext sharedAppContext].commonDao updateObject:model property:SCommonModel.value];
    }else {
        model = [[SCommonModel alloc] init];
        model.key = kLastWelcomeVersion;
        model.value = [LAppInfo CFBundleShortVersionString];
        [[AppContext sharedAppContext].commonDao insertObject:model];
    }
    
    self.numberOfPages = 3;
    self = [super init];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (SScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[SScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) * self.numberOfPages, CGRectGetHeight(self.view.bounds));
        _scrollView.backgroundColor = [UIColor randomColor];
    }
    
    return _scrollView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.hidesForSinglePage = YES;
        _pageControl.userInteractionEnabled = NO;
        _pageControl.currentPage = 0;
        _pageControl.pageIndicatorTintColor = [UIColor blackColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:66.0f / 255.0f green:179.0f / 255.0f blue:227.0f / 255.0f alpha:1.0f];
        _pageControl.numberOfPages = self.numberOfPages;
    }
    
    return _pageControl;
}

- (void)loadView {
    [super loadView];
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    
    [self.scrollView mas_updateConstraints:^(MASConstraintMaker * make) {
        make.top.bottom.left.right.mas_equalTo(weakSelf.view);
    }];
    [self.pageControl mas_updateConstraints:^(MASConstraintMaker * make) {
        make.centerX.mas_equalTo(weakSelf.view);
        make.bottom.mas_equalTo(weakSelf.view).offset(-50.0f);
        make.height.mas_equalTo(20.0f);
        make.width.mas_equalTo(60.0f);
    }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = fabs(scrollView.contentOffset.x) / CGRectGetWidth(scrollView.bounds);
    
    self.pageControl.currentPage = index;
    
    
    if ((index + 1) == self.numberOfPages) {
        [self dismiss:NO completion:nil];
    }
}

@end
