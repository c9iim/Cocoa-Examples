--
--  AppDelegate.applescript
--  File read write
--
--  Created by c9iim on 2014/06/02.
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
		set theSheetModal to SheetModal's alloc's init
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
    on createFile_(sender)
        set theUrl to missing value --current application's NSURL's fileURLWithPath_(POSIX path of the path to the desktop)
        set theFileTypes to {"txt", "'TEXT'"}
        set theFileName to missing value --"Untitled Document"
        tell theSheetModal to saveSheetOnWindow_at_types_name_action_(mainWindow, theUrl, theFileTypes, theFileName, {"createDone:", me})
    end createFile_
    
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
    
    on showSavePanelSheetForImage_(sender)
        set theLocation to missing value
        set theFileTypes to {"tiff"}
        set theFileName to missing value
        tell theSheetModal to saveSheetOnWindow_at_types_name_action_(mainWindow, theLocation, theFileTypes, theFileName, {"saveSheetForImageDone:", me})
    end showSavePanelSheetForImage_
    
    on showOpenPanelSheetForImage_(sender)
        set theUrl to missing value
        set theFileTypes to {"png", "PNG", "tiff"}
        tell theSheetModal to openSheetOnWindow_at_types_action_(mainWindow, theUrl, theFileTypes, {"openSheetForImageDone:", me})
    end showOpenPanelSheetForImage_
    
--==========================
    
    on createDone_(theUrl)
        set thePath to theUrl's |path|
        set theFileManager to current application's NSFileManager's defaultManager
        tell theFileManager to createFileAtPath_contents_attributes_(thePath, missing value, missing value)
        log result
    end createDone_
    
    on saveSheetDone_(theUrl)
        set theContents to current application's NSString's alloc's initWithString_("Hello world")
        set thePath to theUrl's |path|
        set NSUTF8StringEncoding to current application's NSUTF8StringEncoding
        tell theContents to writeToURL_atomically_encoding_error_(theUrl, 1, NSUTF8StringEncoding, missing value)
        log result
    end saveSheetDone_
    
    on openSheetDone_(theUrl)
        set NSString to current application's NSString
        set NSUTF8StringEncoding to current application's NSUTF8StringEncoding
        set theContents to NSString's stringWithContentsOfURL_encoding_error_(theUrl, NSUTF8StringEncoding, missing value)
        log result
    end openSheetDone_
    
    on saveSheetForImageDone_(theUrl)
        set NSBundle to current application's NSBundle
        set theSourceUrl to NSBundle's mainBundle's URLForResource_withExtension_("example", "png")
        set NSImage to current application's NSImage
        set theImage to NSImage's alloc's initWithContentsOfURL_(theSourceUrl)
        tell theImage's TIFFRepresentation to writeToURL_atomically_(theUrl, 1)
        log result
    end saveSheetForImageDone_
    
    on openSheetForImageDone_(theUrl)
        set NSImage to current application's NSImage
        set theImage to NSImage's alloc's initWithContentsOfURL_(theUrl)
        log result
    end openSheetForImageDone_
    
--==========================
    
end script