LocalizationToolkit
=================================

[![Build Status](https://travis-ci.org/Digipolitan/localization-toolkit.svg?branch=master)](https://travis-ci.org/Digipolitan/localization-toolkit)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/LocalizationToolkit.svg)](https://img.shields.io/cocoapods/v/LocalizationToolkit.svg)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/LocalizationToolkit.svg?style=flat)](http://cocoadocs.org/docsets/LocalizationToolkit)
[![Twitter](https://img.shields.io/badge/twitter-@Digipolitan-blue.svg?style=flat)](http://twitter.com/Digipolitan)

LocalizationToolkit Swift is an helper for String Localization

## Installation

### CocoaPods

To install LocalizationToolkit with CocoaPods, add the following lines to your `Podfile`.

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0' # or platform :osx, '10.10' if your target is OS X.
use_frameworks!

pod 'LocalizationToolkit'
```

## The Basics

```swift
let loc = "my_loc_key".localized()
print("\(loc)")
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more details!

This project adheres to the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to [contact@digipolitan.com](mailto:contact@digipolitan.com).

## License

LocalizationToolkit is licensed under the [BSD 3-Clause license](LICENSE).
