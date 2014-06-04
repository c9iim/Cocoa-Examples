--
--  AppDelegate.applescript
--  File read write
--
--  Created by c9iim on 2014/05/24.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
    property mainWindow : missing value -- connect in Interface Builder
	
    ## Show open panel as sheet
    -- shows NSOpenPanel over window mainWindow
    on showOpenPanel_(sender)
        set thePanel to current application's NSOpenPanel's makeOpenAt_types_files_multiples_prompt_title_(null, {"txt"}, true, false, "Choose a text file:", "My Open Title")
        tell thePanel to showOver_calling_(mainWindow, {"openSheetDone:", me})
    end showOpenPanel_
    
    on openSheetDone_(theResult) -- called when panel closed
        if theResult = missing value then
            -- cancel button
            log "Cancel pressed"
        else
            set theFile to theResult as text -- for AppleScript command
            try
                set theFileHandle to open for access theFile
                set theText to read theFileHandle
            end try
            close access theFileHandle
            log theText
        end if
    end openSheetDone_
    
    ## Show save panel as sheet
    -- shows NSSavePanel over window mainWindow
    on showSavePanel_(sender)
        set thePanel to current application's NSSavePanel's makeSaveAt_types_name_prompt_title_(null, {"txt"}, "Some name", "Save the text data:", "My Save Title")
        tell thePanel to showOver_calling_(mainWindow, {"saveSheetDone:", me})
    end showSavePanel_
    
    on saveSheetDone_(theResult) -- called when panel closed
        if theResult = missing value then
            -- cancel button
            log "Cancel pressed"
        else
            set theFile to theResult as text -- for AppleScript command
            try
                set theFileHandle to open for access theFile write permission true
                write "Hello" to theFileHandle
            end try
            close access theFileHandle
            log "write done."
        end if
    end saveSheetDone_
    
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script