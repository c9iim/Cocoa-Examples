--
--  AppDelegate.applescript
--  Table View
--
--  Created by c9iim on 2014/06/06.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property NSMutableArray : class "NSMutableArray"
    property ViewDataObject : class "ViewDataObject"
	
	-- IBOutlets
	property window : missing value
    property theArrayController : missing value
	
	on applicationWillFinishLaunching_(aNotification)
        set theObjects to NSMutableArray's array
        repeat with i from 0 to 6
            set theModel to ViewDataObject's new
            set |name| of theModel to "name " & i
            set foo of theModel to "foo " & i
            tell theObjects to addObject_(theModel)
        end repeat
        tell theArrayController to setContent_(theObjects)
        end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script