//
//  AppDelegate.m
//  Statusbar Application with Popover
//
//  Created by c9iim on 2014/05/30.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

NSStatusItem *statusItem;
id popoverTransiencyMonitor;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self setupStatusbarItem:@"ShowPopover"];
}

- (void)setupStatusbarItem:(NSString *)title {
    NSStatusBar *systemStatusBar = [NSStatusBar systemStatusBar];
    statusItem = [systemStatusBar statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setHighlightMode:YES];
    [statusItem setTitle:title];
    [statusItem setAction:@selector(togglePopover:)];
}

- (void)togglePopover:(id)sender {
    if ([_popover isShown]) {
        [self closePopover:sender];
        return;
    }
    [self openPopover:sender];
}

- (void)openPopover:(id)sender {
    [_popover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    if (popoverTransiencyMonitor == nil) {
        popoverTransiencyMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseUp handler:^(NSEvent* event) {
            [self closePopover:sender];
        }];
    }
}

- (void)closePopover:(id)sender {
    if (popoverTransiencyMonitor) {
        [NSEvent removeMonitor:popoverTransiencyMonitor];
        popoverTransiencyMonitor = nil;
    }
    [_popover close];
}

@end
