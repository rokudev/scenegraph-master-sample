# Creating the content feed

This lesson explains how the content feed is used to load and organize content in the channel UI. It describes how the SceneGraph [Content node](https://developer.roku.com/docs/references/scenegraph/control-nodes/contentnode.md) maps metadata in your content feed to components in your channel UI, and it provides a few tips for creating and hosting your own feed.

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Sample content feed](https://go.roku.com/Bul0OWXct)         | Examine the content feed used by the sample channel for this course. This content feed includes three content types: shortFormVideos, series, and movies.  <br />${sample-content-feed}<br />Each video in the feed includes a unique ID, name, description, thumbnail image, and URL used to populate the channel UI. In addition, each video includes a genre field that is used to categorize the videos into rows of related content. |
| [Feed specification](https://developer.roku.com/docs/developer-programspecs/direct-publisher-feed-specs/json-dp-spec.md) | You can use the Roku Direct Publisher feed spec as the guideline for your content feed, and then configure it as needed. The sample content feed, which is used by the sample channel in this course, is based on this spec. SceneGraph channels built with the Roku SDK, however, are not required to follow a certain feed specification. |
| [Roku third-party developers](https://developer.roku.com/docs/developer-program/third-party-devs.md) | Publishers needing help developing their channel or creating their content feed can contact one of Roku's third-party developers listed in this document. Each  studio in the list has successfully developer and launched Roku channels. |
| [Content Delivery Networks (CDNs) and Online Video Platforms (OVPs)](https://developer.roku.com/docs/developer-programfeatures/how-channels-work.md#content-hosting) | If you need help hosting your content feed, you can contact one of the CDNs or OVPs listed in this document. Each platform has been used by publishers to host content for their Roku channels. |

{#sample-content-feed}

- The **shortFormVideos** object in the feed contains the shorter Roku developer videos.
- The **series** object contains an **RSG** series all the videos in this SceneGraph Developer's course, and it includes a Roku Tips and Tricks series, with videos highlighting Roku products and features.
- The **movies** object contains the longer Roku developer videos.

## Related

[Content node](https://developer.roku.com/docs/references/scenegraph/control-nodes/contentnode.md)  

[Content meta data](https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md)

