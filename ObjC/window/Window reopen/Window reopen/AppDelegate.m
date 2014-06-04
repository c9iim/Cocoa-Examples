//
//  AppDelegate.m
//  Window reopen
//
//  Created by c9iim on 2014/05/31.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)visible
{
    if (visible) {
        return NO;
    } else {
        [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
        [_window makeKeyAndOrderFront:self];
        return YES;
    }
}

@end
