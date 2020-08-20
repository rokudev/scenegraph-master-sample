# Certification testing

This lesson describes how to prepare your channel to be published to the Roku channel store. It explains how to using Roku's test automation software and tools to verify that your channel's design and performance meets all of Roku's certification criteria.

This lesson highlights how your Roku device test suite should not only include the current devices used by Roku for certification testing, but also contain as many supported devices as possible to optimize channel performance for users across all Roku devices.

It explains how you can write state-driven UI test cases for channel purchasing, performance, deep linking, and other certification-related criteria using the [Roku Robot Framework Library](https://developer.roku.com/docs/developer-program/dev-tools/automated-channel-testing/robot-framework-library.md), [Roku JavaScript library](https://developer.roku.com/docs/developer-program/dev-tools/automated-channel-testing/javascript-library.md), another test framework, or a programming language such as Python, Java, or Go.  

It provides a quick demo of Roku's Static Analysis tool, which detects certification-related issues with your channel's code and must be passed in order for your channel to be published to the Roku channel store. It also summarizes the Channel Behavior Analysis tool, which can be used for free and ad-based channels to verify that they meet certification criteria related to performance and deep linking. It briefly covers the BrightScript Profiler, which you can use to identify parts of your channel's code where you can improve performance and memory usage.

This lesson concludes by reviewing key tips for optimizing a channel's performance.

## Resources

| Item                                                         | Location                                                     |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Certification criteria](https://developer.roku.com/docs/developer-program/certification/certification.md) | Review the Roku channel certification criteria before beginning development of your Roku channel. Understand requirements for advertising, purchases, performance, fundamental channel operation features, deep linking and the channel UI. |
| [Hardware specifications](https://developer.roku.com/docs/developer-programspecs/hardware.md)           | View the specs for the current and updatable Roku devices that you can include in your hardware test suite. This document lists the performance capabilities, including CPU and RAM, for Roku streaming players, TVs, and smart soundbars. |
| [Roku Streaming Players](https://www.roku.com/products/players) | Purchase Roku devices for your hardware test suite.          |
| [Roku test automation software](https://github.com/rokudev/automated-channel-testing) | Download Roku's test automation                              |
| [Automated channel testing guide](https://developer.roku.com/docs/developer-program/dev-tools/automated-channel-testing/automated-testing-overview.md) | Read how to use Roku's test automation software tools to write and execute test cases, including channel purchasing, performance, deep linking, and other certification-related testing. |
| [stb-tester](https://stb-tester.com/roku)                    | Get more information about the stb-tester, which is a small hardware device that you connect to your Roku device and use for executing automated test scripts. <br /><br />Note that the stb-tester is not a Roku product or in any way affiliated with Roku; however, many Roku developers do use it for automating their test processes. |
| [Static Analysis Tool guide](https://developer.roku.com/docs/developer-program/dev-tools/static-analysis-tool/static-analysis-tool.md) | Read how to use the Static Analysis tool to check the structure and syntax of your channel's code for common problems related to RAF, Roku Pay, deep linking, and other certification requirements. Channels must pass Static Analysis testing in order to be published to the Roku channel store. |
| [BrightScript Profiler Visualization Tool](http://devtools.web.roku.com/profiler/viewer/) | Use the BrightScript profiler to find where the performance and memory usage of your channel code can be improved. |
| [BrightScript Profiler guide](https://developer.roku.com/docs/developer-program/dev-tools/brightscript-profiler.md) | Read how to use the BrightScript profiler and learn about the different performance and memory usage metrics it collects and analyzes. |
| [Roku Developer Forums](https://community.roku.com/t5/Roku-Developer-Program/bd-p/roku-developer-program) | Interact with the Roku developer community. Participate in discussions on wide range of development topics from using the SceneGraph and BrightScript APIs to using certification testing tools. |
|                                                              |                                                              |

## Related

[Task node](https://developer.roku.com/docs/references/scenegraph/control-nodes/task.md)

[SceneGraph threads](https://developer.roku.com/docs/developer-program/core-concepts/threads.md)

[SceneGraph development tips for performance](https://developer.roku.com/docs/developer-program/performance-guide/development-tips.md)

[SceneGraph development tips for data management](https://developer.roku.com/docs/developer-program/performance-guide/data-management.md)

[TimeGrid node](https://developer.roku.com/docs/references/scenegraph/list-and-grid-nodes/timegrid.md)

[Designing for devices](https://developer.roku.com/docs/developer-program/design/designing-for-device-capabilities.md)
