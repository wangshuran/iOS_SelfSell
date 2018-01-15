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
    SAddObsver(noticeShowSecurityCheck:, kNoticeShowSecurityCheck);
    
#pragma clang diagnostic pop
}

- (NSArray *)getAppSupportLanguage {
    return [NSObject mj_objectArrayWithFilename:@"SupportLanguage.plist"];
}

- (STabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        _rootVC.viewControllers = [NSArray arrayWithObjects:self.activityNav, self.fundNav, self.accountNav, nil];
        _rootVC.tabBar.tintColor = [UIColor colorWithRed:1.0f / 255.0f green:199.0f / 255.0f blue:209.0f / 255.0f alpha:1.0f];
        
        _rootVC.selectedViewController = self.activityNav;
    }
    
    return _rootVC;
}

- (SNavigationController *)fundNav {
    if (!_fundNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * selected = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _fundNav = [[SNavigationController alloc] initWithRootViewController:self.fundVC];
        _fundNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _fundNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_fundNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_fundNav.tabBarItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
    
    return _fundNav;
}

- (SNavigationController *)activityNav {
    if (!_activityNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * selected = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _activityNav = [[SNavigationController alloc] initWithRootViewController:self.activityVC];
        _activityNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _activityNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_activityNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_activityNav.tabBarItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
    
    return _activityNav;
}

- (SNavigationController *)accountNav {
    if (!_accountNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor redColor], NSForegroundColorAttributeName, nil];
        NSDictionary * selected = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor yellowColor], NSForegroundColorAttributeName, nil];
        
        _accountNav = [[SNavigationController alloc] initWithRootViewController:self.settingVC];
        _accountNav.tabBarItem.image = [UIImage imageNamed:@"qqzoneShare"];
        _accountNav.tabBarItem.selectedImage = [UIImage imageNamed:@"qqzoneShare"];
        [_accountNav.tabBarItem setTitleTextAttributes:normal forState:UIControlStateNormal];
        [_accountNav.tabBarItem setTitleTextAttributes:selected forState:UIControlStateSelected];
    }
    
    return _accountNav;
}

- (SFundController *)fundVC {
    if (!_fundVC) {
        _fundVC = [[SFundController alloc] init];
        _fundVC.hiddenNavbar = YES;
        _fundVC.hiddenTabar = NO;
    }
    
    return _fundVC;
}

- (SActivityController *)activityVC {
    if (!_activityVC) {
        _activityVC = [[SActivityController alloc] init];
        _activityVC.hiddenNavbar = YES;
        _activityVC.hiddenTabar = NO;
    }
    
    return _activityVC;
}

- (SSettingController *)settingVC {
    if (!_settingVC) {
        _settingVC = [[SSettingController alloc] init];
        _settingVC.hiddenNavbar = YES;
        _settingVC.hiddenTabar = NO;
    }
    
    return _settingVC;
}

- (SDao *)commonDao {
    if (!_commonDao) {
        _commonDao = [SDao dbPath:[NSString stringWithFormat:@"%@/%@.sqlite", [LFile libraryPath], [@"commondb" MD5]] secret:nil];
        [_commonDao createTable:[[SModel alloc] init]];
        [_commonDao createTable:[[SCommonModel alloc] init]];
    }
    
    return _commonDao;
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
