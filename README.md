# SBAutoLayout

[![Version](https://img.shields.io/cocoapods/v/SBAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SBAutoLayout)
[![License](https://img.shields.io/cocoapods/l/SBAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SBAutoLayout)
[![Platform](https://img.shields.io/cocoapods/p/SBAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SBAutoLayout)

SBAutoLayout is an extension for UIView that makes it easy to perform common auto layout operations in Swift without having to write verbose auto layout syntax.

## A few examples

Pin to superview center with height and width:

```
view.pinWidth(100)
view.pinHeight(100)
view.pinToSuperviewCenter()
```
![IMG](https://raw.githubusercontent.com/SteveBarnegren/SBAutoLayout/master/ScreenShots/Centered.png)


Some views can be positioned with only one line of code:

```
view.pinToSuperviewAsTopStrip(height: 50)
```
![IMG](https://raw.githubusercontent.com/SteveBarnegren/SBAutoLayout/master/ScreenShots/TopStrip.png)

All methods return generated constraints. Handy for if you need to remove or change them later. 

```
let topConstraint = view.pinToSuperviewTop(60)
view.pinToSuperviewBottom(40)
view.pinToSuperviewLeading(15)
view.pinToSuperviewTrailing(15)

// ...Later
topConstraint.constant = 30
```
![IMG](https://raw.githubusercontent.com/SteveBarnegren/SBAutoLayout/master/ScreenShots/SuperviewEdges.png)

Multiple views? Sure.

```
blueView.pinToSuperviewCenter()
blueView.pinHeight(100)
blueView.pinAspectRatio(width: 1, height: 1)

orangeView.pinToSuperviewCenterX()
orangeView.pinHeight(80)
orangeView.pinAspectRatio(width: 1, height: 1)
orangeView.pinAboveView(blueView, separation: 10)
```

![IMG](https://raw.githubusercontent.com/SteveBarnegren/SBAutoLayout/master/ScreenShots/TwoViews.png)

## Full method list

**Pin width / height**

```
func pinWidth(_ width: CGFloat)  
  
func pinHeight(_ height: CGFloat)
    
func pinAspectRatio(width: CGFloat, height: CGFloat)
```

**Pin to superview edges**

```    
func pinToSuperviewEdges()
    
func pinToSuperviewEdges(top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat)
    
func pinToSuperviewEdges(insets: UIEdgeInsets)
   
    
func pinToSuperviewTop(_ margin: CGFloat)
    
func pinToSuperviewBottom(_ margin: CGFloat)
    
func pinToSuperviewLeft(_ margin: CGFloat)
    
func pinToSuperviewRight(_ margin: CGFloat)
    
func pinToSuperviewLeading(_ margin: CGFloat)
    
func pinToSuperviewTrailing(_ margin: CGFloat)
```

**Pin to safe area**

```
func pinToSafeAreaTop(_ margin: CGFloat = 0)

func pinToSafeAreaRight(_ margin: CGFloat = 0)

func pinToSafeAreaBottom(_ margin: CGFloat = 0)

func pinToSafeAreaLeft(_ margin: CGFloat = 0)
```

**Pin to superview as strip**

```   
func pinToSuperviewAsTopStrip(height: CGFloat)
    
func pinToSuperviewAsBottomStrip(height: CGFloat)
    
func pinToSuperviewAsLeftStrip(width: CGFloat)
    
func pinToSuperviewAsRightStrip(width: CGFloat)
    
func pinToSuperviewAsLeadingStrip(width: CGFloat)

func pinToSuperviewAsTrailingStrip(width: CGFloat)
```

**Pin to superview center**

```
func pinToSuperviewCenterX(offset: CGFloat = 0)
    
func pinToSuperviewCenterY(offset: CGFloat = 0)
    
func pinToSuperviewCenter()
```

**Pin above / below other views**

```
func pinAboveView(_ otherView: UIView, separation: CGFloat = 0)
    
func pinBelowView(_ otherView: UIView, separation: CGFloat = 0)
```

**Pin to left / right / leading / trailing other views**

``` 
func pinToLeftOfView(_ otherView: UIView, separation: CGFloat = 0)
    
func pinToRightOfView(_ otherView: UIView, separation: CGFloat = 0)
    
func pinTrailingFromView(_ otherView: UIView, separation: CGFloat = 0)
    
func pinLeadingToView(_ otherView: UIView, separation: CGFloat = 0)
```    
   
**Match width / height of other views**  
    
```
func pinWidthToSameAsView(_ otherView: UIView)
    
func pinHeightToSameAsView(_ otherView: UIView)
```

## Installation

#### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/SteveBarnegren/SBAutoLayout.git")
]
```

#### Carthage

Add the following line to your `Cartfile`:

```
github "SteveBarnegren/SBAutolayout"
```

#### CocoaPods

Cocoapods is no longer supported.

#### Manual

Copy ```SBAutoLayout.swift``` in to your project


## Who?

[@SteveBarnegren](https://twitter.com/stevebarnegren)

## License

SBAutoLayout is available under the MIT license. See the LICENSE file for more info.
