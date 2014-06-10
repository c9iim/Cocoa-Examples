--
--  AppDelegate.applescript
--  Mixed language
--
--  Created by c9iim on 2014/06/04.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property theGreetAS : null
    property theGreetObjC : null
    property theGreetRb : null
    
	-- IBOutlets
	property window : missing value
	
	on applicationWillFinishLaunching:aNotification
		--
		set theGreetAS to current application's GreetAS's alloc's init
		tell theGreetAS to greet()
		--
		set theGreetObjC to current application's GreetObjC's alloc's init
		tell theGreetObjC to greet()
		--
		set theGreetRb to current application's GreetRb's alloc's init
		tell theGreetRb to greet()
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:
	
end script