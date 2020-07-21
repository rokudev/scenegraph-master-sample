' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

' Channel entry point
sub Main(args as Object)
    ShowChannelRSGScreen(args)
end sub

sub ShowChannelRSGScreen(args as Object)
    ' The roSGScreen object is a SceneGraph canvas that displays the contents of a Scene node instance
    screen = CreateObject("roSGScreen")
    ' message port is the place where events are sent
    m.port = CreateObject("roMessagePort")
    ' sets the message port which will be used for events from the screen
    screen.SetMessagePort(m.port)
    ' every screen object must have a Scene node, or a node that derives from the Scene node
    scene = screen.CreateScene("MainScene")
    screen.Show() ' Init method in MainScene.brs is invoked
    scene.launchArgs = args
    inputObject=createobject("roInput")
    inputObject.setmessageport(m.port)
    ' event loop
    while(true)
        ' waiting for events from screen
        msg = wait(0, m.port)
        msgType = type(msg)
        ?"msgTyp="msgType
        if msgType = "roSGScreenEvent"
            if msg.IsScreenClosed() then return
        else if msgType = "roInputEvent"
            inputData = msg.getInfo()
            ? "input"
            ' pass the deeplink to UI
            if inputData.DoesExist("mediaType") and inputData.DoesExist("contentId")
                deeplink = {
                    contentId: inputData.contentID
                    mediaType: inputData.mediaType
                }
                scene.inputArgs = deeplink
            end if
        end if
    end while
end sub
