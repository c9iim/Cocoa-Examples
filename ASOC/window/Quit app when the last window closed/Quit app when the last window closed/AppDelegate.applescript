--
--  AppDelegate.applescript
--  Quit app when the last window closed
--
--  Created by c9iim on 2014/05/24.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
	
    on applicationShouldTerminateAfterLastWindowClosed_(sender)
		-- return current application's NSTerminateNow
        tell me to applicationShouldTerminate_(sender)
	end applicationShouldTerminateAfterLastWindowClosed_
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script