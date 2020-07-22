' ********** Copyright 2020 Roku Corp.  All Rights Reserved. **********

sub RunContentTask()
    m.contentTask = CreateObject("roSGNode", "MainLoaderTask") ' create task for feed retrieving
    ' observe content so we can know when feed content will be parsed
    m.contentTask.ObserveField("content", "OnMainContentLoaded")
    m.contentTask.control = "run" ' GetContent(see MainLoaderTask.brs) method is executed
    m.loadingIndicator.visible = true ' show loading indicator while content is loading
end sub

sub OnMainContentLoaded() ' invoked when content is ready to be used
    m.GridScreen.SetFocus(true) ' set focus to GridScreen
    m.loadingIndicator.visible = false ' hide loading indicator because content was retrieved
    m.GridScreen.content = m.contentTask.content ' populate GridScreen with content
    args = m.top.launchArgs
    if args <> invalid and ValidateDeepLink(args)
        DeepLink(m.contentTask.content, args.mediaType, args.contentId)
    end if
end sub