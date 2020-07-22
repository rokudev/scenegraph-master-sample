' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

 ' entry point of EpisodesScreen
function Init()
    ' observe "visible" so we can know when EpisodesScreen change visibility
    m.top.ObserveField("visible", "onVisibleChange")
    m.categoryList = m.top.FindNode("categoryList")
    ' observe "itemFocused" so we can know which season gain focus
    m.categoryList.ObserveField("itemFocused", "OnCategoryItemFocused")
    m.itemsList = m.top.FindNode("itemsList")
    ' observe "itemFocused" so we can know which episode gain focus
    m.itemsList.ObserveField("itemFocused", "OnListItemFocused")
    ' observe "itemSelected" so we can know which episode is selected
    m.itemsList.ObserveField("itemSelected", "OnListItemSelected")
    m.top.ObserveField("content", "OnContentChange")
end function

sub OnListItemFocused(event as Object) ' invoked when episode is focused
    focusedItem = event.GetData() ' index of episode
    ' index of season which contains focused episode
    categoryIndex = m.itemToSection[focusedItem]
    ' change focused item in seasons list
    if (categoryIndex - 1) = m.categoryList.jumpToItem
        m.categoryList.animateToItem = categoryIndex
    else if not m.categoryList.IsInFocusChain()
        m.categoryList.jumpToItem = categoryIndex
    end if
end sub

sub InitSections(content as Object)
    ' save the position of the first episode for each season
    m.firstItemInSection = [0]
    ' save the season index to which the episode belongs
    m.itemToSection = []
    ' save the title of each season
    sections = []
    sectionCount = 0
    ' goes through seasons and populate "firstItemInSection" and "itemToSection" arrays
    for each section in content.GetChildren(- 1, 0)
        itemsPerSection = section.GetChildCount()
        for each child in section.GetChildren(- 1, 0)
            m.itemToSection.Push(sectionCount)
        end for
        sections.push({title : section.title}) ' save title of each season
        m.firstItemInSection.Push(m.firstItemInSection.Peek() + itemsPerSection)
        sectionCount++
    end for
    m.firstItemInSection.Pop() ' remove last item
    m.categoryList.content = ContentListToSimpleNode(sections) ' populate categortList with list of seasons
end sub

sub OnCategoryItemFocused(event as Object) ' invoked when season is focused
    ' we shouldn't change the focus in the episodes list as soon as we have switched to the list of seasons
    if m.categoryListGainFocus = true
        m.categoryListGainFocus = false
    else
        focusedItem = event.getData() ' index of season
        ' navigate to the first episode of season
        m.itemsList.jumpToItem = m.firstItemInSection[focusedItem]
    end if
end sub

sub OnJumpToItem(event as Object) ' invoked when "jumpToItem field is changed
    itemIndex = event.GetData()
    m.itemsList.jumpToItem = itemIndex ' navigate to the specified item
end sub

sub OnContentChange() ' invoked when EpisodesScreen content is changed
    content = m.top.content
    InitSections(content) ' populate seasons list
    m.itemsList.content = content ' populate episodes list
end sub

sub onVisibleChange() ' invoked when Episodes screen becomes visible
    if m.top.visible = true
        m.itemsList.setFocus(true) ' set focus to the episodes list
    end if
end sub

sub OnListItemSelected(event as Object) ' invoked when episode is selected
    itemSelected = event.GetData() ' index of selected item
    sectionIndex = m.itemToSection[itemSelected] ' season which contains selected episode
    ' OnEpisodesScreenItemSelected method in EpisodesScreenLogic.brs is invoked when selectedItem array is populated
    m.top.selectedItem = [sectionIndex, itemSelected - m.firstItemInSection[sectionIndex]]
end sub

' The OnKeyEvent() function receives remote control key events
function OnKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ' handle "left" key press
        if key = "left" and m.itemsList.HasFocus() ' episodes list should be focused
            m.categoryListGainFocus = true
            ' navigate to seasons list
            m.categoryList.SetFocus(true)
            m.itemsList.drawFocusFeedback = false
            result = true
        ' handle "right" key press
        else if key = "right" and m.categoryList.HasFocus() ' seasons list should be focused
            m.itemsList.drawFocusFeedback = true
            ' navigate to episodes list
            m.itemsList.SetFocus(true)
            result = true
        end if
    end if
    return result
end function
