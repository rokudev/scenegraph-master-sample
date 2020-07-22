' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' entry point of videoScreen
function Init()
    ' set rectangle fields
    m.top.width = 1280
    m.top.height = 720
    m.top.color="0x000000"
    ' store reference for playerTask so we can use it in other functions
    m.playerTask = m.top.FindNode("PlayerTask")
    m.playerTask.ObserveField("state", "OnPlayerTaskStateChange")   ' close screen once exited
    m.top.ObserveField("visible", "OnVisibleChanged")
end function

sub OnVisibleChanged(event as Object) ' invoked when VideoScreen visibility is changed
    visible = event.GetData()
    ' Video node content must be invalidated if videoScreen is closed but playerTask still running
    if visible = false and m.playerTask <> invalid
        m.playerTask.UnobserveField("state")
        m.playerTask.control = "STOP"
        ' Get video node wrapper created by RAF
        RAFRenderer = m.top.GetChild(m.top.GetChildCount()-1)
        if RafRenderer <> invalid
            ' Get video node
            video = RAFRenderer.getChild(0)
            if video <> invalid and LCase(video.id) = "contentvideo"
                video.content = invalid ' Reseting RAF video node content to kill it
                RAFRenderer = invalid
            end if
        end if
        m.playerTask = invalid
    end if
end sub

sub OnIndexChanged(event as Object) ' invoked when "startIndex" field is changed
    content = m.top.content
    index = event.GetData()
    ' check if content was populated
    if content <> invalid
        ' set playlist data and start task
        m.playerTask.content = content
        m.playerTask.startIndex = index
        m.playerTask.isSeries = m.top.isSeries
        m.playerTask.control = "RUN"
    end if
end sub

' close videoScreen once playerTask finished or stopped
sub OnPlayerTaskStateChange(event as Object)
    state = event.GetData()
    if (state = "done" or state = "stop") and m.playerTask <> invalid
        m.playerTask = invalid
        m.top.close = true
    end if
end sub

' The OnKeyEvent() function receives remote control key events
function OnKeyEvent(key as String, press as Boolean) as Boolean
    result = false
    if press
        ' handle "back" key press
        if key = "back" and m.playerTask <> invalid
            ' we should stop playback and close this screen when user press "back" button
            m.playerTask.control = "STOP" ' as a result OnPlayerTaskStateChange is invoked
            result = true
        end if
    end if
    return result
end function