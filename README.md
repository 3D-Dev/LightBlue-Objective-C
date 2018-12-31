LightBlue iOS (Obective-C)
========================
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-ObjectiveC-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

___

This project is inspired by and objective-c port of [Swift-LightBlue](https://github.com/Pluto-Y/Swift-LightBlue).
I created this project for my projects which are purely written in Obj-C and requires debugging feature like this and hope it will help someone who needs it.
It provides all features and options and project will be synchronizes with `Swift-LightBlue`.

___

Finally, if you like this project, please star it.

## Features(Developing)

The LightBlue has two mode, Central and Peripheral.

**The device as central:**
- [x] Scan the nearby peripherals and show some basic information of the peripherals.
- [x] Obtain the advertisement data.
- [x] Connect the peripheral and interrogate it.
- [x] Discover all the services and characteristics.
- [x] Decode the characteristic and service properties.
- [x] Read the data from the peripheral.
- [x] Write the data to the peripheral.
- [ ] Monitor some actions from the `CoreBluetooth`.

**The device as peripheral:**
- [ ] Add new virtual peripheral which is standard service in [Bluetooth Developer Portal](https://developer.bluetooth.org/gatt/services/Pages/ServicesHome.aspx).
- [ ] Manage service for the virtual peripheral.
- [ ] Clone the connected peripheral.
- [ ] Simulate the bluetooth hardware work process.

**Common:**
- [ ] The log of the central or peripheral events.
- [ ] Share the app to others.

## Requirements

* iOS 9.0+
* Xcode 7.0 or above
* Bluetooth 4.0


## Contact

Swift-LightBlue
[Pluto Y - Blog](http://www.pluto-y.com) or
[Sina Weibo](http://weibo.com/5690716723/info) 


LightBlue-Objective-C

[InsanelyDeepak](https://github.com/insanelydeepak)

## License
LightBlue iOS This is under the MIT license. See the LICENSE file for more info.