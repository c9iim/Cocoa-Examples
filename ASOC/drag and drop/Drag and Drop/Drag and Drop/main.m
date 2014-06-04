//
//  main.m
//  Drag and Drop
//
//  Created by c9iim on 2014/06/04.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[])
{
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
