//
//  AppDelegate.m
//  Statusbar Application
//
//  Created by c9iim on 2014/05/30.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

NSStatusItem *statusItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setupStatusbarItem:@"TEST"];
}

- (void)setupStatusbarItem:(NSString *)title {
    NSStatusBar *systemStatusBar = [NSStatusBar systemStatusBar];
    NSImage *image = [NSImage imageNamed:@"AppIconTemplate"];
    statusItem = [systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setHighlightMode:YES];
    [statusItem setTitle:title];
    [statusItem setImage:image];
    [statusItem setMenu:_statusMenu];
}

- (IBAction)showWindow:(id)sender {
    [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
    [_window makeKeyAndOrderFront:self];
}

@end
