# LogView
[![Version](https://img.shields.io/cocoapods/v/LogView.svg?style=flat)](https://cocoapods.org/pods/LogView)
[![License](https://img.shields.io/cocoapods/l/LogView.svg?style=flat)](https://github.com/janlionly/LogView/blob/master/LICENSE)
[![Platform](https://img.shields.io/cocoapods/p/LogView.svg?style=flat)](https://github.com/janlionly/LogView)
![Swift](https://img.shields.io/badge/%20in-swift%204.2-orange.svg)

<img src="https://github.com/janlionly/Resources/blob/main/IMG_1366.PNG" width="250" height="541">

## Description

**LogView** is a debugging tool view, you can put your interesting logs into view for showing, it support to pan for moving and show/hide using your two finger double tap.

## Installation

### CocoaPods

```ruby
pod 'LogView'
```

### Swift Package Manager

- iOS: Open Xcode, File->Swift Packages, search input **https://github.com/janlionly/LogView.git**, and then select Version Up to Next Major **1.1.2** < .
- Or add dependencies in your `Package.swift`:

```swift
.package(url: "https://github.com/janlionly/LogView.git", .upToNextMajor(from: "1.1.2")),
```

## Usage

```swift
// switch
LogView.shared.isDebug = true

DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
  let logView = LogView.shared
	// optional: your can customize initial frame
	logView.frame = CGRect(x:0, y:0, width: 200, height: 300)

	// make logView visible. Just call it only if the logView donot show.
	logView.makeVisible()

	// append your logs
	logView.append(log: "REQUEST API: xxx")
}
```

## Requirements

- iOS 9.0+
- Swift 4.2 to 5.0+

## Author

Visit my github: [janlionly](https://github.com/janlionly)<br>
Contact with me by email: janlionly@gmail.com

## Contribute

I would love you to contribute to **LogView**

## License

**LogView** is available under the MIT license. See the [LICENSE](https://github.com/janlionly/LogView/blob/master/LICENSE) file for more info.
