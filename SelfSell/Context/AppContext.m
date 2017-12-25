//
//  AppContext.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext.h"

@interface AppContext()

@end

@implementation AppContext

#pragma mark - Interface

LSingleton_m(AppContext);

- (void)startMonitoring {
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wundeclared-selector"
    
    SAddObsver(noticeClearCache:, kNoticeClearCache);
    SAddObsver(noticeToLogin:, kNoticeToLogin);
    SAddObsver(noticeFinishLogin:, kNoticeFinishLogin);
    SAddObsver(noticeToLogout:, kNoticeToLogout);
    SAddObsver(noticeFinishLogout:, kNoticeFinishLogout);
    SAddObsver(noticeShowVersionCheck:, kNoticeShowVersionCheck);    
    
#pragma clang diagnostic pop
    
    
    
}

- (STabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        _rootVC.viewControllers = [NSArray arrayWithObjects:self.n1VC, self.n2VC, self.n3VC, self.n4VC, self.n5VC, nil];
        _rootVC.selectedViewController = self.n1VC;
    }
    
    return _rootVC;
}

- (SNavigationController *)n1VC {
    if (!_n1VC) {
        SViewController * vc = [[NSClassFromString(@"SUserController") alloc] init];
        vc.hiddenNavbar = YES;
        vc.hiddenTabar = NO;
        
        _n1VC = [[SNavigationController alloc] initWithRootViewController:vc];
    }
    
    return _n1VC;
}

- (SNavigationController *)n2VC {
    if (!_n2VC) {
        SViewController * vc = [[NSClassFromString(@"SUserController") alloc] init];
        vc.hiddenNavbar = YES;
        vc.hiddenTabar = NO;
        
        _n2VC = [[SNavigationController alloc] initWithRootViewController:vc];
    }
    
    return _n2VC;
}

- (SNavigationController *)n3VC {
    if (!_n3VC) {
        SViewController * vc = [[NSClassFromString(@"SUserController") alloc] init];
        vc.hiddenNavbar = YES;
        vc.hiddenTabar = NO;
        
        _n3VC = [[SNavigationController alloc] initWithRootViewController:vc];
    }
    
    return _n3VC;
}
- (SNavigationController *)n4VC {
    if (!_n4VC) {
        SViewController * vc = [[NSClassFromString(@"SUserController") alloc] init];
        vc.hiddenNavbar = YES;
        vc.hiddenTabar = NO;
        
        _n4VC = [[SNavigationController alloc] initWithRootViewController:vc];
    }
    
    return _n4VC;
}


- (SNavigationController *)n5VC {
    if (!_n5VC) {
        SViewController * vc = [[NSClassFromString(@"SUserController") alloc] init];
        vc.hiddenNavbar = YES;
        vc.hiddenTabar = NO;
        
        _n5VC = [[SNavigationController alloc] initWithRootViewController:vc];
    }
    
    return _n5VC;
}

- (Language)language {
    if (_language == LanguageNone) {
        NSArray * languages = [NSObject mj_objectArrayWithFilename:@"SupportLanguage.plist"];
        
        NSArray * allLanguages = [NSUserDefaults.standardUserDefaults objectForKey:@"AppleLanguages"];
        NSString * preferredLang = [allLanguages objectAtIndex:0];
        
        for (NSDictionary * language in languages) {
            if ([preferredLang hasPrefix:[language objectForKey:@"code"]]) {
                NSString * index = [NSString stringWithFormat:@"%@", [language objectForKey:@"index"]];
                _language = index.intValue;
                _languageCode = [language objectForKey:@"code"];
                
                break;
            }
        }
    }
    
    return _language;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.language = LanguageNone;
    self.netStatus = AFNetworkReachabilityStatusUnknown;
    self.loginType = LoginTypeNone;
    self.languageCache = [[NSMutableDictionary alloc] initWithCapacity:1024];
}

@end
