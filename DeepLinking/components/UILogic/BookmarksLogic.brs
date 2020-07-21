' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' return object with all methods for bookmarks logic handling
function MasterChannelBookmarks()
    this = {
        LoadBookmarks:          LoadBookmarks
        SaveBookmarks:          SaveBookmarks
        UpdateBookmarkForVideo: UpdateBookmarkForVideo
        GetBookmarkForVideo:    GetBookmarkForVideo
        RemoveBookmarkForVideo: RemoveBookmarkForVideo
        ClearBookmarks:         ClearBookmarks
    }
    return this
end function

' Read all bookmarks from the local registry
sub LoadBookmarks()
    m.bookmarks = []
    raw = RegRead("bookmarks", "master_channel_bookmarks")
    if raw <> invalid
        m.bookmarks = ParseJson(raw)
    end if
end sub

' Store all bookmarks to the local registry
sub SaveBookmarks()
    RegWrite("bookmarks", FormatJson(m.bookmarks), "master_channel_bookmarks")
end sub

' update position for last played content
sub UpdateBookmarkForVideo(video as Object, position as Integer)
    if position = invalid or position <= 0 or video.id = invalid or video.mediaType = "series"
        return
    end if
    ' Load bookmarks from local registry if neaded
    if m.bookmarks = invalid
        m.LoadBookmarks()
    end if
    success = false
    ' try to find previously stored bookmark for specified content and update it if bookmark exists
    for each bookmark in m.bookmarks
        if bookmark.id = video.id
            bookmark.position = position 
            success = true
            exit for
        end if
    end for
    ' add new bookmark if bookmark for specified content doesn't exist
    if not success
        m.bookmarks.Push({
            id:         video.id
            position:   position
        })
    end if
    m.SaveBookmarks()
end sub

' return start position for specified video
function GetBookmarkForVideo(video)
    result = 0
    ' Load bookmarks from local registry if neaded
    if m.bookmarks = invalid
        m.LoadBookmarks()
    end if
    ' try to find bookmark for specified video
    for each bookmark in m.bookmarks
        if bookmark.id = video.id
          result = bookmark.position
          exit for
        end if
    end for
    ' start position in seconds
    return result
end function
' remove bookmark if user finished video
sub RemoveBookmarkForVideo(id as String)
    ' Load bookmarks from local registry if neaded
    if m.bookmarks = invalid
        m.LoadBookmarks()
    end if
    ' try to find bookmark for specified video and delete it 
    for i = 0 to m.bookmarks.Count() - 1
        bookmark = m.bookmarks[i]
        if bookmark.id = id
            m.bookmarks.Delete(i)
            exit for
        end if
    end for
    ' save last update to the local storage
    m.SaveBookmarks()
end sub

' Remove all bookmarks
sub ClearBookmarks()
    m.bookmarks = []
    m.SaveBookmarks()
end sub
