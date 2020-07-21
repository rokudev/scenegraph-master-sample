' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Note that we need to import this file in MainScene.xml using relative path.

sub ShowGridScreen()
    m.GridScreen = CreateObject("roSGNode", "GridScreen")
    ShowScreen(m.GridScreen) ' show GridScreen
end sub