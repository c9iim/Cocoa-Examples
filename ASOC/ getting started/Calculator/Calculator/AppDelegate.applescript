--
--  AppDelegate.applescript
--  Calculator
--
--  Created by c9iim on 2014/05/30.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
    property X : missing value
    property Y : missing value
    property Z : missing value
	
    on calc_(sender)
        set _x to X's doubleValue as real
        set _y to Y's doubleValue as real
        tell Z to setDoubleValue_(_x + _y)
    end calc_
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened 
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits 
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script