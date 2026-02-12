# SILiveStream

A SwiftUI SDK for live stream playback with Brightcove, including pre-live image/video and an overlay with back button and title/subtitle.

## Requirements

- iOS 14+ (or as required by your deployment target)
- Swift 5
- Xcode 14+

## Installation

### Swift Package Manager (XCFramework)

1. Add the package to your project (File → Add Package Dependencies)
2. Add **SILiveStream** to your app target.
3. Add **BrightcovePlayerSDK** (required): **File → Add Package Dependencies** → URL `https://github.com/brightcove/brightcove-player-sdk-ios` → add **BrightcovePlayerSDK** to your app target.
4. **Required for device and archive:** In your app target → **General** → **Frameworks, Libraries, and Embedded Content**, set **SILiveStream** to **Embed & Sign**.

---

## How to use

### 1. Import the module

```swift
import SwiftUI
import SILiveStream
```

### 2. Add `LiveStreamView` to your UI

Use `LiveStreamView` where you want the stream 

```swift
LiveStreamView(
    eventType: .camera,      // or .mobile
    environment: .prod,      // or .nonProd
    locale: "en",
    onBackTapped: {
        // Dismiss or pop when the user taps the overlay back button
        dismiss()
    }
)
```

### 3. Example with fullScreen Cover

struct ContentView: View {
    @State private var showLive = false

    var body: some View {
        Button("Start Live") {
            showLive = true
        }
        .fullScreenCover(isPresented: $showLive) {
            LiveStreamView(
                eventType: .camera,
                environment: .prod,
                locale: "en",
                onBackTapped: { showLive = false }
            )
        
        }
    }
}

