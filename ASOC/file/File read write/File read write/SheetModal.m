//
//  SheetModal.m
//  Show open save panel as sheet
//
//  Created by c9iim on 2014/06/01.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "SheetModal.h"

@implementation SheetModal

- (void)saveSheetOnWindow:(id)window at:(NSURL *)url types:(NSArray *)types name:(NSString *)name action:(id)action {
    NSSavePanel *savePanel = [NSSavePanel savePanel];
    if (url)   [savePanel setDirectoryURL:url];
    if (types) [savePanel setAllowedFileTypes:types];
    if (name)  [savePanel setNameFieldStringValue:name];
    [savePanel beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
        if (result != NSFileHandlingPanelOKButton) {
            NSLog(@"save canceled");
            return;
        }
        if (!action) return;
		NSString *sel = [action objectAtIndex:0];
		id object = [action objectAtIndex:1];
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [object performSelector:NSSelectorFromString(sel) withObject:[savePanel URL]];
    }];
}

- (void)openSheetOnWindow:(id)window at:(NSURL *)url types:(NSArray *)types action:(id)action {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    if (url)   [openPanel setDirectoryURL:url];
    if (types) [openPanel setAllowedFileTypes:types];
    [openPanel beginSheetModalForWindow:window completionHandler:^(NSInteger result) {
        if (result != NSFileHandlingPanelOKButton) {
            NSLog(@"open canceled");
            return;
        }
        if (!action) return;
		NSString *sel = [action objectAtIndex:0];
		id object = [action objectAtIndex:1];
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [object performSelector:NSSelectorFromString(sel) withObject:[openPanel URL]];
    }];
}

@end
