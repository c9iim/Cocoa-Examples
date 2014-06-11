//
//  AppDelegate.m
//  Do shell script
//
//  Created by c9iim on 2014/06/11.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "AppDelegate.h"
#import "PicoShell.h"

@implementation AppDelegate

NSTask *task;
NSPipe *pipeStd;
NSPipe *pipeErr;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self task1];
    [self task2];
}

- (void)task1
{
    PicoShell *shell = [[PicoShell alloc] init];
    NSString *launchPath = @"/bin/ls";
    NSString *path = @"~/";
    NSArray *args = [NSArray arrayWithObjects:@"-l", nil];
    NSString *result = [shell doShellScript:launchPath currentDirectoryPath:path arguments:args];
    NSLog(@"task1\n%@", result);
}

- (void)task2
{
    task = [[NSTask alloc] init];
    pipeStd = [[NSPipe alloc] init];
    pipeErr = [[NSPipe alloc] init];
    PicoShell *shell = [[PicoShell alloc] initWithTask:task pipeOfStd:pipeStd pipeOfErr:pipeErr];
    NSString *launchPath = @"/bin/ls";
    NSString *path = @"~/";
    NSArray *args = [NSArray arrayWithObjects:@"-l", nil];
    [shell doShellScript:launchPath currentDirectoryPath:path arguments:args observer:self selector:@selector(readData:)];
}

- (void)readData:(NSNotification *)notification
{
	NSData *data = [[notification userInfo] valueForKey:NSFileHandleNotificationDataItem];
	NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
	NSLog(@"task2\n%@", string);
    
	if ([task isRunning]) {
		[[pipeStd fileHandleForReading] readInBackgroundAndNotify];
	} else {
		[[NSNotificationCenter defaultCenter] removeObserver:self];
	}
}

@end
