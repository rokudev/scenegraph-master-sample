' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

sub ShowDetailsScreen(content as Object, selectedItem as Integer)
    ' create new instance of details screen
    detailsScreen = CreateObject("roSGNode", "DetailsScreen")
    detailsScreen.content = content
    detailsScreen.jumpToItem = selectedItem ' set index of item which should be focused
    detailsScreen.ObserveField("visible", "OnDetailsScreenVisibilityChanged")
    detailsScreen.ObserveField("buttonSelected", "OnButtonSelected")
    ShowScreen(detailsScreen)
end sub

sub OnDetailsScreenVisibilityChanged(event as Object) ' invoked when DetailsScreen "visible" field is changed
    visible = event.GetData()
    detailsScreen = event.GetRoSGNode()
    currentScreen = GetCurrentScreen()
    screenType = currentScreen.SubType()
    if visible = false
        if screenType = "GridScreen"
            ' update GridScreen's focus when navigate back from DetailsScreen
            currentScreen.jumpToRowItem = [m.selectedIndex[0], detailsScreen.itemFocused]
        else if screenType = "EpisodesScreen"
            ' update EpisodesScreen's focus when navigate back from DetailsScreen
            content = detailsScreen.content.GetChild(detailsScreen.itemFocused)
            currentScreen.jumpToItem = content.numEpisodes
        end if
    end if
end sub

sub OnButtonSelected(event) ' invoked when button in DetailsScreen is pressed
    details = event.GetRoSGNode()
    content = details.content
    buttonIndex = event.getData() ' index of selected button
    button = details.buttons.getChild(buttonIndex)
    selectedItem = details.itemFocused
    if button.id = "play" ' check if "Play" button is pressed
        ' create Video node and start playback
        HandlePlayButton(content, selectedItem)
    else if button.id = "see all episodes" ' check if "See all episodes" button is pressed
        ' create EpisodesScreen instance and show it
        ShowEpisodesScreen(content.GetChild(selectedItem))
    else if button.id = "continue"
        HandlePlayButton(content, selectedItem, true)
    end if
end sub

sub HandlePlayButton(content as Object, selectedItem as Integer, isResume = false as Boolean)
    itemContent = content.GetChild(selectedItem)
    ' if content child is serial with seasons
    ' we will set all episodes of serial to playlist
    if itemContent.mediaType = "series"
        children = []
        ' clone all episodes of easch season
        for each season in itemContent.getChildren(-1, 0)
            children.Append(CloneChildren(season))
        end for
        ' create new node and set all episodes of serial
        node = CreateObject("roSGNode", "ContentNode")
        node.id = itemContent.id
        node.Update({ children: children }, true)
        index = 0
        if isResume = true
            smartBookmarks = MasterChannelSmartBookmarks()
            ' episodeId contains id of the episode which should be played
            episodeId = smartBookmarks.GetSmartBookmarkForSeries(itemContent.id)
            if episodeId <> invalid and episodeId <> ""
                episode = FindNodeById(content, episodeId)
                if episode <> invalid
                    index = episode.numEpisodes
                end if
            end if
        else
            episode = node.getChild(0)
            episode.bookmarkPosition = 0
        end if
        ' create a Video node and start playback
        CheckSubscriptionAndStartPlayback(node, index, true)
    else
        if isResume = false
            itemContent.bookmarkPosition = 0
        end if
        CheckSubscriptionAndStartPlayback(content, selectedItem)
    end if
    if m.selectedIndex = invalid
        m.selectedIndex = [0, 0]
    end if
    m.selectedIndex[1] = selectedItem ' store index of selected item
end sub