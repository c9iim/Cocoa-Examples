//
//  AppDelegate.m
//  Table View
//
//  Created by c9iim on 2014/06/05.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewDataObject.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSMutableArray *objects = [NSMutableArray array];
    for (int i = 0; i < 7; i++) {
        ViewDataObject *model = [[ViewDataObject alloc] init];
        model.name = [NSString stringWithFormat:@"name %d", i];
        model.foo = [NSString stringWithFormat:@"foo %d", i];
        [objects addObject:model];
    }
    [_tableArrayController setContent:objects];
}

@end
