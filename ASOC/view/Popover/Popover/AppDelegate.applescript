--
--  AppDelegate.applescript
--  Popover
--
--  Created by c9iim on 2014/05/27.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
    property popover : missing value
	
    on togglePopover_(sender)
        if not popover's shown then
            tell popover to showRelativeToRect_ofView_preferredEdge_(sender's |bounds|, sender, current application's NSMaxYEdge)
        end if
    end togglePopover_
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script