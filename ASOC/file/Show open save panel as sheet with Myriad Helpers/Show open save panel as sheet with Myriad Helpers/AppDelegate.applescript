--
--  AppDelegate.applescript
--  Show open save panel as sheet with Myriad Helpers
--
--  Created by c9iim on 2014/06/02.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
	
	-- IBOutlets
	property window : missing value
    property mainWindow : missing value -- connect in Interface Builder
	
	on applicationWillFinishLaunching_(aNotification)
		-- Insert code here to initialize your application before any files are opened
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
    ## Show open panel as sheet
    -- shows NSOpenPanel over window mainWindow
    on showOpenPanel_(sender)
        -- set thePanel to current application's NSOpenPanel's makeOpenAt:(path to desktop) |types|:{"txt", "pdf"} |files|:true multiples:false prompt:"Choose a text or PDF file:" title:"My Open Title"
        set thePanel to current application's NSOpenPanel's makeOpenAt_types_files_multiples_prompt_title_(path to desktop, {"txt", "pdf"}, true, false, "Choose a text or PDF file:", "My Open Title")
        tell thePanel to showOver_calling_(mainWindow, {"openSheetDone:", me})
    end showOpenPanel_
    
    on openSheetDone_(theResult) -- called when panel closed
        if theResult = missing value then
            -- cancel button
            log "Cancel pressed"
        else
            log theResult -- path to file, or list of files if multiples is true
        end if
    end openSheetDone_
    
    ## Show save panel as sheet
    -- shows NSSavePanel over window mainWindow
    on showSavePanel_(sender)
        -- set thePanel to current application's NSSavePanel's makeSaveAt:(path to home folder) |types|:{"txt"} |name|:"Some name" prompt:"Save the data:" title:"My Save Title"
        set thePanel to current application's NSSavePanel's makeSaveAt_types_name_prompt_title_(path to desktop, {"txt"}, "Some name", "Save the data:", "My Save Title")
        tell thePanel to showOver_calling_(mainWindow, {"saveSheetDone:", me})
    end showSavePanel_
    
    on saveSheetDone_(theResult) -- called when panel closed
        if theResult = missing value then
            -- cancel button
            log "Cancel pressed"
        else
            log theResult -- path to file
        end if
    end saveSheetDone_
	
end script