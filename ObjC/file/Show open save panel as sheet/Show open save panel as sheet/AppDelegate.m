//
//  AppDelegate.m
//  Show open save panel as sheet
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

- (IBAction)showSavePanelSheet:(id)sender {
    NSURL *url = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"txt", @"'TEXT'", nil];
    NSString *fileName = nil;
    [self saveSheetOnWindow:_window at:url types:fileTypes name:fileName action:@selector(saveSheetDone:)];
}

- (IBAction)showOpenPanelSheet:(id)sender {
    NSURL *url = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"txt", @"'TEXT'", nil];
    [self openSheetOnWindow:_window at:url types:fileTypes action:@selector(openSheetDone:)];
}

- (void)saveSheetDone:(NSURL *)url {
    NSLog(@"%@", url);
}

- (void)openSheetDone:(NSURL *)url {
    NSLog(@"%@", url);
}

- (void)saveSheetOnWindow:(id)window at:(NSURL *)url types:(NSArray *)types name:(NSString *)name action:(SEL)action {
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    if (url)   [savePanel setDirectoryURL:url];
    if (types) [savePanel setAllowedFileTypes:types];
    if (name)  [savePanel setNameFieldStringValue:name];
    [savePanel beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
        if (result != NSFileHandlingPanelOKButton) {
            NSLog(@"save canceled");
            return;
        }
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:action withObject:[savePanel URL]];
    }];
}

- (void)openSheetOnWindow:(id)window at:(NSURL *)url types:(NSArray *)types action:(SEL)action {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    if (url)   [openPanel setDirectoryURL:url];
    if (types) [openPanel setAllowedFileTypes:types];
    [openPanel beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
        if (result != NSFileHandlingPanelOKButton) {
            NSLog(@"open canceled");
            return;
        }
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:action withObject:[openPanel URL]];
    }];
}

@end
