--
--  AppDelegate.applescript
--  Window reopen
--
--  Created by c9iim on 2014/05/24.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
	property mainWindow : missing value -- connect in Interface Builder
    
    on applicationShouldHandleReopen:sender hasVisibleWindows:visible
        if visible is false then
            activate
            tell mainWindow to makeKeyAndOrderFront:me
        end if
        return yes
    end applicationShouldHandleReopen:hasVisibleWindows:
    
	on applicationWillFinishLaunching:aNotification
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
    
end script