//
//  AppDelegate.h
//  Calculator
//
//  Created by c9iim on 2014/05/30.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *X;
@property (weak) IBOutlet NSTextField *Y;
@property (weak) IBOutlet NSTextField *Z;

- (IBAction)calc:(id)sender;

@end
