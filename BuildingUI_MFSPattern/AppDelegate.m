//
//  AppDelegate.m
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "AppDelegate.h"
// ViewModels
#import "LoginViewModel.h"
// Controllers
#import "LoginController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    LoginController* vc = [LoginController initWithViewModel:nil];
    [UIApplication sharedApplication].delegate.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [[UIApplication sharedApplication].delegate.window makeKeyAndVisible];
    [[UIApplication sharedApplication].delegate.window setRootViewController:vc];

    return YES;
}




@end
