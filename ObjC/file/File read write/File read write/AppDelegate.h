//
//  AppDelegate.h
//  File read write
//
//  Created by c9iim on 2014/05/31.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)createFile:(id)sender;
- (IBAction)showSavePanelSheetForText:(id)sender;
- (IBAction)showOpenPanelSheetForText:(id)sender;
- (IBAction)showSavePanelSheetForImage:(id)sender;
- (IBAction)showOpenPanelSheetForImage:(id)sender;

@end
