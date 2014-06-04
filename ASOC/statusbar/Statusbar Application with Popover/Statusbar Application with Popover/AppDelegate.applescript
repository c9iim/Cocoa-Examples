--
--  AppDelegate.applescript
--  Statusbar Application with Popover
--
--  Created by c9iim on 2014/05/27.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    --property PopoverAction : class "PopoverAction"
    --property thePopoverAction : null
    property statusItem : null
	
	-- IBOutlets
	property window : missing value
    property popover : missing value
	
    on setupStatusbarItem(title)
        tell current application's NSStatusBar to set systemStatusBar to systemStatusBar()
        tell systemStatusBar to set statusItem to statusItemWithLength_(current application's NSVariableStatusItemLength)
        tell statusItem to setTitle_(title)
        tell statusItem to setHighlightMode_(1)
        tell statusItem to setAction_("togglePopover:")
    end setupStatusbarItem
    
    on togglePopover_(sender)
        if not popover's shown then
            tell popover to showRelativeToRect_ofView_preferredEdge_(sender's |bounds|, sender, current application's NSMaxYEdge)
        else
            tell popover to |close|()
        end if
    end togglePopover_
    
    (*
    on togglePopover_(sender)
        if not popover's shown then
           tell thePopoverAction to openPopover_(sender)
        else
           tell thePopoverAction to closePopover_(sender)
        end if
    end togglePopover_
     *)
    
	on applicationWillFinishLaunching_(aNotification)
        --set thePopoverAction to PopoverAction's alloc's initWithPopover_(popover)
		tell me to setupStatusbarItem("ShowPopover")
	end applicationWillFinishLaunching_
	
	on applicationShouldTerminate_(sender)
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate_
	
end script