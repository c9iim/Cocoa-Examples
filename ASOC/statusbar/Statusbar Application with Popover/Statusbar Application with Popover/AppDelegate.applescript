--
--  AppDelegate.applescript
--  Statusbar Application with Popover
--
--  Created by c9iim on 2014/05/27.
--  Copyright (c) 2014年 c9iim. All rights reserved.
--

script AppDelegate
	property parent : class "NSObject"
    property NSStatusBar : class "NSStatusBar"
    property NSMaxYEdge : current application's NSMaxYEdge
    property NSVariableStatusItemLength : current application's NSVariableStatusItemLength
    --property PopoverAction : class "PopoverAction"
    --property thePopoverAction : null
    property statusItem : null
	
	-- IBOutlets
	property window : missing value
    property popover : missing value
	
	on setupStatusbarItem(title)
		tell NSStatusBar to set systemStatusBar to systemStatusBar()
		tell systemStatusBar to statusItemWithLength:NSVariableStatusItemLength
        set statusItem to result
		tell statusItem to setTitle:title
		tell statusItem to setHighlightMode:1
		tell statusItem to setAction:"togglePopover:"
	end setupStatusbarItem
    
	on togglePopover:sender
		if not popover's shown then
			tell popover to showRelativeToRect:(sender's |bounds|) ofView:sender preferredEdge:NSMaxYEdge
        else
			tell popover to |close|()
		end if
	end togglePopover:
    
    (*
    on togglePopover:sender
        if not popover's shown then
           tell thePopoverAction to openPopover:sender
        else
           tell thePopoverAction to closePopover:sender
        end if
    end togglePopover:
     *)
    
	on applicationWillFinishLaunching:aNotification
		--set thePopoverAction to PopoverAction's alloc's initWithPopover:popover
		tell me to setupStatusbarItem("ShowPopover")
	end applicationWillFinishLaunching:
	
	on applicationShouldTerminate:sender
		-- Insert code here to do any housekeeping before your application quits
		return current application's NSTerminateNow
	end applicationShouldTerminate:

end script