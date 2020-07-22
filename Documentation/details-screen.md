# Creating a Details Screen

## Part 1

<video title="Roku SceneGraph Developers: Creating a Details Screen" poster="https://image.roku.com/ZHZscHItMTc2/rsg-unit8-detailsScreen.png">
    <source src="https://image.roku.com/ZHZscHItMTc2/rsg-unit8-detailsScreen-part1.mp4">
</video>

## Part 2

<video title="Roku SceneGraph Developers: Creating a Details Screen" poster="https://image.roku.com/ZHZscHItMTc2/rsg-unit8-detailsScreen.png">
    <source src="https://image.roku.com/ZHZscHItMTc2/rsg-unit8-detailsScreen-part2.mp4">
</video>

## About this lesson

This lesson explains how to add a Details Screen to a channel. The Details Screen provides more information about the content selected in the GridScreen. It includes the item's release date, rating, genre, cast, and detailed description. It also includes a Play button for launching content into playback. The details screen enables users to confirm they want to play the content they've selected. 

This lesson describes how to build a Details Screen using more complex components that include nested children. It explains how to create a button that launches the video player, populate the details screen with content metadata that is already stored in other components, and switch the focus when the details screen is opened and closed. 

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Details Screen sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/DetailsScreen) | Download and review the code used in this lesson to create a details screen. |
| [Sideloading  Roku channels](/docs/developer-program/getting-started/developer-setup.md#step-2-accessing-the-development-application-installer) | Sideload and test the Details Screen channel created in this lesson. |

## Related

[LayoutGroup node](/docs/references/scenegraph/layout-group-nodes/layoutgroup.md)

[Group node](/docs/references/scenegraph/layout-group-nodes/group.md)

[Rectangle node](/docs/references/scenegraph/renderable-nodes/rectangle.md)

[Label node](/docs/references/scenegraph/renderable-nodes/label.md)

[Poster node](/docs/references/scenegraph/renderable-nodes/poster.md)

[Content node](/docs/references/scenegraph/control-nodes/contentnode.md)  

[Content meta data](docs/developer-program/getting-started/architecture/content-metadata.md)

[Handing application events](docs/developer-program/core-concepts/handling-application-events.md)

[Event loops](docs/developer-program/core-concepts/event-loops.md)

[OnKeyEvent()](/docs/references/scenegraph/component-functions/onkeyevent.md)

[ifSGNodeChildren interface](/docs/references/brightscript/interfaces/ifsgnodechildren.md)