//
//  AppDelegate.h
//  BG
//
//  Created by Joe on 13-8-2.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSTimeInterval _backgroundRunningTimeInterval;
    UIButton *_btn;
}
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, assign) BOOL isForeground;
@end
