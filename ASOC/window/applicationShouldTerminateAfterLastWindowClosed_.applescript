	on applicationShouldTerminateAfterLastWindowClosed:sender
		-- return current application's NSTerminateNow
        tell me to applicationShouldTerminate:sender
	end applicationShouldTerminateAfterLastWindowClosed:

