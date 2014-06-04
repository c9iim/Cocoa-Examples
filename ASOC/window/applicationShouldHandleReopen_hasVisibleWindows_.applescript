    on applicationShouldHandleReopen:sender hasVisibleWindows:visible
        if visible is false then
            activate
            tell mainWindow to makeKeyAndOrderFront_(me)
        end if
        return yes
    end applicationShouldHandleReopen:hasVisibleWindows:
