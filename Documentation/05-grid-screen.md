# Creating a Grid Screen

This lesson explains how to create a basic channel that gets the videos from a content feed and displays them in a grid, which contains rows of posters (thumbnail images). It demonstrates how when you scroll to a poster, it is highlighted and its name, duration, and description are displayed above the row. 

This lesson describes how to create the directory structure and manifest required by Roku channels. It shows how to create SceneGraph components, set their attributes, and create their interfaces. It details how to parse the metadata in the content feed, add the metadata to content nodes, and then add the content nodes to SceneGraph components. 

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Grid Screen sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/GridScreen) | Download and review the code used in this lesson to create a grid screen. |
| [Sideloading  Roku channels](https://developer.roku.com/docs/developer-program/getting-started/developer-setup.md#step-2-accessing-the-development-application-installer) | Sideload and test the Grid Screen channel created in this lesson. |
| [Channel directory](https://developer.roku.com/docs/developer-program/core-concepts/developing-scenegraph-applications.md) | Learn to how to create the directory structure required by Roku channels. |
| [Channel manifest](https://developer.roku.com/docs/developer-program/getting-started/architecture/channel-manifest.md) | Read how to create the manifest required by Roku channels (every channel must have a manifest so the Roku OS knows which features your channel supports). Learn about all the mandatory attributes that must be included in the manifest,  and the different optional features can be enabled in it. |

## Related

[Scene node](https://developer.roku.com/docs/references/scenegraph/abstract-nodes/scene.md)

[Overhang node](https://developer.roku.com/docs/references/scenegraph/sliding-panels-nodes/overhang.md)

[Label node](https://developer.roku.com/docs/references/scenegraph/renderable-nodes/label.md)

[RowList node](https://developer.roku.com/docs/references/scenegraph/list-and-grid-nodes/rowlist.md)

[Poster node](https://developer.roku.com/docs/references/scenegraph/renderable-nodes/poster.md)

[Event loops](https://developer.roku.com/docs/developer-program/core-concepts/event-loops.md)

[Content node](https://developer.roku.com/docs/references/scenegraph/control-nodes/contentnode.md)  

[Content meta data](https://developer.roku.com/docs/developer-program/getting-started/architecture/content-metadata.md)

[OnKeyEvent()](https://developer.roku.com/docs/references/scenegraph/component-functions/onkeyevent.md)

[ifSGNodeChildren interface](https://developer.roku.com/docs/references/brightscript/interfaces/ifsgnodechildren.md)

[Handing application events](https://developer.roku.com/docs/developer-program/core-concepts/handling-application-events.md)

[Runtime functions](https://developer.roku.com/docs/references/brightscript/language/runtime-functions.md)

[BrightScript expressions, variables, and types](https://developer.roku.com/docs/references/brightscript/language/expressions-variables-types.md)

