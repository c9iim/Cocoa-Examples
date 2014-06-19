//
//  main.m
//  Statusbar Application
//
//  Created by c9iim on 2014/05/25.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
