//
//  ExampleItem.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 18/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

struct AutoLayoutAction {
    
    enum LayoutFuction {
        
        // Pin Width / Height
        case pinWidth(viewNum: Int, width: Int)
        case pinHeight(viewNum: Int, height: Int)
        case pinAspectRatio(viewNum: Int, width: Int, height: Int)

        // Pin to superview edges
        case pinToSuperviewEdges(viewNum: Int)
        case pinToSuperviewTop(viewNum: Int, margin: Int)
        case pinToSuperviewBottom(viewNum: Int, margin: Int)
        case pinToSuperviewLeft(viewNum: Int, margin: Int)
        case pinToSuperviewRight(viewNum: Int, margin: Int)
        case pinToSuperviewLeading(viewNum: Int, margin: Int)
        case pinToSuperviewTrailing(viewNum: Int, margin: Int)
        
        // Pin to superview as strip
        case pinToSuperviewAsTopStrip(viewNum: Int, height: Int)
        case pinToSuperviewAsBottomStrip(viewNum: Int, height: Int)
        case pinToSuperviewAsLeftStrip(viewNum: Int, width: Int)
        case pinToSuperviewAsRightStrip(viewNum: Int, width: Int)
        case pinToSuperviewAsLeadingStrip(viewNum: Int, width: Int)
        case pinToSuperviewAsTrailingStrip(viewNum: Int, width: Int)
        
        // Pin to superview center
        case pinToSuperviewCenter(viewNum: Int)
        case pinToSuperviewCenterX(viewNum: Int, offset: Int?)
        case pinToSuperviewCenterY(viewNum: Int, offset: Int?)
        
        // Pin Multiple Views
        case pinViewsVertically(topViewNum: Int, bottomViewNum: Int, separation: Int?)
        case pinViewsHorizontallyLeftRight(leftViewNum: Int, rightViewNum: Int, separation: Int?)
        case pinViewsHorizontallyLeadingTrailing(leadingViewNum: Int, trailingViewNum: Int, separation: Int?)
        case pinViewsWidthToSame(firstViewNum: Int, secondViewNum: Int)
        case pinViewsHeightToSame(firstViewNum: Int, secondViewNum: Int)
        
        func name() -> String {
            
            switch self {
                
                // Pin Width / Height
            case .pinWidth(let viewNum, let width):
                return "$\(viewNum).pinWidth(\(width))"
            case .pinHeight(let viewNum, let height):
                return "$\(viewNum).pinHeight(\(height))"
            case .pinAspectRatio(let viewNum, let width, let height):
                return "$\(viewNum).pinAspectRatio(width: \(width), height: \(height))"
                
                // Pin to superview edges
            case .pinToSuperviewEdges(let viewNum):
                return "$\(viewNum).pinToSuperviewEdges()"
            case .pinToSuperviewTop(let viewNum, let margin):
                return "$\(viewNum).pinToSuperviewTop(margin: \(margin))"
            case .pinToSuperviewBottom(let viewNum, let margin):
                return "$\(viewNum).pinToSuperviewBottom(margin: \(margin))"
            case .pinToSuperviewLeft(let viewNum, let margin):
                return "$\(viewNum).pinToSuperviewLeft(margin: \(margin))"
            case .pinToSuperviewRight(let viewNum, let margin):
                return "$\(viewNum).pinToSuperviewRight(margin: \(margin))"
            case .pinToSuperviewLeading(let viewNum, let margin):
                return "$\(viewNum).pinToSuperviewLeading(margin: \(margin))"
            case .pinToSuperviewTrailing(let viewNum, let margin):
                return "$\(viewNum).pinToSuperviewTrailing(margin: \(margin))"

                // Pin to superview as strip
            case .pinToSuperviewAsTopStrip(let viewNum, let height):
                return "$\(viewNum).pinToSuperviewAsTopStrip(height: \(height))"
            case .pinToSuperviewAsBottomStrip(let viewNum, let height):
                return "$\(viewNum).pinToSuperviewAsBottomStrip(height: \(height))"
            case .pinToSuperviewAsLeftStrip(let viewNum, let width):
                return "$\(viewNum).pinToSuperviewAsLeftStrip(width: \(width))"
            case .pinToSuperviewAsRightStrip(let viewNum, let width):
                return "$\(viewNum).pinToSuperviewAsRightStrip(width: \(width))"
            case .pinToSuperviewAsLeadingStrip(let viewNum, let width):
                return "$\(viewNum).pinToSuperviewAsLeadingStrip(width: \(width))"
            case .pinToSuperviewAsTrailingStrip(let viewNum, let width):
                return "$\(viewNum).pinToSuperviewAsTrailingStrip(width: \(width))"
                
                // Pin to superview center
            case .pinToSuperviewCenter(let viewNum):
                return "$\(viewNum).pinToSuperviewCenter()"
            case .pinToSuperviewCenterX(let viewNum, let offset):
                if let offset = offset {
                    return "$\(viewNum).pinToSuperviewCenterX(offset: \(offset))"
                }
                else{
                    return "$\(viewNum).pinToSuperviewCenterX()"
                }
            case .pinToSuperviewCenterY(let viewNum, let offset):
                if let offset = offset {
                    return "$\(viewNum).pinToSuperviewCenterY(offset: \(offset))"
                }
                else{
                    return "$\(viewNum).pinToSuperviewCenterY()"
                }
                
                // Pin multiple views
            case .pinViewsVertically(let topViewNum, let bottomViewNum, let separation):
                if let separation = separation {
                    return "\(ViewNamesAndColors.mainViewName()).pinViewsVertically(topView: $\(topViewNum),\nbottomView: $\(bottomViewNum),\nseparation: \(separation))"
                }
                else{
                    return "\(ViewNamesAndColors.mainViewName()).pinViewsVertically(topView: $\(topViewNum), bottomView: $\(bottomViewNum))"
                }
                
            case .pinViewsHorizontallyLeftRight(let leftViewNum, let rightViewNum, let separation):
                if let separation = separation {
                    return "\(ViewNamesAndColors.mainViewName()).pinViewsHorizontally(leftView: $\(leftViewNum),\nrightView: $\(rightViewNum),\nseparation: \(separation))"
                }
                else{
                    return "\(ViewNamesAndColors.mainViewName()).pinViewsHorizontally(leftView: $\(leftViewNum), rightView: $\(rightViewNum))"
                }
                
            case .pinViewsHorizontallyLeadingTrailing(let leadingViewNum, let trailingViewNum, let separation):
                if let separation = separation {
                    return "\(ViewNamesAndColors.mainViewName()).pinViewsHorizontally(leadingView: $\(leadingViewNum),\ntrailingView: $\(trailingViewNum),\nseparation: \(separation))"
                }
                else{
                    return "\(ViewNamesAndColors.mainViewName()).pinViewsHorizontally(leadingView: $\(leadingViewNum), trailingView: $\(trailingViewNum))"
                }
                
            case .pinViewsWidthToSame(let firstViewNum, let secondViewNum):
                return "\(ViewNamesAndColors.mainViewName()).pinViewsWidthToSame(firstView: $\(firstViewNum),\nsecondView: $\(secondViewNum))"
                
            case .pinViewsHeightToSame(let firstViewNum, let secondViewNum):
                return "\(ViewNamesAndColors.mainViewName()).pinViewsHeightToSame(firstView: $\(firstViewNum),\nsecondView: $\(secondViewNum))"
                
        }

        }

    }

    let layoutFuction: LayoutFuction
    
    init(layoutFunction: LayoutFuction) {
        
        self.layoutFuction = layoutFunction
    }
    
    func name() -> String {
        
        var name = layoutFuction.name()
        
        // Replace placeholders with view names
        for i in 0..<ViewNamesAndColors.numberOfViewColors() {
            
            let placeHolder = "$\(i)"
            let viewName = ViewNamesAndColors.nameForView(number: i)
            
            name = name.replacingOccurrences(of: placeHolder, with: viewName)
        }
        
        // Add padding to multi-line methods
        let lines = name.components(separatedBy: "\n")
        if lines.count > 1 {
            
            name = lines[0]
            
            let padding = lines[0].components(separatedBy: "(")[0].characters.count + 1
            var paddingString = String();
            for _ in 0..<padding {
                paddingString.append(" ")
            }
            
            for i in 1..<lines.count {
                name.append("\n")
                name.append(paddingString + lines[i])
            }
            
        }
        
        return name
    }
    
    func apply(superView: UIView, subViews: [UIView]) {
        switch layoutFuction {
            
            // Pin Width / Height
        case .pinWidth(let viewNum, let width):
            subViews[viewNum].pinWidth(CGFloat(width))
        case .pinHeight(let viewNum, let height):
            subViews[viewNum].pinHeight(CGFloat(height))
        case .pinAspectRatio(let viewNum, let width, let height):
            subViews[viewNum].pinAspectRatio(width: CGFloat(width), height: CGFloat(height))
            
            // Pin to superview edges
        case .pinToSuperviewEdges(let viewNum):
            subViews[viewNum].pinToSuperviewEdges()
        case .pinToSuperviewTop(let viewNum, let margin):
            subViews[viewNum].pinToSuperviewTop(margin: CGFloat(margin))
        case .pinToSuperviewBottom(let viewNum, let margin):
            subViews[viewNum].pinToSuperviewBottom(margin: CGFloat(margin))
        case .pinToSuperviewLeft(let viewNum, let margin):
            subViews[viewNum].pinToSuperviewLeft(margin: CGFloat(margin))
        case .pinToSuperviewRight(let viewNum, let margin):
            subViews[viewNum].pinToSuperviewRight(margin: CGFloat(margin))
        case .pinToSuperviewLeading(let viewNum, let margin):
            subViews[viewNum].pinToSuperviewLeading(margin: CGFloat(margin))
        case .pinToSuperviewTrailing(let viewNum, let margin):
            subViews[viewNum].pinToSuperviewTrailing(margin: CGFloat(margin))
            
            // Pin to superview as strip
        case .pinToSuperviewAsTopStrip(let viewNum, let height):
            subViews[viewNum].pinToSuperviewAsTopStrip(height: CGFloat(height))
        case .pinToSuperviewAsBottomStrip(let viewNum, let height):
            subViews[viewNum].pinToSuperviewAsBottomStrip(height: CGFloat(height))
        case .pinToSuperviewAsLeftStrip(let viewNum, let width):
            subViews[viewNum].pinToSuperviewAsLeftStrip(width: CGFloat(width))
        case .pinToSuperviewAsRightStrip(let viewNum, let width):
            subViews[viewNum].pinToSuperviewAsRightStrip(width: CGFloat(width))
        case .pinToSuperviewAsLeadingStrip(let viewNum, let width):
            subViews[viewNum].pinToSuperviewAsLeadingStrip(width: CGFloat(width))
        case .pinToSuperviewAsTrailingStrip(let viewNum, let width):
            subViews[viewNum].pinToSuperviewAsTrailingStrip(width: CGFloat(width))

            // Pin to superview center
        case .pinToSuperviewCenter(let viewNum):
            subViews[viewNum].pinToSuperviewCentre()
        case .pinToSuperviewCenterX(let viewNum, let offset):
            if let offset = offset {
                subViews[viewNum].pinToSuperviewCentreX(offset: CGFloat(offset))
            }
            else{
                subViews[viewNum].pinToSuperviewCentreX()
            }
        case .pinToSuperviewCenterY(let viewNum, let offset):
            if let offset = offset {
                subViews[viewNum].pinToSuperviewCentreY(offset: CGFloat(offset))
            }
            else{
                subViews[viewNum].pinToSuperviewCentreY()
            }
            
            // Pin multiple views
        case .pinViewsVertically(let topViewNum, let bottomViewNum, let separation):
            if let separation = separation {
                superView.pinViewsVertically(topView: subViews[topViewNum], bottomView: subViews[bottomViewNum], separation: CGFloat(separation))
            }
            else{
                superView.pinViewsVertically(topView: subViews[topViewNum], bottomView: subViews[bottomViewNum])
            }
            
        case .pinViewsHorizontallyLeftRight(let leftViewNum, let rightViewNum, let separation):
            if let separation = separation {
                superView.pinViewsHorizontally(leftView: subViews[leftViewNum], rightView: subViews[rightViewNum], separation: CGFloat(separation))
            }
            else{
                superView.pinViewsHorizontally(leftView: subViews[leftViewNum], rightView: subViews[rightViewNum])
            }
            
        case .pinViewsHorizontallyLeadingTrailing(let leadingViewNum, let trailingViewNum, let separation):
            if let separation = separation {
                superView.pinViewsHorizontally(leadingView: subViews[leadingViewNum], trailingView: subViews[trailingViewNum], separation: CGFloat(separation))
            }
            else{
                superView.pinViewsHorizontally(leadingView: subViews[leadingViewNum], trailingView: subViews[trailingViewNum])
            }
            
        case .pinViewsWidthToSame(let firstViewNum, let secondViewNum):
            superView.pinViewsWidthToSame(firstView: subViews[firstViewNum], secondView: subViews[secondViewNum])
            
        case .pinViewsHeightToSame(let firstViewNum, let secondViewNum):
            superView.pinViewsHeightToSame(firstView: subViews[firstViewNum], secondView: subViews[secondViewNum])

        }
    }
    
}

struct ExampleItem {
    
    enum TextPosition {
        case center
        case centerInView(viewNumber: Int)
        case aboveView(viewNumber: Int)
        case belowView(viewNumber: Int)
        case leftOfView(viewNumber: Int)
        case rightOfView(viewNumber: Int)
    }
    
    let numberOfViews: Int
    let layoutActions: [AutoLayoutAction]
    let textPosition: TextPosition
    
    var text: String {
        
        var string = String()
        
        for (index, layoutAction) in layoutActions.enumerated() {
            string.append(layoutAction.name())
            if index != layoutActions.count-1 {
                string.append("\n")
            }
        }
        return string
    }

    init(numberOfViews: Int, textPosition: TextPosition, layoutActions: [AutoLayoutAction]) {
        self.layoutActions = layoutActions
        self.textPosition = textPosition
        self.numberOfViews = numberOfViews
    }
    
    func nameAndColorForView(number: Int) -> (name: String, color: UIColor) {
        
        let array: [(name: String, color: UIColor)] = [
            
            ("BlueView", UIColor(red: 0.333, green: 0.675, blue: 0.937, alpha: 1)),
            ("OrangeView", UIColor.orange),
            ]
        
        return array[number]
    }
    
}


