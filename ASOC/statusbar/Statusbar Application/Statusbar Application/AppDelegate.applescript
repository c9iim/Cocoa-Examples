--
--  AppDelegate.applescript
--  Statusbar Application
--
--  Created by tom on 2014/05/25.
--  Copyright (c) 2014年 tom. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property NSStatusBar : class "NSStatusBar"
    property NSImage : class "NSImage"
    property NSVariableStatusItemLength : current application's NSVariableStatusItemLength
    property statusItem : missing value
	
	-- IBOutlets
	property window : missing value
	property mainWindow : missing value
    property statusMenu : missing value
    
	on showWindow:sender
		activate
		tell mainWindow to makeKeyAndOrderFront:me
	end showWindow:
	
	on applicationWillFinishLaunching:aNotification
		tell me to setupStatusbarItem("TEST")
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
	on setupStatusbarItem(title)
		tell NSStatusBar to set systemStatusBar to systemStatusBar()
		tell systemStatusBar to statusItemWithLength:NSVariableStatusItemLength
		set statusItem to result
		tell statusItem to setHighlightMode:1
		tell statusItem to setTitle:title
		tell NSImage to imageNamed:"AppIconTemplate"
		tell statusItem to setImage:result
		tell statusItem to setMenu:statusMenu
	end setupStatusbarItem
    
end script