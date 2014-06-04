//
//  main.m
//  Mixed language
//
//  Created by c9iim on 2014/06/04.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

#import <RubyCocoa/RBRuntime.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    RBApplicationInit("rb_main.rb", argc, (const char **)argv, nil);
    return NSApplicationMain(argc, argv);
}
