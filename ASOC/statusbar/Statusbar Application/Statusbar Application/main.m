//
//  main.m
//  Statusbar Application
//
//  Created by tom on 2014/05/25.
//  Copyright (c) 2014年 tom. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
