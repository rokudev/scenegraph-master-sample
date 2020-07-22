' Copyright (c) 2020 Roku, Inc. All rights reserved.

' entry point of EpisodesListItemComponent
sub Init()
    ' store components to m for populating them with metadata
    m.poster = m.top.FindNode("poster")
    m.title = m.top.FindNode("title")
    m.description = m.top.FindNode("description")
    m.info = m.top.FindNode("info")
    ' set font size for title and description Labels
    m.title.font.size = 20
    m.description.font.size = 16
    m.info.font.size = 16
end sub

sub itemContentChanged() ' invoked when episode data is retrieved
    itemContent = m.top.itemContent ' episode metadata
    if itemContent <> invalid
        ' populate components with metadata
        m.poster.uri = itemContent.hdPosterUrl
        m.title.text = itemContent.title
        divider = " | "
        episode = "E" + itemContent.episodePosition
        time = GetTime(itemContent.length)
        date = itemContent.releaseDate
        season = itemContent.titleSeason
        m.info.text = episode + divider + date + divider + time + divider + season
        m.description.text = itemContent.description
    end if
end sub
