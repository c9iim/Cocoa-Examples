--
--  AppDelegate.applescript
--  Show open save panel as sheet
--
--  Created by c9iim on 2014/06/01.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property SheetModal : class "SheetModal"
    property theSheetModal : null
	
	-- IBOutlets
	property window : missing value
    property mainWindow : missing value
	
	on applicationWillFinishLaunching:aNotification
		set theSheetModal to SheetModal's alloc's init --SheetModal's new
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
	on showSavePanelSheet:sender
		set theUrl to missing value --current application's NSURL's fileURLWithPath:(POSIX path of the (path to the desktop))
		set theFileTypes to {"txt", "'TEXT'"}
		set theFileName to missing value --"Untitled Document"
		tell theSheetModal to saveSheetOnWindow:mainWindow |at|:theUrl types:theFileTypes |name|:theFileName action:{"saveSheetDone:", me}
	end showSavePanelSheet:
	
	on showOpenPanelSheet:sender
		set theUrl to missing value --current application's NSURL's fileURLWithPath:(POSIX path of the (path to the desktop))
		set theFileTypes to {"txt", "'TEXT'"}
		tell theSheetModal to openSheetOnWindow:mainWindow |at|:theUrl types:theFileTypes action:{"openSheetDone:", me}
	end showOpenPanelSheet:
	
	on saveSheetDone:theUrl
		log theUrl
	end saveSheetDone:
	
	on openSheetDone:theUrl
		log theUrl
	end openSheetDone:
	
end script