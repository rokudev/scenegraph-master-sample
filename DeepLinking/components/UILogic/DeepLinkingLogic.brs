function GetSupportedMediaTypes() as Object ' returns AA with supported media types
    return {
        "series": "series"
        "season": "episode"
        "episode": "episode"
        "movie": "movies"
        "shortFormVideo": "shortFormVideos"
    }
end function

sub OnInputDeepLinking(event as Object)  ' invoked in case of "roInputEvent"
    args = event.getData()
    if args <> invalid and ValidateDeepLink(args) ' validate deep link arguments
        DeepLink(m.GridScreen.content, args.mediaType, args.contentId) ' Perform deep linking
    end if
end sub

' check if deep link arguments are valid
function ValidateDeepLink(args as Object) as Boolean
   mediaType = args.mediaType
   contentId = args.contentId
   types = GetSupportedMediaTypes()
   return mediaType <> invalid and contentId <> invalid and types[mediaType] <> invalid
end function

' Perform deep linking
sub DeepLink(content as Object, mediaType as String, contentId as String)
    playableItem = FindNodeById(content, contentId) ' find content for deep linking by contentId
    types = GetSupportedMediaTypes()
    ' check if chosen item has appropriate mediaType
    if playableItem <> invalid and playableItem.mediaType = types[mediaType]
        ClearScreenStack() ' remove all screen from screen stack except GridScreen
        ' looking for appropriate handler for provided mediaType
        if mediaType = "episode" or mediaType = "shortFormVideo" or mediaType = "movie"
            HandlePlayableMediaTypes(playableItem)
        else if mediaType = "season"
            HandleSeasonMediaType(playableItem)
        else if mediaType = "series"
            HandleSeriesMediaType(playableItem)
        end if
    end if
end sub

' Handler for "season" type
' Launch an EpisodesScreen that displays episodes organized by season; highlight the episode mapped to the contentid
sub HandleSeasonMediaType(content as Object)
    itemIndex = content.numEpisodes ' number of chosen episode among all seasons
    series = content.getParent().getParent() ' series node of the episode mapped to the contentid
    episodes = ShowEpisodesScreen(series, itemIndex) ' launch an EpisodesScreen
    episodes.ObserveField("visible", "OnDeepLinkDetailsScreenVisibilityChanged")
end sub

' Handler for "episode", "shortFormVideo" and "movie" types
' Play the content identified by the contentId
sub HandlePlayableMediaTypes(content as Object)
    PrepareDetailsScreen(content) ' create detailsScreen and push it to the screen stack
    CheckSubscriptionAndStartPlayback(content) ' Launch a Video
end sub

' Handler for "series" type
' Launch an episode into direct playback using smart bookmarks
sub HandleSeriesMediaType(content as Object)
    children = []
    ' clone all episodes of each season
    for each season in content.getChildren(-1, 0)
        children.Append(CloneChildren(season))
    end for
    ' create new node and set all episodes of serial
    node = CreateObject("roSGNode", "ContentNode")
    node.id = content.id
    node.Update({ children: children }, true)
    smartBookmarks = MasterChannelSmartBookmarks()
    ' episodeId contains id of the episode which should be played
    episodeId = smartBookmarks.GetSmartBookmarkForSeries(content.id)
    index = 0 ' if episodeId is invalid, launch first episode of series
    if episodeId <> invalid and episodeId <> ""
        episode = FindNodeById(content, episodeId) ' find episode by id
        if episode <> invalid
            index = episode.numEpisodes ' number of chosen episode among all seasons
        end if
    end if
    PrepareDetailsScreen(node.getChild(index)) ' create detailsScreen and push it to the screen stack
    CheckSubscriptionAndStartPlayback(node, index, true) ' launch the episode where the user stopped watching
end sub

sub PrepareDetailsScreen(content as Object)
    ' create DetailsScreen to be shown when user navigate from Video player
    ' it will contain info about played content
    m.deepLinkDetailsScreen = CreateObject("roSGNode", "DetailsScreen")
    m.deepLinkDetailsScreen.content = content
    m.deepLinkDetailsScreen.ObserveField("visible", "OnDeepLinkDetailsScreenVisibilityChanged")
    m.deepLinkDetailsScreen.ObserveField("buttonSelected", "OnDeepLinkDetailsScreenButtonSelected")
    AddScreen(m.deepLinkDetailsScreen) ' adds DetailsScreen to screen stack but don't show it 
end sub

sub OnDeepLinkDetailsScreenVisibilityChanged(event as Object) ' invoked when DetailsScreen or EpisodesScreen "visible" field is changed
    visible = event.GetData()
    screen = event.GetRoSGNode()
    if visible = false and IsScreenInScreenStack(screen) = false
        content = screen.content
        if content <> invalid
            ' jump to appropriate tile on GridScreen
            m.GridScreen.jumpToRowItem = [content.homeRowIndex, content.homeItemIndex]
            ' Invalidate deepLinkDetailsScreen if user press "Back" button on DetailsScreen
            if m.deepLinkDetailsScreen <> invalid
                m.deepLinkDetailsScreen = invalid
            end if
        end if
    end if
end sub

sub OnDeepLinkDetailsScreenButtonSelected(event as Object) ' invoked when button is  pressed on DetailsScreen
    buttonIndex = event.getData() ' index of selected button
    details = event.GetRoSGNode()
    button = details.buttons.getChild(buttonIndex)
    content = m.deepLinkDetailsScreen.content.clone(true)
    ' Start playback from the beginning if user select play button
    if button.id = "play"
        content.bookmarkPosition = 0
    end if
    CheckSubscriptionAndStartPlayback(content) ' show last played video
end sub