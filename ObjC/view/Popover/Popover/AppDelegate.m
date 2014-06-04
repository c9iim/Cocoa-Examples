//
//  AppDelegate.m
//  Popover
//
//  Created by c9iim on 2014/06/01.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)showPopover:(id)sender {
    if ([_popover isShown] == NO) {
        [_popover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    }
}

@end
