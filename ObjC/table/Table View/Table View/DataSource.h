//
//  DataSource.h
//  Table View
//
//  Created by c9iim on 2014/06/17.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject <NSTableViewDataSource>

@property (retain) NSMutableArray *content;

@end
