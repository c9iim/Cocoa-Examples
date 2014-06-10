    on applicationShouldHandleReopen:sender hasVisibleWindows:visible
        if visible is false then
            activate
            tell mainWindow to makeKeyAndOrderFront:me
        end if
        return yes
    end applicationShouldHandleReopen:hasVisibleWindows:
