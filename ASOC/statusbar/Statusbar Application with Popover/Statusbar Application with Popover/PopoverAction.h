//
//  PopoverAction.h
//  Statusbar Application with Popover
//
//  Created by c9iim on 2014/05/30.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PopoverAction : NSObject

@property (nonatomic) NSPopover *popover;

- (id)initWithPopover:(NSPopover*)popover;
- (void)openPopover:(id)sender;
- (void)closePopover:(id)sender;

@end
