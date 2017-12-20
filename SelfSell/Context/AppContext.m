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

LSingleton_m(AppContext);

- (void)startMoniter {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
    
    SAddObsver(noticeClearCache:, kNoticeClearCache);
    SAddObsver(noticeToLogin:, kNoticeToLogin);
    SAddObsver(noticeFinishLogin:, kNoticeFinishLogin);
    SAddObsver(noticeToLogout:, kNoticeToLogout);
    SAddObsver(noticeFinishLogout:, kNoticeFinishLogout);
    
#pragma clang diagnostic pop
    
    
    
}

- (STabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        _rootVC.viewControllers = [NSArray arrayWithObjects:self.n1VC, nil];
        _rootVC.selectedViewController = self.n1VC;
    }
    
    return _rootVC;
}

- (SNavigationController *)n1VC {
    if (!_n1VC) {
        SViewController * vc = [[NSClassFromString(@"SUserController") alloc] init];
        
        _n1VC = [[SNavigationController alloc] initWithRootViewController:vc];
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

- (UIViewController *)getTopController {
    UIViewController * vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (YES) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        }else{
            break;
        }
    }
    
    return vc;
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent {
    [self presentViewController:viewControllerToPresent animated:YES completion:nil];
}

- (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ )(void))completion {
    [[self getTopController] presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
