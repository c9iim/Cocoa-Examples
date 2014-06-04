//
//  AppDelegate.h
//  Popover
//
//  Created by c9iim on 2014/06/01.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSPopover *popover;

- (IBAction)showPopover:(id)sender;

@end
