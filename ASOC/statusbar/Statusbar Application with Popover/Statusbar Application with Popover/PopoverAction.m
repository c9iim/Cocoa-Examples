//
//  PopoverAction.m
//  Statusbar Application with Popover
//
//  Created by c9iim on 2014/05/30.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "PopoverAction.h"

@implementation PopoverAction

id popoverTransiencyMonitor;

- (id)initWithPopover:(NSPopover*)popover
{
    if (self = [super init]) {
        _popover = popover;
    }
    return self;
}

- (void)openPopover:(id)sender
{
    [_popover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxYEdge];
    if (popoverTransiencyMonitor == nil) {
        popoverTransiencyMonitor = [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseUp handler:^(NSEvent* event) {
            [self closePopover:sender];
        }];
    }
}

- (void)closePopover:(id)sender
{
    if (popoverTransiencyMonitor) {
        [NSEvent removeMonitor:popoverTransiencyMonitor];
        popoverTransiencyMonitor = nil;
    }
    [_popover close];
}

@end
