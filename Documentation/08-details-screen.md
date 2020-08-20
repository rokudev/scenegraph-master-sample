# Creating a Details Screen

This lesson explains how to add a Details Screen to a channel. The Details Screen provides more information about the content selected in the GridScreen. It includes the item's release date, rating, genre, cast, and detailed description. It also includes a Play button for launching content into playback. The details screen enables users to confirm they want to play the content they've selected. 

This lesson describes how to build a Details Screen using more complex components that include nested children. It explains how to create a button that launches the video player, populate the details screen with content metadata that is already stored in other components, and switch the focus when the details screen is opened and closed. 

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Details Screen sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/DetailsScreen) | Download and review the code used in this lesson to create a details screen. |
| [Sideloading  Roku channels](https://developer.roku.com/docs/developer-program/getting-started/developer-setup.md#step-2-accessing-the-development-application-installer) | Sideload and test the Details Screen channel created in this lesson. |

## Related

[LayoutGroup node](https://developer.roku.com/docs/references/scenegraph/layout-group-nodes/layoutgroup.md)

[Group node](https://developer.roku.com/docs/references/scenegraph/layout-group-nodes/group.md)

[Rectangle node](https://developer.roku.com/docs/references/scenegraph/renderable-nodes/rectangle.md)

[Label node](https://developer.roku.com/docs/references/scenegraph/renderable-nodes/label.md)

[Poster node](https://developer.roku.com/docs/references/scenegraph/renderable-nodes/poster.md)

[Content node](https://developer.roku.com/docs/references/scenegraph/control-nodes/contentnode.md)  

[Content meta data](https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md)

[Handing application events](https://developer.roku.com/docs/developer-program/core-concepts/handling-application-events.md)

[Event loops](https://developer.roku.com/docs/developer-program/core-concepts/event-loops.md)

[OnKeyEvent()](https://developer.roku.com/docs/references/scenegraph/component-functions/onkeyevent.md)

[ifSGNodeChildren interface](https://developer.roku.com/docs/references/brightscript/interfaces/ifsgnodechildren.md)