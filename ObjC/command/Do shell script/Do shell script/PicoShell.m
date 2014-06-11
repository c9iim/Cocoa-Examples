//
//  PicoShell.m
//  Do shell script
//
//  Created by c9iim on 2014/06/12.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "PicoShell.h"

@implementation PicoShell

NSTask *_task;
NSPipe *_pipeStd;
NSPipe *_pipeErr;

- (id)init
{
    self = [super init];
    if (self) {
        _task = [[NSTask alloc] init];
        _pipeStd = [[NSPipe alloc] init];
        _pipeErr = [[NSPipe alloc] init];
        [_task setStandardOutput:_pipeStd];
        [_task setStandardError:_pipeErr];
    }
    return self;
}

- (id)initWithTask:(NSTask *)task pipeOfStd:(NSPipe *)pipeStd pipeOfErr:(NSPipe *)pipeErr
{
    self = [super init];
    if (self) {
        _task = task;
        _pipeStd = pipeStd;
        _pipeErr = pipeErr;
        [_task setStandardOutput:_pipeStd];
        [_task setStandardError:_pipeErr];
    }
    return self;
}

- (void)doShellScript:(NSString *)launchPath currentDirectoryPath:(NSString *)path arguments:(NSArray *)args observer:(id)observer selector:(SEL)sel
{
    [_task setLaunchPath:launchPath];
    if (path) [_task setCurrentDirectoryPath:path];
    if (args) [_task setArguments:args];
	[_task launch];
    [[NSNotificationCenter defaultCenter] addObserver:observer selector:sel name:NSFileHandleReadCompletionNotification object:nil];
	[[_pipeStd fileHandleForReading] readInBackgroundAndNotify];
}

- (NSString *)doShellScript:(NSString *)launchPath currentDirectoryPath:(NSString *)path arguments:(NSArray *)args
{
    [_task setLaunchPath:launchPath];
    if (path) [_task setCurrentDirectoryPath:path];
    if (args) [_task setArguments:args];
    [_task launch];
    NSString *strStd = [self availableDataOf:_pipeStd];
    NSString *strErr = [self availableDataOf:_pipeErr];
    return [strErr length] == 0 ? strStd:strErr;
}

- (NSString *)availableDataOf:(NSPipe *)pipe {
    NSFileHandle *handle = [pipe fileHandleForReading];
    NSData *data = [handle availableData];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}


@end
