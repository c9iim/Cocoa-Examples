//
//  SheetModal.h
//  Show open save panel as sheet
//
//  Created by c9iim on 2014/06/01.
//  Copyright (c) 2014年 c9iim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SheetModal : NSObject

- (void)saveSheetOnWindow:(id)window at:(NSURL *)url types:(NSArray *)types name:(NSString *)name action:(id)action;
- (void)openSheetOnWindow:(id)window at:(NSURL *)url types:(NSArray *)types action:(id)action;

@end
