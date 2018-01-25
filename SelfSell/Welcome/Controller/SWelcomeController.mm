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
#import "SWelcomeRequest.h"
#import "UIImage+LaunchImage.h"
#import "SWelcomeView.h"

@interface SWelcomeController ()<UIScrollViewDelegate>

@property (nonatomic, strong) SImageView * imgBackg;

@property (nonatomic, strong) SScrollView * scrollView;

@property (nonatomic, strong) UIPageControl * pageControl;

@property (nonatomic, assign) NSInteger numberOfPages;

@end

@implementation SWelcomeController

- (instancetype)init {
    SCommonModel * model = (SCommonModel *)[[AppContext sharedAppContext].commonDao getObjectFromTable:[[SCommonModel alloc] init] condition:SCommonModel.key == kLastWelcomeVersion];
    if ([model.value isEqualToString:[LAppInfo CFBundleShortVersionString]]) {
        //return nil;
    }
    model.value = [LAppInfo CFBundleShortVersionString];
    [[AppContext sharedAppContext].commonDao updateObject:model property:SCommonModel.value];
    self = [super init];
    return self;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (SImageView *)imgBackg {
    if (!_imgBackg) {
        _imgBackg = [[SImageView alloc] init];
        _imgBackg.frame = [UIApplication sharedApplication].keyWindow.bounds;
        _imgBackg.image = [UIImage getLaunchImage];
    }
    
    return _imgBackg;
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

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    [[UIApplication sharedApplication].keyWindow addSubview:self.imgBackg];
    [self request];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    int index = fabs(scrollView.contentOffset.x) / CGRectGetWidth(scrollView.bounds);
    self.pageControl.currentPage = index;
    //改成图片
    //if ((index + 1) == self.numberOfPages) {
    //    [self dismiss:NO completion:nil];
    //}
}

#pragma mark - Private

- (void)request {
    __weak typeof(self) weakSelf = self;
    SWelcomeRequest * request = [[SWelcomeRequest alloc] init];
    [SNetwork request:request block:^(LRequest * request, LResponse * response) {
        if (!response.status) {
            [weakSelf.imgBackg removeFromSuperview];
            [weakSelf dismiss:NO completion:nil];
            return;
        }
        SWelcomeResponse * model = (SWelcomeResponse *)response;
        if (model.data.count < 1) {
            [weakSelf.imgBackg removeFromSuperview];
            [weakSelf dismiss:NO completion:nil];
            return;
        }
        weakSelf.numberOfPages = model.data.count;
        [weakSelf.view addSubview:weakSelf.scrollView];
        [weakSelf.view addSubview:weakSelf.pageControl];
        [weakSelf.scrollView mas_updateConstraints:^(MASConstraintMaker * make) {
            make.top.bottom.left.right.mas_equalTo(weakSelf.view);
        }];
        [weakSelf.pageControl mas_updateConstraints:^(MASConstraintMaker * make) {
            make.centerX.mas_equalTo(weakSelf.view);
            make.bottom.mas_equalTo(weakSelf.view).mas_offset(-50.0f);
            make.height.mas_equalTo(20.0f);
            make.width.mas_equalTo(60.0f);
        }];
        for (NSUInteger i = 0; i < model.data.count; i++) {
            SWelcomeModel * welcomeModel = [model.data objectAtIndex:i];
            SWelcomeView * welcome = [[SWelcomeView alloc] init];
            welcome.frame = CGRectMake(i * CGRectGetWidth(weakSelf.view.bounds), 0.0f, CGRectGetWidth(weakSelf.view.bounds), CGRectGetHeight(weakSelf.view.bounds));
            welcome.model = welcomeModel;
            if ((i + 1) == model.data.count) {
                welcome.block = ^(void){
                    [weakSelf dismiss:NO completion:nil];
                };
            }
            [weakSelf.scrollView addSubview:welcome];
        }
        [UIView animateWithDuration:1 animations:^{
            weakSelf.imgBackg.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [weakSelf.imgBackg removeFromSuperview];
        }];
    }];
}

@end
