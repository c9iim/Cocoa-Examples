//
//  AppDelegate.m
//  Table View
//
//  Created by c9iim on 2014/06/05.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSMutableArray *contents = [NSMutableArray array];
    
//    [contents addObject:@{@"foo":@"foo1", @"bar":@"bar1"}];
//    [contents addObject:@{@"foo":@"foo2", @"bar":@"bar2"}];
//    [contents addObject:@{@"foo":@"foo3", @"bar":@"bar3"}];
    
    for (int i=1; i<=100; i++) {
        [contents addObject:@{
                              @"foo":[NSString stringWithFormat:@"foo%d",i],
                              @"bar":[NSString stringWithFormat:@"bar%d",i]
                              }];
    }
    
    self.contents = contents;
}

@end
