# Deep linking

This lesson describes how to implement deep linking in a channel to get users to their content as fast as possible. When a user tells their Roku device to play a movie, or searches for a TV show, series, or other content, the channel must deep link directly to the requested content instead of just launching the channel's home page. For example, when a movie is selected from Roku Search, a deep link is used to launch the channel and play the film immediately without any navigation. In addition, if the user has already started watching the movie, deep linking resumes it right at the playback position bookmarked by the channel application.

This lesson details how to program your channel application to accept and process deep links upon being launched and while it is already running. It lists the different playback experiences requried for the various types of content in the channel's feed.

It explains how to create bookmarks by storing the user's playback position in the device registry or backend system, and how to use smart bookmarks to launch the most appropriate epsiode in a TV series that  based on the user's viewing history with the series.

This lesson concludes by demonstrating how to use the Roku Deep Linking Tester and cURL commands to test your channel's deep linking implementation.

## Sample channel notes

To keep the channel demonstration segments in this lesson concise and make them more comprehensible, the pre-roll ads that you will see when deep linking into content in the sample channel have been edited out.

As described in the [document for the Subscriptions video](https://github.com/rokudev/scenegraph-master-sample/blob/master/Documentation/11-subscriptions.md), you need to create a channel and then configure the channel and your developer account for testing in order to play the videos in the [Deep linking sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/DeepLinking).

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Deep linking sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/DeepLinking) | Download and review the code used in this lesson to accept and process deep links into a channel. |
| [Sideloading channels](https://developer.roku.com/docs/developer-program/getting-started/developer-setup.md#step-2-accessing-the-development-application-installer) | Sideload and test the DeepLinking channel created in this lesson. |
| [Deep linking implementation guide](https://developer.roku.com/docs/references/scenegraph/control-nodes/channelstore.md) | Read how to implement deep linking in a channel. This document highlights how deep linking works, details the required channel behavior based on the media type included in the deep link, and provides code samples demonstrating how to handle deep links upon launching the channel and while it is already running. It explains how to use the Deep Linking Tester and cURL commands to verify that a channel is programmed correctly to handle deep links. |
| [Certification criteria for deep linking](https://developer.roku.com/docs/developer-program/certification/certification.md#5-deep-linking) | Read the certification criteria for handling deep links in a channel. |
| [Roku Deep Linking Tester](http://devtools.web.roku.com/DeepLinkingTester) | Use the Deep Linking Tester tool to verify that your channel is handling deep links correctly. This tool provides a UI for configuring, saving, import/exporting, and executing deep linking test cases. |
| [Bookmarking implementation guide](https://developer.roku.com/docs/developer-program/media-playback/bookmarking.md) | Read how to record and retrieve the user's playback position for the content in your channel. Learn how bookmarking enables users to continue watching content precisely where they stopped. |

## Related

[roInput](https://developer.roku.com/docs/references/brightscript/components/roinput.md)

[Device registry](https://developer.roku.com/docs/references/brightscript/components/roregistry.md)

[Registry section](https://developer.roku.com/docs/references/brightscript/components/roregistrysection.md)

[External Control Protocol (ECP)](https://developer.roku.com/docs/developer-program/debugging/external-control-api.md)

[Measuring channel performance](https://developer.roku.com/docs/developer-program/performance-guide/measuring-channel-performance.md)

[Handing application events](https://developer.roku.com/docs/developer-program/core-concepts/handling-application-events.md)

[Event loops](https://developer.roku.com/docs/developer-program/core-concepts/event-loops.md)

[OnKeyEvent()](https://developer.roku.com/docs/references/scenegraph/component-functions/onkeyevent.md)

[ifSGNodeChildren interface](https://developer.roku.com/docs/references/brightscript/interfaces/ifsgnodechildren.md)
