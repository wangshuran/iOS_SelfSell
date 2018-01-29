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

- (void)setSelectVC:(SNavigationController *)vc {
    self.rootVC.selectedViewController = vc;
}

- (STabBarController *)rootVC {
    if (!_rootVC) {
        _rootVC = [[NSClassFromString(@"STabBarController") alloc] init];
        [self reloadRootVC];
        _rootVC.tabBar.tintColor = kColorOrange;
        _rootVC.tabBar.barTintColor = kColorWhite10;
        _rootVC.selectedViewController = self.activityNav;
    }
    
    return _rootVC;
}

- (SNavigationController *)fundNav {
    if (!_fundNav) {
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:kColorWhite100, NSForegroundColorAttributeName, nil];
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
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:kColorWhite100, NSForegroundColorAttributeName, nil];
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
        NSDictionary * normal = [NSDictionary dictionaryWithObjectsAndKeys:kColorWhite100, NSForegroundColorAttributeName, nil];
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
    }
    
    return _fundVC;
}

- (SActivityController *)activityVC {
    if (!_activityVC) {
        _activityVC = [[SActivityController alloc] init];
    }
    
    return _activityVC;
}

- (SSetting0Controller *)setting0VC {
    if (!_setting0VC) {
        _setting0VC = [[SSetting0Controller alloc] init];
    }
    
    return _setting0VC;
}

- (SDao *)accountDao {
    if (!_accountDao) {
        NSString * name = [self.accountModel.id MD5];
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

- (void)initDB {
    [[AppContext sharedAppContext].commonDao createTable:[[SModel alloc] init]];
    [[AppContext sharedAppContext].commonDao createTable:[[SCommonModel alloc] init]];
    //[[AppContext sharedAppContext].commonDao createTable:[[SAccountModel alloc] init]];
    
    [[AppContext sharedAppContext].accountDao createTable:[[SModel alloc] init]];
    [[AppContext sharedAppContext].accountDao createTable:[[SCommonModel alloc] init]];
    //[[AppContext sharedAppContext].accountDao createTable:[[SAccountModel alloc] init]];
    
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * lastInitDBVersion = [userDefaults objectForKey:kLastInitDBVersion];
    if (![lastInitDBVersion isEqualToString:[LAppInfo CFBundleShortVersionString]]) {
        {
            SCommonModel * model = [[SCommonModel alloc] init];
            model.key = kLastWelcomeVersion;
            model.value = @"";
            [[AppContext sharedAppContext].commonDao insertObject:model];
        }{
            SCommonModel * model = [[SCommonModel alloc] init];
            model.key = kIsOpenTouchID;
            model.value = @"0";
            [[AppContext sharedAppContext].accountDao insertObject:model];
        }
        
        [userDefaults setObject:[LAppInfo CFBundleShortVersionString] forKey:kLastInitDBVersion];
        [userDefaults synchronize];
    }
}

#pragma mark - LInitProtocol

- (void)initialize {
    [super initialize];
    
    self.netStatus = AFNetworkReachabilityStatusUnknown;
    self.accountModel = nil;
    _languageCache = [[NSMutableDictionary alloc] initWithCapacity:1024];
    
#ifdef DEBUG
    self.host = @"http://172.16.33.188:9003";
#else
    self.host = @"http://172.16.33.188:9003";
#endif
}

@end
