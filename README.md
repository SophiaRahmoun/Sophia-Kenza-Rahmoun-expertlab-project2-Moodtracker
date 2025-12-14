# MoodTracker App – Expertlab Project 2

This SwiftUI-based iOS app allows users to **track their mood**, **view their emotions on a calendar**, and **visualize weather data** via external APIs – all without user authentication. The app also integrates widgets and custom data inputs for a smooth and personal experience.

## Key Features

- Mood input with emoji and text
- Calendar view showing moods per day
- Weather API integration (location-based)
- Light & Dark Mode support
- Custom widgets (small, medium, large)
- Responsive layout and basic accessibility
- ImagePicker for adding a daily photo
- Permissions handling (location, gallery)
- Personal backend with Node.js + MongoDB
- Custom preferences using SwiftUI's `.preference()`

## Learning Goals Achieved

- Learn how to **use a user's data** without authentication
- Work with **external APIs** (`weatherapi.com`)
- Implement **ImagePicker** with permission handling
- Understand and create **Widgets** with timelines
- Explore **CloudKit** and **WidgetKit** limitations
- Deal with **data modeling and state management**
- Practice **responsive design** in SwiftUI

## Limitations & possible improvements

- CloudKit and push notifications require a paid Apple Developer account
- Widget data sharing is currently restricted
- No support yet for Apple Watch
- Future: connect users to local psychologists based on location & mood,...

---

## Technical Documentation & References

These links helped troubleshoot and implement features:

- [Fixing “Cannot preview in this file…” error](https://stackoverflow.com/questions/58416469/cannot-preview-in-this-file-active-scheme-does-not-build-this-file-swiftui-o)
- [Apple’s CLLocationManager (CoreLocation)](https://developer.apple.com/documentation/corelocation/cllocationmanager)
- [Info.plist Configuration (Apple Docs)](https://developer.apple.com/documentation/bundleresources/information-property-list)
- [Using SwiftUI Preferences](https://developer.apple.com/documentation/swiftui/preferences)
- [Fixing AZERTY Keyboard for SecureField](https://stackoverflow.com/questions/60993061/keyboard-layout-changes-from-azerty-to-qwerty-for-secure-text-field-swift)
- [“Expression is not assignable” error](https://stackoverflow.com/questions/17973073/expression-is-not-assignable-error)
- [Sharing Data Between App & Widget (Issue)](https://stackoverflow.com/questions/66435806/how-to-share-data-between-main-app-and-widgets)
- [SwiftUI Data Sharing with Widget](https://stackoverflow.com/questions/63922032/share-data-between-main-app-and-widget-in-swiftui)
- [ChatGPT debug session on Widget Data](https://chatgpt.com/share/693f2c8a-94d4-8006-98d8-f36895316faf)

---

## Extra Exercise: Widgets Playground

A separate test app to focus on widgets:
> 👉 [Widget Experiment Repo](https://github.com/SophiaRahmoun/sophia-kenza-rahmoun-expertlab-widgets-proberen)

---

##  Other Expertlab Projects

- **Project 1 – Villo App Rebuild (UX/UI + API + Auth)**  
  [Villo Rebuild Repo](https://github.com/SophiaRahmoun/Sophia-Kenza-Rahmoun-expertlab-project1-UIRebuild)

- **Project 3 – Animated Portfolio App**  
  [ Portfolio App Repo](https://github.com/SophiaRahmoun/Sophia-Kenza-Rahmoun-expertlab-project3-PortfolioApp)


