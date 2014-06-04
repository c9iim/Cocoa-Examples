//
//  AppDelegate.m
//  File read write
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

- (IBAction)createFile:(id)sender {
    NSURL *location = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"txt", @"'TEXT'", nil];
    NSString *fileName = nil;
    [self saveSheetOnWindow:_window at:location types:fileTypes name:fileName action:@selector(createDone:)];
}

- (IBAction)showSavePanelSheetForText:(id)sender {
    NSURL *location = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"txt", @"'TEXT'", nil];
    NSString *fileName = nil;
    [self saveSheetOnWindow:_window at:location types:fileTypes name:fileName action:@selector(saveSheetForTextDone:)];
}

- (IBAction)showOpenPanelSheetForText:(id)sender {
    NSURL *location = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"txt", @"'TEXT'", nil];
    [self openSheetOnWindow:_window at:location types:fileTypes action:@selector(openSheetForTextDone:)];
}

- (IBAction)showSavePanelSheetForImage:(id)sender {
    NSURL *location = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"tiff", nil];
    NSString *fileName = nil;
    [self saveSheetOnWindow:_window at:location types:fileTypes name:fileName action:@selector(saveSheetForImageDone:)];
}

- (IBAction)showOpenPanelSheetForImage:(id)sender {
    NSURL *location = nil;
    NSArray *fileTypes = [NSArray arrayWithObjects:@"png", @"PNG", @"tiff", nil];
    [self openSheetOnWindow:_window at:location types:fileTypes action:@selector(openSheetForImageDone:)];
}

//================

- (void)createDone:(NSURL *)url {
    BOOL result = [[NSFileManager defaultManager] createFileAtPath:[url path] contents:nil attributes:nil];
    NSLog(@"%hhd", result);
}

- (void)saveSheetForTextDone:(NSURL *)url {
    NSString *contents = @"Hello world";
    BOOL result = [contents writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%hhd", result);
}

- (void)openSheetForTextDone:(NSURL *)url {
    NSString *contents = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@", contents);
}

- (void)saveSheetForImageDone:(NSURL *)url {
    NSURL *sourceUrl = [[NSBundle mainBundle] URLForResource:@"example" withExtension:@"png"];
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:sourceUrl];
    BOOL result = [[image TIFFRepresentation] writeToURL:url atomically:YES];
    NSLog(@"%hhd", result);
}

- (void)openSheetForImageDone:(NSURL *)url {
    NSImage *image = [[NSImage alloc] initWithContentsOfURL:url];
    if (image != nil) {
        NSLog(@"image loaded.");
    }
}

//================

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
