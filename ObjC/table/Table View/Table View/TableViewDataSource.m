//
//  TableViewDataSource.m
//  MacRubyTableView
//
//  Created by c9iim on 2014/06/10.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "TableViewDataSource.h"

@implementation TableViewDataSource

- (id)init
{
    self = [super init];
    if (self) {
        NSMutableArray *contents = [NSMutableArray array];
        for (int i=1; i<=100; i++) {
            [contents addObject:@{
                                  @"foo":[NSString stringWithFormat:@"foo%03d",i],
                                  @"bar":[NSString stringWithFormat:@"bar%03d",i]
                                  }];
        }
        self.contents = contents;
    }
    return self;
}

- (void)tableView:(NSTableView *)tableView sortDescriptorsDidChange:(NSArray *)oldDescriptors
{
    NSArray *sortDescriptors = [tableView sortDescriptors];
    NSArray *sortedArray = [self.contents sortedArrayUsingDescriptors:sortDescriptors];
    self.contents = [sortedArray mutableCopy];
    [tableView reloadData];
}

@end
