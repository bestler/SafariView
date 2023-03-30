# SafariView
<p align="center">
  <a href="https://swiftpackageindex.com/bestler/SafariView" alt="Swift Version Compatibility">
    <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbestler%2FSafariView%2Fbadge%3Ftype%3Dswift-versions" />
  </a>
	<a href="https://swiftpackageindex.com/bestler/SafariView" alt="Platform Compatibility">
    <img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fbestler%2FSafariView%2Fbadge%3Ftype%3Dplatforms" />
  </a>
  <a href="#" alt="Version">
    <img src="https://img.shields.io/static/v1?label=Version&message=1.0.0&color=brightgreen" />
  </a>
  <a href="#" alt="XCode Version">
    <img src="https://img.shields.io/static/v1?label=XCode%20Version&message=14.2&color=blue&logo=xcode" />
  </a>        
    <a href="/LICENSE">
        <img src="https://img.shields.io/github/license/stleamist/BetterSafariView?color=blue&labelColor=303840" alt="license">
    </a>
  </a>          
</p>

## About
SafariView is a package that you can use if you want to display content of the web (e.g. your website) inside your application.
In UIKit there is a component for that called `SFSafariController`, but this component is not available for SwiftUI.
If you use this package you can use it the same way as you would interact with a native SwiftUI View.

> ⚠️ **Important**\
Because this view is using SFSafariViewController be aware on the rules from Apple for that specific component. You can check the documentation [here](https://developer.apple.com/documentation/safariservices/sfsafariviewcontroller):\
"In accordance with [App Store Review Guidelines](https://developer.apple.com/app-store/review/guidelines/), this view (controller) must be used to visibly present information to users; the controller may not be hidden or obscured by other views or layers. Additionally, an app may not use this view to track users without their knowledge and consent."


## Installation and Usage

### Installation

1. Import the SwiftPackage into XCode 
    - (File/Add Packages ...)
    - Search for https://github.com/bestler/SafariView
    - Press Add Package
2. The package should show up in the Navigator on the left panel
3. Add SafariView to a sheet() or fullscreen() modifier
4. Rebuild your code

### Example Code

```swift
import SwiftUI
import SafariView

struct ContentView: View {

    @State private var isPresented = false

    var body: some View {
        Button("Open in SafariView") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            SafariView(url: URL(string: "https://apple.com")!)
        }
    }
}
```

If you want to see a whole Demo Project on how to use it, take a look [here](https://github.com/bestler/SafariViewApp).

#### Screenshots
<p align=center>
<img src="https://user-images.githubusercontent.com/68077359/228607206-2ef75d06-dc5b-4d41-829f-9bdac865531a.png" width=50%>
</p>

#### Customization
The only mandatory parameter in the initalization of this view is `url`. ⚠️ Make sure that you provide a valid URL.\
Besides that there are optional parameters that you can specify in the initializer for customization. Available parameters:
- `dismissButtonStyle`: Specifices which type of Button to use to dismiss the screen
- `preferredBarTintColor`: The color to tint the background of the navigation bar and the toolbar (default: .systemBackground)
- `preferredControlTintColor`: The color to tint the control buttons on the navigation bar and the toolbar (default: .tintColor/.accentColor)
- `isBarCollapsing`: If you scroll the title bar (default: false)
- `entersReaderIfAvailable`: A value that specifies whether Safari should enter Reader mode, if it is available (default: false)

A possible initialtation for example could be:
```swift
SafariView(
	url: URL(string: "https://apple.com")!,
	isBarCollapsing: true,
	entersReaderIfAvailable: true)
```

## Issues
If you find any bugs or you have ideas for improvements, you can create [here](https://github.com/bestler/SafariView/issues/new) an issue. Try to describe your problem as precise as possible. Feel also free to contribute and create a Pull Request.

## License
This project is licensed under the MIT License.

See [LICENSE](https://github.com/bestler/SafariView/blob/main/LICENSE) for more information.

