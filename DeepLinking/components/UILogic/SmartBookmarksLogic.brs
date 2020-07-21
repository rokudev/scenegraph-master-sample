' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********
' Return all object with methods for smart bookmark handling
function MasterChannelSmartBookmarks()
    this = {
        LoadSmartBookmarks: LoadSmartBookmarks
        SaveSmartBookmarks: SaveSmartBookmarks
        UpdateSmartBookmarkForSeries: UpdateSmartBookmarkForSeries
        GetSmartBookmarkForSeries: GetSmartBookmarkForSeries
        RemoveSmartBookmarkForSeries: RemoveSmartBookmarkForSeries
    }
    return this
end function

' Read all smart bookmarks from the local registry
sub LoadSmartBookmarks()
    m.smartBookmarks = []
    raw = RegRead("smartBookmarks", "master_channel_bookmarks")
    if raw <> invalid
        m.smartBookmarks = ParseJson(raw)
    end if
end sub

' Save all smart bookmarks to the local registry
sub SaveSmartBookmarks()
    RegWrite("smartBookmarks", FormatJson(m.smartBookmarks), "master_channel_bookmarks")
end sub

' Update smart bookmark for specified series
sub UpdateSmartBookmarkForSeries(id, episodeId)
    if id = invalid or episodeId = invalid
        return
    end if
    ' Read smart bookmarks from registry if neaded
    if m.smartBookmarks = invalid
        m.LoadSmartBookmarks()
    end if
    success = false
    ' try to find smart bookmark for specified series and update it
    for each bookmark in m.smartBookmarks
        if bookmark.id = id
            bookmark.episodeId = episodeId
            success = true
            exit for
        end if
    end for
    ' add new smart bookmark if bookmark for specified series doesn't exist
    if not success
        m.smartBookmarks.Push({
            id: id
            episodeId: episodeId
        })
    end if
    ' save last changes
    m.SaveSmartBookmarks()
end sub
' Return last played episode id for specified series
function GetSmartBookmarkForSeries(id as String) as String
    result = ""
    ' Read smart bookmarks from registry if neaded
    if m.smartBookmarks = invalid
        m.LoadSmartBookmarks()
    end if
    ' try to find bookmark for specified series
    for each bookmark in m.smartBookmarks
        if bookmark.id = id
            result = bookmark.episodeId
            exit for
        end if
    end for
    return result
end function

' Remove smart bookmark if user finished series
sub RemoveSmartBookmarkForSeries(id as String)
    if m.smartBookmarks = invalid
        m.LoadSmartBookmarks()
    end if
    for i = 0 to m.smartBookmarks.Count() - 1
        bookmark = m.smartBookmarks[i]
        if bookmark.id = id
            m.smartBookmarks.Delete(i)
            exit for
        end if
    end for
    ' save last update to the local registry
    m.SaveSmartBookmarks()
end sub
