//
//  AppDelegate.m
//  RunTime
//
//  Created by foscom on 16/6/30.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import "AppDelegate.h"
#import "GetLogFile.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
#define XCODE_COLORS_ESCAPE @"\033["

#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg30,144,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg220,20,60;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)


// nslog 宏处理
#define AWLog(fmt, ...)  NSLog(fmt, ##__VA_ARGS__)

//#define NSLog(format, ...) do {                                                      \
//         fprintf(stderr, "<%s : %d> %s\n",                                           \
//         [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
//        __LINE__, __func__);                                                         \
//        (NSLog)((format), ##__VA_ARGS__);                                           \
//} while (0)


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [self redirectNSlogToDocumentFolder];
    LogBlue(@"nishi %f",3.4);
    
    LogRed(@"askdasd%@",@"3qef");
    
   NSLog(@"zheshi");
    GetLogFile *get = [[GetLogFile alloc] init];

    [get getLogFileData];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
