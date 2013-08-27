//
//  AppDelegate.m
//  Background
//
//  Created by Joe on 13-8-2.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import "AppDelegate.h"
#import "BackgroundRunner.h"

@implementation AppDelegate
static NSDateFormatter *formatter = nil;
+ (void)initialize
{
    formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        ;
    _backgroundRunningTimeInterval = 0;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    _btn = [UIButton buttonWithType:1];
    [_btn setFrame:CGRectMake(0, 0, 300, 100)];
    _btn.center = self.window.center;
    [_btn addTarget:self action:@selector(btnSelected) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:_btn];
    [_btn setTitle:[[NSUserDefaults standardUserDefaults] valueForKey:@"Time"] forState:0];
    [self performSelectorInBackground:@selector(runningInBackground) withObject:nil];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if ([[UIDevice currentDevice] isMultitaskingSupported]) {
        [[BackgroundRunner shared] run];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[BackgroundRunner shared] stop];
    [_btn setTitle:[NSString stringWithFormat:@"%d",(int)_backgroundRunningTimeInterval] forState:UIControlStateNormal];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{

}

- (void)applicationWillResignActive:(UIApplication *)application
{
    
}

#pragma mark - private method
- (void)btnSelected
{
    [_btn setTitle:[NSString stringWithFormat:@"%d",(int)_backgroundRunningTimeInterval] forState:UIControlStateNormal];
}



- (void)runningInBackground
{
    while (1) {
        [NSThread sleepForTimeInterval:1];
        _backgroundRunningTimeInterval++;
        NSLog(@"%d",(int)_backgroundRunningTimeInterval);
    }
}


@end
