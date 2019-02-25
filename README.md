# SBAutoLayout

[![Version](https://img.shields.io/cocoapods/v/SBAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SBAutoLayout)
[![License](https://img.shields.io/cocoapods/l/SBAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SBAutoLayout)
[![Platform](https://img.shields.io/cocoapods/p/SBAutoLayout.svg?style=flat)](http://cocoapods.org/pods/SBAutoLayout)

SBAutoLayout is an extension for UIView that makes it easy to perform common auto layout operations in Swift without having to write verbose auto layout syntax.

Swift 3 is supported as of version 1.0.0

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
let topConstraint = view.pinToSuperviewTop(margin: 60)
view.pinToSuperviewBottom(margin: 40)
view.pinToSuperviewLeading(margin: 15)
view.pinToSuperviewTrailing(margin: 15)

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
func pinWidth(_ width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinHeight(_ height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinAspectRatio(width: CGFloat, height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
```

**Pin to superview edges**

```    
func pinToSuperviewEdges(priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
    
func pinToSuperviewEdges(top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
    
func pinToSuperviewEdges(insets: UIEdgeInsets, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
   
    
func pinToSuperviewTop(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewBottom(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewLeft(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewRight(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewLeading(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewTrailing(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
```

**Pin to superview as strip**

```   
func pinToSuperviewAsTopStrip(height: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
    
func pinToSuperviewAsBottomStrip(height: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
    
func pinToSuperviewAsLeftStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
    
func pinToSuperviewAsRightStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
    
func pinToSuperviewAsLeadingStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]

func pinToSuperviewAsTrailingStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]
```

**Pin to superview center**

```
func pinToSuperviewCenterX(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewCenterY(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToSuperviewCenter(priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]    // MARK:- Pin to other views
```

**Pin above / below other views**

```
func pinAboveView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinBelowView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
```

**Pin to left / right / leading / trailing other views**

``` 
func pinToLeftOfView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinToRightOfView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinTrailingFromView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinLeadingToView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
```    
   
**Match width / height of other views**  
    
```
func pinWidthToSameAsView(_ otherView: UIView, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
    
func pinHeightToSameAsView(_ otherView: UIView, priority: UILayoutPriority? = nil) -> NSLayoutConstraint
```

## Installation

#### CocoaPods

Add the following line to your `Podfile`:

```ruby
pod "SBAutoLayout"
```

#### Carthage

Add the following line to your `Cartfile`:

```
github "SteveBarnegren/SBAutolayout"
```

#### Manual

Copy ```SBAutoLayout.swift``` in to your project

## Who?

[@SteveBarnegren](https://twitter.com/stevebarnegren)

## License

SBAutoLayout is available under the MIT license. See the LICENSE file for more info.
