--
--  AppDelegate.applescript
--  Statusbar Application
--
--  Created by tom on 2014/05/25.
--  Copyright (c) 2014年 tom. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property statusItem : missing value
	
	-- IBOutlets
	property window : missing value
	property mainWindow : missing value
    property statusMenu : missing value
    
    on showWindow_(sender)
        activate
        tell mainWindow to makeKeyAndOrderFront_(me)
    end showWindow_
    
	on applicationWillFinishLaunching_(aNotification)
        tell me to setupStatusbarItem("TEST")
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
    on setupStatusbarItem(title)
        tell current application's NSStatusBar to set systemStatusBar to systemStatusBar()
        tell systemStatusBar to set statusItem to statusItemWithLength_(current application's NSVariableStatusItemLength)
        tell statusItem to setHighlightMode_(1)
        tell statusItem to setTitle_(title)
        tell current application's NSImage to imageNamed_("AppIconTemplate")
        tell statusItem to setImage_(result)
        tell statusItem to setMenu_(statusMenu)
    end setupStatusbarItem
    
end script