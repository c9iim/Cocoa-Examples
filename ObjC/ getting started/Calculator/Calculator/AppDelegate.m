//
//  AppDelegate.m
//  Calculator
//
//  Created by c9iim on 2014/05/30.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)calc:(id)sender
{
    double x = [_X doubleValue];
    double y = [_Y doubleValue];
    [_Z setDoubleValue:x + y];
}

@end
