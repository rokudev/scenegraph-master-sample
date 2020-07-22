' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowDetailsScreen(content as Object, selectedItem as Integer)
    ' create new instance of details screen
    detailsScreen = CreateObject("roSGNode", "DetailsScreen")
    detailsScreen.content = content
    detailsScreen.jumpToItem = selectedItem ' set index of item which should be focused
    detailsScreen.ObserveField("visible", "OnDetailsScreenVisibilityChanged")
    detailsScreen.ObserveField("buttonSelected", "OnButtonSelected")
    ShowScreen(detailsScreen)
end sub

sub OnButtonSelected(event) ' invoked when button in DetailsScreen is pressed
    details = event.GetRoSGNode()
    content = details.content
    buttonIndex = event.getData() ' index of selected button
    selectedItem = details.itemFocused
    if buttonIndex = 0 ' check if "Play" button is pressed
        ' create Video node and start playback
        ShowVideoScreen(content, selectedItem)
    end if
end sub

sub OnDetailsScreenVisibilityChanged(event as Object) ' invoked when DetailsScreen "visible" field is changed
    visible = event.GetData()
    detailsScreen = event.GetRoSGNode()
    ' update GridScreen's focus when navigate back from DetailsScreen
    if visible = false
        m.GridScreen.jumpToRowItem = [m.selectedIndex[0], detailsScreen.itemFocused]
    end if
end sub