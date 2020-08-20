# Displaying video ads

This lesson explains how to monetize content on the Roku platform through video ads. It describes how to implement the [Roku Advertising Framework (RAF)](https://developer.roku.com/docs/developer-program/advertising/roku-advertising-framework.md) in order to seamlessly insert video ads into content. It highlights the different client and server-side ad insertion and stitching solutions provided by RAF, and explains how to get started with RAF in order to display video ads in your channel.  

This lesson then guides you through implementing Roku's [client-side ad stitching solution](https://developer.roku.com/docs/developer-program/advertising/csas.md) to combine content with video ads into a single playlist. This solution makes it so that the videos and ads play back-to-back without any buffering. This lesson also discusses [certification criteria for displaying ads](https://developer.roku.com/docs/developer-program/certification/certification.md#1-advertising) on the Roku platform, including requirements related to privacy, ad measurement, and child-directed content.

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Video ads sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/VideoAds) | Download and review the code used in this lesson to insert video ads in a channel. |
| [Sideloading channels](https://developer.roku.com/docs/developer-program/getting-started/developer-setup.md#step-2-accessing-the-development-application-installer) | Sideload and test the Video Ads channel created in this lesson. |
| [Video advertisements overview](https://developer.roku.com/docs/developer-programfeatures/monetization/video-advertisements.md) | Read an overview of video advertisements on the Roku platform. |
| [Roku partner payouts program](/developer/billing)           | Enroll in the Roku partner payouts program. Provide a payout method and tax information to monetize ad-supported content. |
| [Certification criteria for ad-supported channels](https://developer.roku.com/docs/developer-program/certification/certification.md#1-advertising) | Read the certification criteria for channels displaying ads on the Roku platform. |
| [Roku Advertising Framework overview](https://developer.roku.com/docs/developer-program/advertising/roku-advertising-framework.md) | Learn more about implementing Roku's client and server-side ad insertion solutions. |
| [Roku genres](/docs/developer-program/advertising/integrating-roku-advertising-framework.md#roku-genre-tags) | Read the list of valid genres that may be passed to RAF for proper audience measurement. |
| [Client-side ad stitching integration guide](https://developer.roku.com/docs/developer-program/advertising/csas.md) | Read how to combine content and ads into a single playlist and then render the playlist. This optimizes the video playback experience by eliminating buffering between content and ads. |

## Related

[Integrating the Roku Advertising Framework](http://confluence.portal.roku.com:8443https://developer.roku.com/docs/developer-program/advertising/integrating-roku-advertising-framework.md) 

[RAF API Reference](https://developer.roku.com/docs/developer-program/advertising/raf-api.md)

[Task node](https://developer.roku.com/docs/references/scenegraph/control-nodes/task.md)

[Video node](https://developer.roku.com/docs/references/scenegraph/media-playback-nodes/video.md)

[Content meta data](https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md)

[Handing application events](https://developer.roku.com/docs/developer-program/core-concepts/handling-application-events.md)

[Event loops](https://developer.roku.com/docs/developer-program/core-concepts/event-loops.md)

[OnKeyEvent()](https://developer.roku.com/docs/references/scenegraph/component-functions/onkeyevent.md)

[ifSGNodeChildren interface](https://developer.roku.com/docs/references/brightscript/interfaces/ifsgnodechildren.md)

[Channel manifest](https://developer.roku.com/docs/developer-program/getting-started/architecture/channel-manifest.md#launch-requirement-attributes)

