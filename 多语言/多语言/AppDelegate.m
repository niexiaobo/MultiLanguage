//
//  AppDelegate.m
//  多语言
//
//  Created by niexiaobo on 2017/9/26.
//  Copyright © 2017年 niexiaobo. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //初始化设置语言
    [self initLanguagesSetting];
    
    return YES;
}
/*
 1.初始化设置语言
 2.在
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions方法中
 
 3.注意:本文中只判断中文和英文,加入其它语言需要添加判断
 
 */

- (void)initLanguagesSetting {
    
    //初始化语言
    if (![[NSUserDefaults standardUserDefaults] objectForKey:appLanguageType]) {
        NSArray  *languages = [NSLocale preferredLanguages];
        NSString *language = [languages objectAtIndex:0];
        if ([language hasPrefix:@"en"]) {
            [[NSUserDefaults standardUserDefaults] setObject:@"en" forKey:appLanguageType];
        }else{
            [[NSUserDefaults standardUserDefaults] setObject:@"zh-Hans" forKey:appLanguageType];
        }
    }
    //初始化设置类型
    [[NSUserDefaults standardUserDefaults] setInteger:appLanguageChangeTypeValue != 1 ? 1 : 0 forKey:appLanguageChangeTypeKey];
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
