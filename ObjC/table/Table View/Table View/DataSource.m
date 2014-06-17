//
//  DataSource.m
//  Table View
//
//  Created by c9iim on 2014/06/17.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "DataSource.h"

@implementation DataSource

- (id)init
{
    self = [super init];
    if (self) {
        self.content = [NSMutableArray array];
        for (int i=0; i < 10; i++) {
            [self.content addObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:
                                [NSString stringWithFormat: @"hoge %d", i], @"hoge",
                                [NSString stringWithFormat: @"moge %d", i], @"moge",
                                nil]];
        }
    }
    return self;
}

- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    NSArray *sortDescriptors = [tableView sortDescriptors];
    NSArray *sortedArray = [self.content sortedArrayUsingDescriptors:sortDescriptors];
    self.content = [sortedArray mutableCopy];
    [tableView reloadData];
}

@end
