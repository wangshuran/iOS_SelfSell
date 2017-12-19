//
//  AppContext.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext.h"

@implementation AppContext

#pragma mark - Interface

- (LTabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        _rootVC.viewControllers = [NSArray arrayWithObjects:self.n1VC, nil];
        _rootVC.selectedViewController = self.n1VC;
    }
    
    return _rootVC;
}

- (LNavigationController *)n1VC {
    if (!_n1VC) {        
        LViewController * v1 = [[NSClassFromString(@"SViewController") alloc] init];
        v1.view.backgroundColor = [UIColor randomColor];
        v1.title = @"dsds";
        v1.visibleNavbar = YES;
        
        _n1VC = [[NSClassFromString(@"SNavigationController") alloc] initWithRootViewController:v1];
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIViewController * z1 = _n1VC.topViewController;
            UIViewController * z2 = v1;
            z2 = z1;
        });
    }
    
    return _n1VC;
}

- (Language)language {
    if (_language == LanguageNone) {
        NSArray * allLanguages = [NSUserDefaults.standardUserDefaults objectForKey:@"AppleLanguages"];
        NSString * preferredLang = [allLanguages objectAtIndex:0];
        
        if ([preferredLang isEqualToString:@"zh-Hant-US"]) {            
            _language = LanguageTC;
        }else if ([preferredLang isEqualToString:@"zh-Hans-US"]) {
            _language = LanguageSC;
        }else if ([preferredLang isEqualToString:@"en"]) {
            _language = LanguageEN;
        }else {
            _language = LanguageEN;
        }
    }
    
    return _language;
}

@end
