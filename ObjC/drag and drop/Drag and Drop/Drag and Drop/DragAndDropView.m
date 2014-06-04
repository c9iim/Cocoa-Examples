//
//  DragAndDropView.m
//  Drag and Drop
//
//  Created by c9iim on 2014/06/04.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import "DragAndDropView.h"

@implementation DragAndDropView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // ドラッグ受付対象の登録
        [self registerForDraggedTypes:@[NSFilenamesPboardType]];
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

// ドラッグ中のマウスポインタがドロップ可能領域に入った
- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
    NSLog(@"%s", __FUNCTION__);
    return NSDragOperationCopy;
}

/*
// ドラッグ中のマウスポインタがドロップ可能領域内にある
- (NSDragOperation)draggingUpdated:(id<NSDraggingInfo>)sender
{
    NSLog(@"%s", __FUNCTION__);
    return NSDragOperationCopy;
}

// ドラッグ中のマウスポインタがドロップ可能領域内から外れた
- (void)draggingExited:(id <NSDraggingInfo>)sender
{
    NSLog(@"%s", __FUNCTION__);
}

// ドロップ処理の前準備
- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender
{
    NSLog(@"%s", __FUNCTION__);
    return YES;
}
 */

// ドロップ処理の実行
- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
    NSPasteboard *pasteboard = [sender draggingPasteboard];
    NSArray *filenames = [pasteboard propertyListForType:NSFilenamesPboardType];
    NSLog(@"%s %@", __FUNCTION__, filenames);
    return YES;
}

/*
// ドロップ処理の完了
- (void)concludeDragOperation:(id<NSDraggingInfo>)sender
{
    NSLog(@"%s", __FUNCTION__);
}
 */

@end
