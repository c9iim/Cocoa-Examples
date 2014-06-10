--
--  AppDelegate.applescript
--  Table View
--
--  Created by c9iim on 2014/06/06.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
    property theArrayController : missing value
	
	on applicationWillFinishLaunching_(aNotification)
        set theContents to {}
        repeat with i from 1 to 100
            copy {foo:"foo" & i, bar:"bar" & i} to the end of theContents
        end repeat
        tell theArrayController to setContent_(theContents)
    end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script

