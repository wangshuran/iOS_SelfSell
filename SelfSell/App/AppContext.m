//
//  AppContext.m
//  SelfSell
//
//  Created by liqiang on 2017/12/12.
//  Copyright © 2017年 Goopal. All rights reserved.
//

#import "AppContext.h"
#import <LBaseClass/NSString+MD5.h>

@interface AppContext()

@end

@implementation AppContext

#pragma mark - Interface

LSingleton_m(AppContext);

- (void)setLanguageCode:(NSString *)languageCode {
    SLanguage * language = [[SLanguage alloc] init];
    NSArray * languages = [language getAppSupportLanguage];
    
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
    SAddObsver(noticeShowSecurityCheck:, kNoticeShowSecurityCheck);
    SAddObsver(noticeSwitchLanguage:, kNoticeSwitchLanguage);
    
#pragma clang diagnostic pop
}

- (void)reloadRootVC {
    _rootVC.viewControllers = [NSArray arrayWithObjects:self.activityNav, self.fundNav, self.accountNav, nil];
}

- (STabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        [self reloadRootVC];
        _rootVC.tabBar.tintColor = kColorOrange;
        _rootVC.tabBar.barTintColor = kColorBlack;
        _rootVC.selectedViewController = self.accountNav;
    }
    
    return _rootVC;
}

- (SNavigationController *)fundNav {
    if (!_fundNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:kColorDarkGray, NSForegroundColorAttributeName, nil];
        NSDictionary * selected = [NSDictionary dictionaryWithObjectsAndKeys:kColorOrange, NSForegroundColorAttributeName, nil];

        _fundNav = [[SNavigationController alloc] initWithRootViewController:self.fundVC];
        _fundNav.tabBarItem.image = [UIImage imageNamed:@"fund_logo_normal"];
        _fundNav.tabBarItem.selectedImage = [UIImage imageNamed:@"fund_logo_select"];
        [_fundNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_fundNav.tabBarItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
    
    return _fundNav;
}

- (SNavigationController *)activityNav {
    if (!_activityNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:kColorDarkGray, NSForegroundColorAttributeName, nil];
        NSDictionary * selected = [NSDictionary dictionaryWithObjectsAndKeys:kColorOrange, NSForegroundColorAttributeName, nil];

        _activityNav = [[SNavigationController alloc] initWithRootViewController:self.activityVC];
        _activityNav.tabBarItem.image = [UIImage imageNamed:@"activity_logo_normal"];
        _activityNav.tabBarItem.selectedImage = [UIImage imageNamed:@"activity_logo_select"];
        [_activityNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_activityNav.tabBarItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
    
    return _activityNav;
}

- (SNavigationController *)accountNav {
    if (!_accountNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:kColorDarkGray, NSForegroundColorAttributeName, nil];
        NSDictionary * selected = [NSDictionary dictionaryWithObjectsAndKeys:kColorOrange, NSForegroundColorAttributeName, nil];
        
        _accountNav = [[SNavigationController alloc] initWithRootViewController:self.setting0VC];
        _accountNav.tabBarItem.image = [UIImage imageNamed:@"account_logo_normal"];
        _accountNav.tabBarItem.selectedImage = [UIImage imageNamed:@"account_logo_select"];
        [_accountNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_accountNav.tabBarItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
    
    return _accountNav;
}

- (SFundController *)fundVC {
    if (!_fundVC) {
        _fundVC = [[SFundController alloc] init];
        _fundVC.hiddenNavbar = NO;
        _fundVC.hiddenTabar = NO;
    }
    
    return _fundVC;
}

- (SActivityController *)activityVC {
    if (!_activityVC) {
        _activityVC = [[SActivityController alloc] init];
        _activityVC.hiddenNavbar = NO;
        _activityVC.hiddenTabar = NO;
    }
    
    return _activityVC;
}

- (SSetting0Controller *)setting0VC {
    if (!_setting0VC) {
        _setting0VC = [[SSetting0Controller alloc] init];
        _setting0VC.hiddenNavbar = NO;
        _setting0VC.hiddenTabar = NO;
    }
    
    return _setting0VC;
}

- (SDao *)accountDao {
    if (!_accountDao) {
        NSString * name = self.loginType == LoginTypeNone ? [[UIDevice currentDevice] uniqueDeviceIdentifier] : self.accountModel.accountID;
        name = [name MD5];
        _accountDao = [SDao dbPath:[[self getCurrentAccountSpacePath] stringByAppendingPathComponent:name] secret:name];
    }
    
    return _accountDao;
}

- (SDao *)commonDao {
    if (!_commonDao) {
        NSString * name = [@"common" MD5];
        _commonDao = [SDao dbPath:[[self getCommonAccountSpacePath] stringByAppendingPathComponent:name] secret:name];
    }
    
    return _commonDao;
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.languageCode = [[[SLanguage alloc] init] getAppCurrentLanguage];
    self.netStatus = AFNetworkReachabilityStatusUnknown;
    self.loginType = LoginTypeNone;
    self.accountModel = nil;
    _languageCache = [[NSMutableDictionary alloc] initWithCapacity:1024];
    
#ifdef DEBUG
    self.host = @"http://172.16.33.188:9003";
#else
    self.host = @"http://172.16.33.188:9003";
#endif
}

@end
