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

- (void)setLanguageCode:(NSString *)languageCode {
    NSArray * languages = [self getAppSupportLanguage];
    
    for (NSDictionary * language in languages) {
        if ([languageCode hasPrefix:[language objectForKey:@"code"]]) {
            NSString * index = [NSString stringWithFormat:@"%@", [language objectForKey:@"index"]];
            _language = index.intValue;
            _languageCode = [language objectForKey:@"code"];
            
            break;
        }
    }
    
    if (!_languageCode) {
        NSDictionary * language = [languages objectAtIndex:0];
        NSString * index = [NSString stringWithFormat:@"%@", [language objectForKey:@"index"]];
        _language = index.intValue;
        _languageCode = [language objectForKey:@"code"];
    }
}

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

- (NSArray *)getAppSupportLanguage {
    return [NSObject mj_objectArrayWithFilename:@"SupportLanguage.plist"];
}

- (STabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        _rootVC.viewControllers = [NSArray arrayWithObjects:self.talentsNav, self.marketNav, self.votesNav, self.viewsNav, self.accountNav, nil];
        _rootVC.tabBar.tintColor = [UIColor colorWithRed:1.0f / 255.0f green:199.0f / 255.0f blue:209.0f / 255.0f alpha:1.0f];
        
        _rootVC.selectedViewController = self.talentsNav;
    }
    
    return _rootVC;
}

- (SNavigationController *)talentsNav {
    if (!_talentsNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * highlighted = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _talentsNav = [[SNavigationController alloc] initWithRootViewController:self.talentsVC];
        _talentsNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _talentsNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_talentsNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_talentsNav.tabBarItem setTitleTextAttributes:highlighted forState:UIControlStateHighlighted];
    }
    
    return _talentsNav;
}

- (SNavigationController *)marketNav {
    if (!_marketNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * highlighted = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _marketNav = [[SNavigationController alloc] initWithRootViewController:self.marketVC];
        _marketNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _marketNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_marketNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_marketNav.tabBarItem setTitleTextAttributes:highlighted forState:UIControlStateHighlighted];
    }
    
    return _marketNav;
}

- (SNavigationController *)votesNav {
    if (!_votesNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * highlighted = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _votesNav = [[SNavigationController alloc] initWithRootViewController:self.votesVC];
        _votesNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _votesNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_votesNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_votesNav.tabBarItem setTitleTextAttributes:highlighted forState:UIControlStateHighlighted];    }
    
    return _votesNav;
}

- (SNavigationController *)viewsNav {
    if (!_viewsNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * highlighted = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _viewsNav = [[SNavigationController alloc] initWithRootViewController:self.viewsVC];
        _viewsNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _viewsNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_viewsNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_viewsNav.tabBarItem setTitleTextAttributes:highlighted forState:UIControlStateHighlighted];    }
    
    return _viewsNav;
}

- (SNavigationController *)accountNav {
    if (!_accountNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * highlighted = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _accountNav = [[SNavigationController alloc] initWithRootViewController:self.settingVC];
        _accountNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _accountNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_accountNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_accountNav.tabBarItem setTitleTextAttributes:highlighted forState:UIControlStateHighlighted];
    }
    
    return _accountNav;
}

- (STalentsController *)talentsVC {
    if (!_talentsVC) {
        _talentsVC = [[STalentsController alloc] init];
        _talentsVC.hiddenNavbar = YES;
        _talentsVC.hiddenTabar = NO;
    }
    
    return _talentsVC;
}

- (SMarketController *)marketVC {
    if (!_marketVC) {
        _marketVC = [[SMarketController alloc] init];
        _marketVC.hiddenNavbar = YES;
        _marketVC.hiddenTabar = NO;
    }
    
    return _marketVC;
}

- (SVotesController *)votesVC {
    if (!_votesVC) {
        _votesVC = [[SVotesController alloc] init];
        _votesVC.hiddenNavbar = YES;
        _votesVC.hiddenTabar = NO;
    }
    
    return _votesVC;
}

- (SViewsController *)viewsVC {
    if (!_viewsVC) {
        _viewsVC = [[SViewsController alloc] init];
        _viewsVC.hiddenNavbar = YES;
        _viewsVC.hiddenTabar = NO;
    }
    
    return _viewsVC;
}

- (SSettingController *)settingVC {
    if (!_settingVC) {
        _settingVC = [[SSettingController alloc] init];
        _settingVC.hiddenNavbar = YES;
        _settingVC.hiddenTabar = NO;
    }
    
    return _settingVC;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
        
    self.languageCode = [LLanguage getOSDefaultLanguage];
    self.netStatus = AFNetworkReachabilityStatusUnknown;
    self.loginType = LoginTypeNone;
    self.accountModel = nil;
    _languageCache = [[NSMutableDictionary alloc] initWithCapacity:1024];
    
#ifdef DEBUG
    self.host = @"http://www.suizhi.com/DRM";
#else
    self.host = @"http://www.suizhi.com/DRM";
#endif
    
}

@end
