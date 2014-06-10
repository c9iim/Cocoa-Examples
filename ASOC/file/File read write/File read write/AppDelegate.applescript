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
    
	on applicationWillFinishLaunching:aNotification
		set theSheetModal to SheetModal's alloc's init
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
	on createFile:sender
		set theUrl to missing value --current application's NSURL's fileURLWithPath:(POSIX path of the (path to the desktop))
		set theFileTypes to {"txt", "'TEXT'"}
		set theFileName to missing value --"Untitled Document"
		tell theSheetModal to saveSheetOnWindow:mainWindow |at|:theUrl types:theFileTypes |name|:theFileName action:{"createDone:", me}
	end createFile:
    
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
    
	on showSavePanelSheetForImage:sender
		set theLocation to missing value
		set theFileTypes to {"tiff"}
		set theFileName to missing value
		tell theSheetModal to saveSheetOnWindow:mainWindow |at|:theLocation types:theFileTypes |name|:theFileName action:{"saveSheetForImageDone:", me}
	end showSavePanelSheetForImage:
	
	on showOpenPanelSheetForImage:sender
		set theUrl to missing value
		set theFileTypes to {"png", "PNG", "tiff"}
		tell theSheetModal to openSheetOnWindow:mainWindow |at|:theUrl types:theFileTypes action:{"openSheetForImageDone:", me}
	end showOpenPanelSheetForImage:
    
--==========================
    
	on createDone:theUrl
		set thePath to theUrl's |path|
		set theFileManager to current application's NSFileManager's defaultManager
		tell theFileManager to createFileAtPath:thePath |contents|:(missing value) attributes:(missing value)
		log result
	end createDone:
	
	on saveSheetDone:theUrl
		set theContents to current application's NSString's alloc's initWithString:"Hello world"
		set thePath to theUrl's |path|
		set NSUTF8StringEncoding to current application's NSUTF8StringEncoding
		tell theContents to writeToURL:theUrl atomically:1 encoding:NSUTF8StringEncoding |error|:(missing value)
		log result
	end saveSheetDone:
	
	on openSheetDone:theUrl
		set NSString to current application's NSString
		set NSUTF8StringEncoding to current application's NSUTF8StringEncoding
		set theContents to NSString's stringWithContentsOfURL:theUrl encoding:NSUTF8StringEncoding |error|:(missing value)
		log result
	end openSheetDone:
	
	on saveSheetForImageDone:theUrl
		set NSBundle to current application's NSBundle
		set theSourceUrl to NSBundle's mainBundle's URLForResource:"example" withExtension:"png"
		set NSImage to current application's NSImage
		set theImage to NSImage's alloc's initWithContentsOfURL:theSourceUrl
		tell theImage's TIFFRepresentation to writeToURL:theUrl atomically:1
		log result
	end saveSheetForImageDone:
	
	on openSheetForImageDone:theUrl
		set NSImage to current application's NSImage
		set theImage to NSImage's alloc's initWithContentsOfURL:theUrl
		log result
	end openSheetForImageDone:
    
--==========================
    
end script