# Convenience

**The most convenient framework for your apps.**

[![CI Status](https://travis-ci.org/maximkrouk/Convenience.svg?branch=master)](https://travis-ci.org/mx-cat/Convenience) [![Version](https://img.shields.io/cocoapods/v/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience) [![License](https://img.shields.io/cocoapods/l/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience) [![Platform](https://img.shields.io/cocoapods/p/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience)

## The story

Programming is all about data. We modify data, store it, share it. You can see it in every app you do. So I've got enaugh writing the same code for decoding and storing data, unwrapping optionals, subscripting collections and decided to... Use one folder called "Reusable" with all this stuff. And migrate it from project to project...

One day The Problem appeared. When you add anything to this folder in a new project, changes are not applied to the older ones. Xcode folder references could have solve this problem, but what if you have to work from remote and have no access to the folder?

So I decided to write this framework and share it with world. I'm gonna try make it as clean as I can, but if You find any garbage here - let me know c:

## Usage

### Storage

Every type of storage:

- Has the same interface.
- Extendable.
- Thread safe.

#### Interface:

Any storage provided via managers is accessible as key-value pairs. You may use strings, but you'll be getting warnings, because I deprecated this approach. Natively the framework advices you to use string based enums.

In exaples I'll be using this:

```swift
enum Auth: String {
    case username // .rawValue == "username"
    case isAdmin  // .rawValue == "isAdmin"
}
```

Avalible **Managers:**

- `Keychain`

  _Shortcut: KC_

- `UserDefaults`

  _Shortcut: UD_

- `Cache` [temporary / persistent]

  _Shortcut: CH_

You can easily extend Avalible managers with your own, for example **Database:**

```
Example will be here. (or somewhere else, for now just a placeholder) c:
```

You should access any storage via providers. You may use them as static or singleton's properties.

- `Storage.[Manager].[Provider]`
- `Storage.[Manager].default.[Provider]`

Out-of-the-box **Providers:**

- `.data`
- `.bool`
- `.string`

_(More will be provided soon)_

**Providers** allow you to access storage:

- Via subscripts:
  - `provider[key]`
- Via methods:
  - `provider.get(for: key)`
  - `provider.set(value, for: key)`
- Via deprecated subscripts and methods:
  - `provider[stringKey]`
  - `provider.get(forKey: stringKey)`
  - `provider.set(value, forKey: stringKey)`

For convenience it would be nice to extend framework's `Storage.Provider` with your custom adapter subscripts:

```swift
extension Storage.Provider {
    subscript(key: Auth) -> Value? {    // Value is a Provider's assosiated type.
        get { get(for: key) }           // Just pass key to build-in getter,
        set { set(newValue, for: key) } // or key-value to build in setter.
    }
}
```

This will allow you to access storage not just like this:

- `Storage.[Manager].[Provider][Auth.username]`

but also like this:

- `Storage.[Manager].[Provider][.username]`

#### Keychain as an example:

- `Storage.Keychain.data.set(nil, forKey: "deletedItem")`
- `Storage.Keychain.data.get(forKey: "deletedItem") // nil`
- `Storage.Keychain.data["StringKeys"] = "Sucks c:".data(using: .utf8)`
- `Storage.Keychain.default.string[.username] = "Root"`
- `Storage.Keychain.default.bool[.isAdmin] = true`
- `Storage.KC.bool[.isAdmin] // true`

### Validators

For any validations you may specify your own validators by using `Validator<Value>` struct, which implements `AnyValidator` protocol. For that you should initialize it with a validation condition:

```swift
let redViewValidator = Validator<UIView>(condition : { view in
    view.backgroundColor == .red ? 
        .success(()) :
        .failure(PlainError("Passed view is not red."))
})
```

The framework provides string validators out of the box:

```swift
typealias StringValidator = Validator<String>
```

It may be initialized with regex:

```swift
let emailValidator = StringValidator(regex: .email)
let hexColorValidator = StringValidator(regex: .color, failureDescription: "It wasn't the hex color string!")
```

To perform validation call `.validate(value)`

```
emailValidator.validate("some.cool.email@example.co.uk") // .success
emailValidator.validate("#058FA2") // .failure("Regex match failed.")
```

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
