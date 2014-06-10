--
--  AppDelegate.applescript
--  Popover
--
--  Created by c9iim on 2014/05/27.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property NSMaxYEdge : current application's NSMaxYEdge
	
	-- IBOutlets
	property window : missing value
    property popover : missing value
	
	on togglePopover:sender
		if not popover's shown then
			tell popover to showRelativeToRect:(sender's |bounds|) ofView:sender preferredEdge:NSMaxYEdge
		end if
	end togglePopover:
	
	on applicationWillFinishLaunching:aNotification
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
end script