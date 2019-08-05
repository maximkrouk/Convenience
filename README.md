# Convenience

__The most convenient framework for your apps.__

[![CI Status](https://img.shields.io/travis/Maxim Krouk/Convenience.svg?style=flat)](https://travis-ci.org/Maxim Krouk/Convenience) [![Version](https://img.shields.io/cocoapods/v/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience) [![License](https://img.shields.io/cocoapods/l/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience) [![Platform](https://img.shields.io/cocoapods/p/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience)

## The story

Programming is all about data. We modify data, store it, share it. You can see it in every app you do. So I've got enaugh writing the same code for decoding and storing data, unwrapping optionals, subscripting collections and decided to... Use one folder called "Reusable" with all this stuff. And migrate it from project to project...

One day The Problem appeared. When you add anything to this folder in a new project, changes are not applied to the older ones. Xcode folder references could have solve this problem, but what if you have to work from remote and have no access to the folder?

So I decided to write this framework and share it with world. I'm gonna try make it as clean as I can, but if You find any garbage here - let me know c:

## Usage

### Storage

Every type of storage:

- Has the same interface.
- Extendable.
- Thread safe (exept of Permanent cache, thread safety for this cache will be provided later.)

**Interface**:

Any storage provided via managers is accessible as key-value pairs. You may use strings, but you'll be getting warnings, because I deprecated this approach. Natively the framework advices you to use string based enums.

In exaples I'll be using this:

```swift
enum Auth: String {
    case username
    case isAdmin
}
```

Avalible managers:

- Keychain
- UserDefaults
- Cache [temporary / presistant]

You should access any storage via providers. You may use them as static or singleton's properties.

- `Storage.[Manager].[Provider]`
- `Storage.[Manager].default.[Provider]`

Out-of-the-box providers:

- data
- bool
- string

_(More will be provided soon)_

For convenience it would be nice to extend a framework's `Storage.Provider` with your custom adapters:

```swift
extension Storage.Provider {
    subscript(key: Auth) -> Value? {
        get { get(for: key) }
        set { set(newValue, for: key) }
    }
}
```



#### Keychain

- `Storage.Keychain.data["You may use strings"] = "But better not c:".data(using: .utf8)`

- `Storage.Keychain.default.string[.username] = "SuperUser"`
- `Storage.KC.bool[.isAdmin] = true`

----

_(Working on new features and xcode docs, github documentation will be provided later.)_

## Requirements

- 📱	iOS 8.0+

## Installation

__Convenience__ is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Convenience'
```

and run `pod install` from the terminal.

## License

Convenience is available under the MIT license. See the LICENSE file for more info.



----

*Feel free to contribute or [communicate](https://twitter.com/mxcat_). I'm open to your ideas.* 🌝