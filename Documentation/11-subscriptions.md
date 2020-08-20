# Offering subscriptions

This lesson describes how to monetize content by offering subscriptions, directly on-device, through Roku Pay. It explains how to get started with Roku Pay, including how to create a channel, in-channel products, and test users. It details the Roku Pay workflow from checking entitlements to completing purchases and granting access to content. It also summarizes how to integrate the Roku Web Service RESTful APIs into your backend system for validating, refunding, and canceling subscriptions.

The lesson then covers how to offer subscriptions in a channel by integrating the Roku SceneGraph ChannelStore component. It explains how to use the ChannelStore APIs to get subscription products from the channel's catalog, purchase products, and confirm purchases.  

This lesson also summarizes some of the channel certification requirements for offering transactional content in a channel.

## Sample channel notes

### Steps required to play content

To play the videos in the [Subscriptions sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/Subscriptions), you need to use the [Roku Developer Dashboard](https://developer.roku.com/developer) to create a channel and then configure the channel and your developer account for testing. This entails the following steps:

1. [Create a test channel](https://developer.roku.com/docs/developer-program/publishing/channel-publishing-guide.md#create-a-public-channel).
2. [Enable the channel for billing testing](https://developer.roku.com/docs/developer-program/roku-pay/testing-in-channel-purchasing.md).
3. [Create in-channel products](https://developer.roku.com/docs/developer-program/roku-pay/roku-pay-and-in-channel-purchasing.md).
4. [Add a test user](https://developer.roku.com/docs/developer-programfeatures/dashboard/overview.md#manage-test-users).

### Voiding test user transactions

To reset the purchasing workflow so that no in-channel products are associated with your test user, go to the [Developer Dashboard](https://developer.roku.com/users), select **Manage Test Users**, click **View** under the **Transactions** column, and then click **Void Transactions** to void the previous product transactions. This enables you to observe and re-test the channel behavior when a user does not have an existing Roku subscription to access content.

### Video ads

This sample channel builds upon the previous lesson, where video ads were inserted into the channel content. For continuity in the sample channel, the video ads implementation remains in the channel code; however, if you are developing a subscription video on demand (SVOD) channel, you may want to consider whether to display video ads in it.

In addition, to keep the channel demonstration segments in this lesson concise and make them more comprehensible, the pre-roll ads that you will see when running the channel have been edited out.

## Resources

| Item                                                         | Description                                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| [Subscriptions sample channel](https://github.com/rokudev/scenegraph-master-sample/tree/master/Subscriptions) | Download and review the code used in this lesson to implement Roku Pay in a channel. |
| [Sideloading channels](https://developer.roku.com/docs/developer-program/getting-started/developer-setup.md#step-2-accessing-the-development-application-installer) | Sideload and test the Subscriptions channel created in this lesson. |
| [SceneGraph ChannelStore node](https://developer.roku.com/docs/references/scenegraph/control-nodes/channelstore.md) | Read about the SceneGraph ChannelStore APIs, which are used to get subscription products from the channel's catalog, pre-populate dialogs with customers' user information, purchase products, and store and retrieve user credentials. |
| [Roku Web Service API](https://developer.roku.com/docs/developer-program/roku-pay/roku-web-service.md) | Read about the Roku Web Service RESTful API, which you can integrate into your backend system to pull transaction data in order to validate, refund, and cancel subscriptions.  Learn how to subscribe to push notifications to deliver transaction data to your service endpoint. |
| [Certification criteria for purchases](https://developer.roku.com/docs/developer-program/certification/certification.md#2-purchases) | Read the certification criteria for transactional channels (SVOD channels, TVOD channels, and other subscription services). |
| [On-device authentication](https://developer.roku.com/docs/developer-program/authentication/on-device-authentication.md#sample-channel) | Read how to validate subscriptions and purchases before granting access to content. Learn how to enable customers to sign-in to a channel directly on their Roku devices—without having to visit an external webpage. |
| [On-device authentication sample channel](https://github.com/rokudev/on-device-authentication) | Download and test a sample channel demonstrating the on-device authentication workflow. |
| [In-channel purchasing](https://developer.roku.com/docs/developer-program/roku-pay/roku-pay-and-in-channel-purchasing.md) | Read how to create in-channel products for the subscription and transactional services offered by your channel. |
| [Testing in-channel purchasing](https://developer.roku.com/docs/developer-program/roku-pay/testing-in-channel-purchasing.md) | Read how to enable your channel for billing testing.         |

## Related

[Device registry](https://developer.roku.com/docs/references/brightscript/components/roregistry.md)

[Registry section](https://developer.roku.com/docs/references/brightscript/components/roregistrysection.md)

[Dialog node](https://developer.roku.com/docs/references/scenegraph/dialog-nodes/dialog.md)

[roDateTime](https://developer.roku.com/docs/references/brightscript/interfaces/ifdatetime.md)

[Handing application events](https://developer.roku.com/docs/developer-program/core-concepts/handling-application-events.md)

[Event loops](https://developer.roku.com/docs/developer-program/core-concepts/event-loops.md)

[OnKeyEvent()](https://developer.roku.com/docs/references/scenegraph/component-functions/onkeyevent.md)

[ifSGNodeChildren interface](https://developer.roku.com/docs/references/brightscript/interfaces/ifsgnodechildren.md)
