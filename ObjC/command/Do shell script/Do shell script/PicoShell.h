//
//  PicoShell.h
//  Do shell script
//
//  Created by c9iim on 2014/06/12.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PicoShell : NSObject

- (id)initWithTask:(NSTask *)task pipeOfStd:(NSPipe *)pipeStd pipeOfErr:(NSPipe *)pipeErr;

- (NSString *)doShellScript:(NSString *)launchPath currentDirectoryPath:(NSString *)path arguments:(NSArray *)args;
- (void)doShellScript:(NSString *)launchPath currentDirectoryPath:(NSString *)path arguments:(NSArray *)args observer:(id)observer selector:(SEL)sel;

@end
