' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

sub ShowVideoScreen(rowContent as Object, selectedItem as Integer, isSeries = false as Boolean)
    videoScreen = CreateObject("roSGNode", "VideoScreen") ' create an instance of videoScreen
    videoScreen.observeField("close", "OnVideoScreenClose")
    ' populate videoScreen data
    videoScreen.isSeries = isSeries
    videoScreen.content = rowContent
    videoScreen.startIndex = selectedItem
    ' append videoScreen to scene and show it
    ShowScreen(videoScreen)
end sub

sub OnVideoScreenClose(event as Object) ' invoked once videoScreen's close field is changed
    videoScreen = event.GetRoSGNode()
    close = event.GetData()
    if close = true
        CloseScreen(videoScreen) ' remove videoScreen from scene and close it
        screen = GetCurrentScreen()
        screen.SetFocus(true) ' return focus to DetailsScreen
        if m.deepLinkDetailsScreen <> invalid
            content = videoScreen.content
            if videoScreen.isSeries = true
                content = content.GetChild(videoScreen.lastIndex)
            end if
            if content <> invalid
                m.deepLinkDetailsScreen.content = content.clone(true)
            end if
        else
            ' in case of series we shouldn't change focus on DetailsScreen
            if videoScreen.isSeries = false
                screen.jumpToItem = videoScreen.lastIndex
            end if
        end if
    end if
end sub