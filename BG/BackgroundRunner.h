//
//  BackgroundRunner.h
//  BG
//
//  Created by Joe on 13-8-27.
//  Copyright (c) 2013年 Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
/** helping application to running in background */
@interface BackgroundRunner : NSObject
{
    BOOL _free;
    BOOL _holding;
}
+ (BackgroundRunner *)shared;

/** hold the thread when background task will terminate */
- (void)hold;

/** free from holding when applicaiton become active */
- (void)stop;

/** running in background, call this funciton when application become background */
- (void)run;
@end
