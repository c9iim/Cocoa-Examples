//
//  AppDelegate.h
//  Show open save panel as sheet
//
//  Created by c9iim on 2014/05/31.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)showSavePanelSheet:(id)sender;
- (IBAction)showOpenPanelSheet:(id)sender;

@end
