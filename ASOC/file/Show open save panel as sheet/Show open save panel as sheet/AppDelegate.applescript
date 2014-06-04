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
	
	on applicationWillFinishLaunching_(aNotification)
		set theSheetModal to SheetModal's alloc's init --SheetModal's new
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
    on showSavePanelSheet_(sender)
        set theUrl to missing value --current application's NSURL's fileURLWithPath_(POSIX path of the path to the desktop)
        set theFileTypes to {"txt", "'TEXT'"}
        set theFileName to missing value --"Untitled Document"
        tell theSheetModal to saveSheetOnWindow_at_types_name_action_(mainWindow, theUrl, theFileTypes, theFileName, {"saveSheetDone:", me})
    end showSavePanelSheet_
    
    on showOpenPanelSheet_(sender)
        set theUrl to missing value --current application's NSURL's fileURLWithPath_(POSIX path of the path to the desktop)
        set theFileTypes to {"txt", "'TEXT'"}
        tell theSheetModal to openSheetOnWindow_at_types_action_(mainWindow, theUrl, theFileTypes, {"openSheetDone:", me})
    end showOpenPanelSheet_
    
    on saveSheetDone_(theUrl)
        log theUrl
    end saveSheetDone_
    
    on openSheetDone_(theUrl)
        log theUrl
    end openSheetDone_
    
end script