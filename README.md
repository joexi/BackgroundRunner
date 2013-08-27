BackgroundRunner
================

This class can make a iOS Application running in background.
And it can last far more than 10 mins.

#API

three method is all we need

```Objective-C

/** hold the thread when background task will terminate */

- (void)hold;

/** free from holding when applicaiton become active */

- (void)stop;

/** running in background, call this funciton when application become background */

- (void)run;

```
