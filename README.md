# Pulse

Pulse is an iOS App to viwe the upcoming sport events.

## About the APP
The app is architected using the principles of Clean/Onion Architecture, SOLID, and MVVM design pattern for UI/Interaction. I believe that this is sufficient to get a clear understanding of the code and how to navigate through it. All of it was chosen to keep things as simple as possible due to the scope of this project. Also, the app is written in Swift 5.

In the app you will find the following structure:
* Pulse - All the app code is in there
* PulseTests - All the Unit Tests

## TechDetails

>```bash
>XCode Version 14.2 (14C18)
>iOS: 12.0+
>Swift Version: 5.0
>```

### High-Level Architecture

![MVVM](https://user-images.githubusercontent.com/7543763/212557833-af3c71a2-7b95-44dc-ae08-c852c1aa1453.png)

## Getting Started

### XCode

To run the project on XCode, you just need to have iOS 15.0 supported versions of Xcode and macOS, the development was made using those support versions below.

1. macOS Monterey 12.5 or higher
2. XCode Version 13 or higher

## Improvement Points
There are a few improvement points that I wish to to cover, however due to the time restrictions and the scope of this project, I let them to the other opportunity. 

1. Create a cache system to not overload the Api with to much requests at time. At least having a limit of 30 seconds between sports request.
2. Make the app work offline, currently the app only work having a internet connection, together with the cache implementation, this will make this app more robust.

## References
[PACT](https://www.thoughtworks.com/pt/insights/blog/write-quality-mobile-apps-any-architecture)

[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
