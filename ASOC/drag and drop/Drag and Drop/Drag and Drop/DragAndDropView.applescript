script DragAndDropView
	property parent : class "NSView"
    
    on initWithFrame_(frame)
        continue initWithFrame_(frame)
        if result is not missing value then
            -- ドラッグ受付対象の登録
            tell me to registerForDraggedTypes_({"public.file-url"})
        end if
        return me
    end initWithFrame_
    
    on drawRect_(dirtyRect)
        continue drawRect_(dirtyRect)
        -- Drawing code here.
    end drawRect_
    
    -- ドラッグ中のマウスポインタがドロップ可能領域に入った
    on draggingEntered_(sender)
        log "draggingEntered."
        return current application's NSDragOperationCopy
    end draggingEntered_
    
    (*
    -- ドラッグ中のマウスポインタがドロップ可能領域内にある
    on draggingUpdated_(sender)
        log "draggingUpdated."
        return current application's NSDragOperationCopy
    end draggingUpdated_
    
    -- ドラッグ中のマウスポインタがドロップ可能領域内から外れた
    on draggingExited_(sender)
        log "draggingExited."
    end draggingExited_
    
    -- ドロップ処理の前準備
    on prepareForDragOperation_(sender)
        log "prepareForDragOperation."
        return 1
    end prepareForDragOperation_
     *)
    
    -- ドロップ処理の実行
    on performDragOperation_(sender)
        set pasteboard to sender's draggingPasteboard
        set filenames to pasteboard's propertyListForType_(current application's NSFilenamesPboardType)
        log result
        return 1
    end performDragOperation_
    
    (*
    -- ドロップ処理の完了
    on concludeDragOperation_(sender)
        log "concludeDragOperation."
    end concludeDragOperation_
     *)
    
end script