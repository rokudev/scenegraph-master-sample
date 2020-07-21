' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowVideoScreen(content as Object, itemIndex as Integer)
     m.videoPlayer = CreateObject("roSGNode", "Video") ' create new instance of video node for each playback
    ' we can't set index of content which should start firstly in playlist mode.
    ' for cases when user select second, third etc. item in the row we use the following workaround
    if itemIndex <> 0 ' check if user select any but first item of the row
        numOfChildren = content.GetChildCount() ' get number of row items
        ' populate children array only with  items started from selected one.
        ' example: row has 3 items. user select second one so we must take just second and third items.
        children = content.GetChildren(numOfChildren - itemIndex, itemIndex)
        childrenClone = []
        ' go through each item of children array and clone them.
        for each child in children
        ' we need to clone item node because it will be damaged in case of video node content invalidation
            childrenClone.Push(child.Clone(false))
        end for
        ' create new parent node for our cloned items
        node = CreateObject("roSGNode", "ContentNode")
        node.Update({ children: childrenClone }, true)
        m.videoPlayer.content = node ' set node with children to video node content
    else
        ' if playback must start from first item we clone all row node
        m.videoPlayer.content = content.Clone(true)
    end if
    m.videoPlayer.contentIsPlaylist = true ' enable video playlist (a sequence of videos to be played)
    ShowScreen(m.videoPlayer) ' show video screen
    m.videoPlayer.control = "play" ' start playback
    m.videoPlayer.ObserveField("state", "OnVideoPlayerStateChange")
    m.videoPlayer.ObserveField("visible", "OnVideoVisibleChange")
end sub

sub OnVideoPlayerStateChange() ' invoked when video state is changed
    state = m.videoPlayer.state
    ' close video screen in case of error or end of playback
    if state = "error" or state = "finished"
        CloseScreen(m.videoPlayer)
    end if
end sub

sub OnVideoVisibleChange() ' invoked when video node visibility is changed
    if m.videoPlayer.visible = false and m.top.visible = true
        ' the index of the video in the video playlist that is currently playing.
        currentIndex = m.videoPlayer.contentIndex
        m.videoPlayer.control = "stop" ' stop playback
        'clear video player content, for proper start of next video player
        m.videoPlayer.content = invalid
        m.GridScreen.SetFocus(true) ' return focus to grid screen
        ' navigate to the last played item
        m.GridScreen.jumpToRowItem = [m.selectedIndex[0], currentIndex + m.selectedIndex[1]]
    end if
end sub