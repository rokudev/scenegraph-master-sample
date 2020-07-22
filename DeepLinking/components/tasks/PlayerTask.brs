' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' We need to include this library only in task which handles RAF.
Library "Roku_Ads.brs"

sub init()
    m.top.functionName = "PlayContentWithAds"   ' func to run by task
    m.top.id = "PlayerTask"
end sub

' here we retrieve all ads and configure it to our playback
sub PlayContentWithAds()
    ' `parentNode` is the node to which the stitched stream can be attached (passed as 2nd argument of renderStitchedStream)
    parentNode = m.top.GetParent()
    content = m.top.content
    m.top.lastIndex = m.top.startIndex
    items = []
    if content.getChildCount() > 0
        items = content.getChildren(-1, 0)
    else
        items = [content]
    end if
    ' This is the main entry point for instantiating the ad interface.
    ' This object manages ad server requests, parses ad structure, schedules and renders ads, and triggers tracking beacons.
    RAF = Roku_Ads()
    RAF.enableAdMeasurements(true)
    ' Set the ad URL to be used for a new getAds() request.
    RAF.SetAdUrl("")
    bookmarks = MasterChannelBookmarks()
    smartBookmarks = MasterChannelSmartBookmarks()
    keepPlay = true
    index = m.top.startIndex - 1
    itemsCount = items.Count()
    while keepPlay
        ' check if playlist isn't complete
        if itemsCount - 1 > index
            ' we need to give parentNode a focus in order to handle "back" button key press during ads retrieving
            parentNode.SetFocus(true)
            index ++
            item = items[index] ' contentNode of the video which should be played next
            if index > m.top.startIndex
                item.bookmarkPosition = 0
            end if
            ' Content details used by RAF for ad targeting
            RAF.SetContentId(item.id)
            if item.categories <> invalid
                RAF.SetContentGenre(item.categories)
            end if
            RAF.SetContentLength(int(item.length)) ' in seconds
            adPods = RAF.GetAds() ' ads retrieving
            m.top.lastIndex = index ' save the index of last played item to navigate to appropriate detailsScreen
            ' combine video and ads into a single playlist
            csasStream = RAF.constructStitchedStream(item, adPods)
            if m.top.isSeries = true
                smartBookmarks.UpdateSmartBookmarkForSeries(content.id, item.id)
            end if
            ' render the stitched stream
            keepPlay = RAF.renderStitchedStream(csasStream, parentNode)
            if keepPlay = false
                bookmarks.UpdateBookmarkForVideo(item, csasStream.position)
            else
                bookmarks.RemoveBookmarkForVideo(item.id)
            end if
        else
            if m.top.isSeries = true
                smartBookmarks.RemoveSmartBookmarkForSeries(content.id)
            end if
            keepPlay = false
        end if
    end while
end sub
