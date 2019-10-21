# Convenience

**The most convenient framework for your apps.**

[![CI Status](https://travis-ci.org/maximkrouk/Convenience.svg?branch=master)](https://travis-ci.org/mx-cat/Convenience) [![Version](https://img.shields.io/cocoapods/v/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience) [![License](https://img.shields.io/cocoapods/l/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience) [![Platform](https://img.shields.io/cocoapods/p/Convenience.svg?style=flat)](https://cocoapods.org/pods/Convenience)

## The story

Programming is all about data. We modify data, store it, share it. You can see it in every app you do. So I've got enaugh writing the same code for decoding data, unwrapping optionals, subscripting collections and decided to... Use one folder called "Reusable" with all this stuff. And migrate it from project to project...

One day The Problem appeared. When you add anything to this folder in a new project, changes are not applied to the older ones. Xcode folder references could have solve this problem, but what if you have to work from remote and have no access to the folder?

So I decided to write this framework and share it with world. I'm gonna try make it as clean as I can, but if You find any garbage here - let me know c:

## Usage

### Bool

- __Toggle__

  `Bool().toggled == !Bool`

  

### CharacterSet

- __ExpressibleByStringLiteral__

  `let frameworkName = "Convenience" // == CharacterSet(charactersIn: "Convenience")`

- __Static factory__

  `.binaryDigits`

  `.hexDigits`

  

### Codable

- __Convenient coding__

  `Encodable.encode(using encoder: ConvenientEncoder = JSONEncoder())`

  `Decodable.decode(from data: Data, using encoder: ConvenientEncoder = JSONEncoder())`



### Collection

- __Safe subscripting__

  `[1 ,2, 3][safe: 10] == nil`

- __Int-ranged subscripting__ _for bidirectional collecions_

  `"String"[0] == "S"`

  `"String"[1..<3] == "tr"`

  `"String"[3...] == "ing"`

  ...

  

### Colors

- __Hex color converting__ _for NS and UI Colors_

  `[NS/UI]Color(hex: "#FA6878AA")`

  `[NS/UI]Color(hex: "#FA6878")`

  `[NS/UI]Color(hex: "FA6878")`

  `[NS/UI]Color(rgb: 0xfa6878ff)` _( from hex Int )_

  `[NS/UI]Color(rgb: 0xFA6878)`



### Data

- __Decoding__

  ```swift
  let decoding = Data().decode(to: SomeDecodable.self)
  decoding.value // SomeDecodable?
  switch decoding {
      case .success(let value):
      	  return value // SomeDecodable
      case .failure(let error):
        	vc.showAlert(with: error) // for ex.
  }
  ```

- __Getting a string__

  `Data().string(using: .ascii)`

  `Data().string()` _(UTF-8)_



### Error

- __Collect__

  ```swift
  // for now works only for () -> Void funtions
  func someThrowable() throws {}
  
  let errors: ErrorBag = Error.collect {
  		someThrowable
  		someThrowable
  		someThrowable
  }
  /* ==
  collect {
  		someThrowable
  		someThrowable
  		someThrowable
  }
  */
  
  print(errors.localizedDescription)
  // ==
  errors.contents.forEach {  
  	  print($0.localizedDescriprion)
  }
  ```

  

### Optional

- __Example__

  ```swift
  let a: Int? = 1 						 // a == 1
  a.isNil				 							 // false
  a.release() 								 // a == nil
  a.isNil				 							 // true
  let b = a.unwrap(default: 3) // a == nil, b == 3
  let c: SomeProtocol? = SomeInstance()
  let d = c.cast(to: SomeInstance.self, default: SomeInstance())
  ```

  

### NSLock

### NSRegularExpression (Regex)

### RawRepresentable

### Cast

### Modifications

### String (ns, url, regex, crypto)

### Protocols (TypeErasable, StaticNamedType)

### PlainError

----

_( + Working on new features and xcode docs (guess 90% done), github documentation will be provided later.)_

## Requirements

- 📱	iOS 8.0+

## Installation

#### SwiftPM

#### CocoaPods

__Convenience__ is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Convenience'
```

and run `pod install` from the terminal.

## License

Convenience is available under the MIT license. See the LICENSE file for more info.



----

*Feel free to contribute or [communicate](https://twitter.com/mxcat_). I'm open to your ideas.* 🌝
