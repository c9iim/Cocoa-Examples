script DragAndDropView
	property parent : class "NSView"
    property NSFilenamesPboardType : current application's NSFilenamesPboardType
	
	on initWithFrame:frame
		continue initWithFrame:frame
		if result is not missing value then
			-- ドラッグ受付対象の登録
			tell me to registerForDraggedTypes:{"public.file-url"}
		end if
		return me
	end initWithFrame:
	
	on drawRect:dirtyRect
		continue drawRect:dirtyRect
		-- Drawing code here.
	end drawRect:
	
	-- ドラッグ中のマウスポインタがドロップ可能領域に入った
	on draggingEntered:sender
		log "draggingEntered."
		return current application's NSDragOperationCopy
	end draggingEntered:
	
    (*
	-- ドラッグ中のマウスポインタがドロップ可能領域内にある
	on draggingUpdated:sender
		log "draggingUpdated."
		return current application's NSDragOperationCopy
	end draggingUpdated:
	
	-- ドラッグ中のマウスポインタがドロップ可能領域内から外れた
	on draggingExited:sender
		log "draggingExited."
	end draggingExited:
	
	-- ドロップ処理の前準備
	on prepareForDragOperation:sender
		log "prepareForDragOperation."
		return 1
	end prepareForDragOperation:
     *)
	
	-- ドロップ処理の実行
	on performDragOperation:sender
		set pasteboard to sender's draggingPasteboard
		set filenames to pasteboard's propertyListForType:NSFilenamesPboardType
		log result
		return 1
	end performDragOperation:
	
    (*
	-- ドロップ処理の完了
	on concludeDragOperation:sender
		log "concludeDragOperation."
	end concludeDragOperation:
     *)
	
end script