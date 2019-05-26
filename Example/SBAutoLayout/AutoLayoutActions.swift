//
//  AutoLayoutActions.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 24/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func paddingMultiLineMethodSignatures() -> String {
        
        var string = self
        
        // Add padding to multi-line methods
        let lines = string.components(separatedBy: "\n")
        if lines.count > 1 {
            
            string = lines[0]
            
            let padding = lines[0].components(separatedBy: "(")[0].count + 1
            var paddingString = String();
            for _ in 0..<padding {
                paddingString.append(" ")
            }
            
            for i in 1..<lines.count {
                string.append("\n")
                string.append(paddingString + lines[i])
            }
            
        }
        
        return string
    }
}

protocol AutoLayoutAction {    
    func name() -> String
    func apply(superview: UIView, subviews: [UIView])
}

// MARK: - Pin Width / Height

struct PinWidth : AutoLayoutAction {
    
    let viewNum: Int
    let width: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinWidth(\(width))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinWidth(CGFloat(width))
    }
}

struct PinHeight : AutoLayoutAction {
    
    let viewNum: Int
    let height: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinHeight(\(height))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinHeight(CGFloat(height))
    }
}

struct PinAspectRatio : AutoLayoutAction {
    
    let viewNum: Int
    let width: Int
    let height: Int

    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinAspectRatio(width: \(width), height: \(height))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinAspectRatio(width: CGFloat(width), height: CGFloat(height))
    }
}

// MARK: - Pin To Superview edges

struct PinToSuperviewEdges : AutoLayoutAction {
    
    let viewNum: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewEdges()"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewEdges()
    }
}

struct PinToSuperviewEdgesTBLT : AutoLayoutAction {
    
    let viewNum: Int
    let top: Int
    let bottom: Int
    let leading: Int
    let trailing: Int

    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewEdges(top: \(top), bottom: \(bottom), leading: \(leading), trailing: \(trailing))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewEdges(top: CGFloat(top),
                                              bottom: CGFloat(bottom),
                                              leading: CGFloat(leading),
                                              trailing: CGFloat(trailing))
    }
}

struct PinToSuperviewTop : AutoLayoutAction {
    
    let viewNum: Int
    let margin: Int

    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewTop(margin: \(margin))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewTop(margin: CGFloat(margin))
    }
}

struct PinToSuperviewBottom : AutoLayoutAction {
    
    let viewNum: Int
    let margin: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewBottom(margin: \(margin))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewBottom(margin: CGFloat(margin))
    }
}

struct PinToSuperviewLeft : AutoLayoutAction {
    
    let viewNum: Int
    let margin: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewLeft(margin: \(margin))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewLeft(margin: CGFloat(margin))
    }
}

struct PinToSuperviewRight : AutoLayoutAction {
    
    let viewNum: Int
    let margin: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewRight(margin: \(margin))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewRight(margin: CGFloat(margin))
    }
}

struct PinToSuperviewLeading : AutoLayoutAction {
    
    let viewNum: Int
    let margin: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewLeading(margin: \(margin))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewLeading(margin: CGFloat(margin))
    }
}

struct PinToSuperviewTrailing : AutoLayoutAction {
    
    let viewNum: Int
    let margin: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewTrailing(margin: \(margin))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewTrailing(margin: CGFloat(margin))
    }
}

// MARK: - Pin to superview and strip

struct PinToSuperviewAsTopStrip : AutoLayoutAction {
    
    let viewNum: Int
    let height: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewAsTopStrip(height: \(height))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewAsTopStrip(height: CGFloat(height))
    }
}

struct PinToSuperviewAsBottomStrip : AutoLayoutAction {
    
    let viewNum: Int
    let height: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewAsBottomStrip(height: \(height))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewAsBottomStrip(height: CGFloat(height))
    }
}

struct PinToSuperviewAsLeftStrip : AutoLayoutAction {
    
    let viewNum: Int
    let width: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewAsLeftStrip(width: \(width))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewAsLeftStrip(width: CGFloat(width))
    }
}

struct PinToSuperviewAsRightStrip : AutoLayoutAction {
    
    let viewNum: Int
    let width: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewAsRightStrip(width: \(width))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewAsRightStrip(width: CGFloat(width))
    }
}

struct PinToSuperviewAsLeadingStrip : AutoLayoutAction {
    
    let viewNum: Int
    let width: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewAsLeadingStrip(width: \(width))"
    }

    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewAsLeadingStrip(width: CGFloat(width))
    }
}

struct PinToSuperviewAsTrailingStrip : AutoLayoutAction {
    
    let viewNum: Int
    let width: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewAsTrailingStrip(width: \(width))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewAsTrailingStrip(width: CGFloat(width))
    }
}

// MARK: - Pin to superview center

struct PinToSuperviewCenter : AutoLayoutAction {
    
    let viewNum: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        return "\(viewName).pinToSuperviewCenter()"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinToSuperviewCenter()
    }
}

struct PinToSuperviewCenterX : AutoLayoutAction {
    
    let viewNum: Int
    let offset: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        
        if let offset = offset {
            return "\(viewName).pinToSuperviewCenterX(offset: \(offset))"
        }
        else{
            return "\(viewName).pinToSuperviewCenterX()"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let offset = offset {
            subviews[viewNum].pinToSuperviewCenterX(offset: CGFloat(offset))
        }
        else{
            subviews[viewNum].pinToSuperviewCenterX()
        }
    }
}

struct PinToSuperviewCenterY : AutoLayoutAction {
    
    let viewNum: Int
    let offset: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        
        if let offset = offset {
            return "\(viewName).pinToSuperviewCenterY(offset: \(offset))"
        }
        else{
            return "\(viewName).pinToSuperviewCenterY()"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let offset = offset {
            subviews[viewNum].pinToSuperviewCenterY(offset: CGFloat(offset))
        }
        else{
            subviews[viewNum].pinToSuperviewCenterY()
        }
    }
}

// MARK: - Pin to other views

struct PinAboveView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    let separation: Int?

    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)

        if let separation = separation {
            return "\(viewName).pinAboveView(\(otherViewName), separation: \(separation))"
        }
        else{
            return "\(viewName).pinAboveView(\(otherViewName))"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let separation = separation {
            subviews[viewNum].pinAboveView(subviews[otherViewNum], separation: CGFloat(separation))
        }
        else{
            subviews[viewNum].pinAboveView(subviews[otherViewNum])
        }
    }
}

struct PinBelowView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    let separation: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        if let separation = separation {
            return "\(viewName).pinBelowView(\(otherViewName), separation: \(separation))"
        }
        else{
            return "\(viewName).pinBelowView(\(otherViewName))"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let separation = separation {
            subviews[viewNum].pinBelowView(subviews[otherViewNum], separation: CGFloat(separation))
        }
        else{
            subviews[viewNum].pinBelowView(subviews[otherViewNum])
        }
    }
}

struct PinToLeftOfView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    let separation: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        if let separation = separation {
            return "\(viewName).pinToLeftOfView(\(otherViewName), separation: \(separation))"
        }
        else{
            return "\(viewName).pinToLeftOfView(\(otherViewName))"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let separation = separation {
            subviews[viewNum].pinToLeftOfView(subviews[otherViewNum], separation: CGFloat(separation))
        }
        else{
            subviews[viewNum].pinToLeftOfView(subviews[otherViewNum])
        }
    }
}

struct PinToRightOfView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    let separation: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        if let separation = separation {
            return "\(viewName).pinToRightOfView(\(otherViewName), separation: \(separation))"
        }
        else{
            return "\(viewName).pinToRightOfView(\(otherViewName))"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let separation = separation {
            subviews[viewNum].pinToRightOfView(subviews[otherViewNum], separation: CGFloat(separation))
        }
        else{
            subviews[viewNum].pinToRightOfView(subviews[otherViewNum])
        }
    }
}

struct PinLeadingToView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    let separation: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        if let separation = separation {
            return "\(viewName).pinLeadingToView(\(otherViewName), separation: \(separation))"
        }
        else{
            return "\(viewName).pinLeadingToView(\(otherViewName))"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let separation = separation {
            subviews[viewNum].pinLeadingToView(subviews[otherViewNum], separation: CGFloat(separation))
        }
        else{
            subviews[viewNum].pinLeadingToView(subviews[otherViewNum])
        }
    }
}

struct PinTrailingFromView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    let separation: Int?
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        if let separation = separation {
            return "\(viewName).pinTrailingFromView(\(otherViewName), separation: \(separation))"
        }
        else{
            return "\(viewName).pinTrailingFromView(\(otherViewName))"
        }
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        
        if let separation = separation {
            subviews[viewNum].pinTrailingFromView(subviews[otherViewNum], separation: CGFloat(separation))
        }
        else{
            subviews[viewNum].pinTrailingFromView(subviews[otherViewNum])
        }
    }
}


struct PinWidthToSameAsView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        return "\(viewName).pinWidthToSameAsView(\(otherViewName))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinWidthToSameAsView(subviews[otherViewNum])
    }
}

struct PinHeightToSameAsView : AutoLayoutAction {
    
    let viewNum: Int
    let otherViewNum: Int
    
    func name() -> String {
        let viewName = ViewNamesAndColors.nameForView(number: viewNum)
        let otherViewName = ViewNamesAndColors.nameForView(number: otherViewNum)
        
        return "\(viewName).pinHeightToSameAsView(\(otherViewName))"
    }
    
    func apply(superview: UIView, subviews: [UIView]) {
        subviews[viewNum].pinHeightToSameAsView(subviews[otherViewNum])
    }
}


