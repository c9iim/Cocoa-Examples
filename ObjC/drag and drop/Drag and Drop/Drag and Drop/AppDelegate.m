//
//  AppDelegate.m
//  Drag and Drop
//
//  Created by c9iim on 2014/06/03.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
}

- (void)application:(NSApplication *)sender openFiles:(NSArray *)filenames
{
    NSLog(@"%s %@", __FUNCTION__, filenames);
}

@end
