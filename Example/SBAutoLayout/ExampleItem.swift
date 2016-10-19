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
        case pinWidth(width: Int)
        case pinHeight(height: Int)
        case pinAspectRatio(width: Int, height: Int)

        // Pin to superview edges
        case pinToSuperViewEdges
        case pinToSuperviewTop(margin: Int)
        case pinToSuperviewBottom(margin: Int)
        case pinToSuperviewLeft(margin: Int)
        case pinToSuperviewRight(margin: Int)
        case pinToSuperviewLeading(margin: Int)
        case pinToSuperviewTrailing(margin: Int)
        
        // Pin to superview as strip
        case pinToSuperviewAsTopStrip(height: Int)
        case pinToSuperviewAsBottomStrip(height: Int)
        case pinToSuperviewAsLeftStrip(width: Int)
        case pinToSuperviewAsRightStrip(width: Int)
        case pinToSuperviewAsLeadingStrip(width: Int)
        case pinToSuperviewAsTrailingStrip(width: Int)
        
        // Pin to superview center
        case pinToSuperviewCenter
        case pinToSuperviewCenterX(offset: Int?)
        case pinToSuperviewCenterY(offset: Int?)
        
        func name() -> String {
            
            switch self {
                
                // Pin Width / Height
            case .pinWidth(let width):
                return "pinWidth(\(width))"
            case .pinHeight(let height):
                return "pinHeight(\(height))"
            case .pinAspectRatio(let width, let height):
                return "pinAspectRatio(width: \(width), height: \(height))"
                
                // Pin to superview edges
            case .pinToSuperViewEdges:
                return "pinToSuperViewEdges()"
            case .pinToSuperviewTop(let margin):
                return "pinToSuperviewTop(\(margin))"
            case .pinToSuperviewBottom(let margin):
                return "pinToSuperviewBottom(\(margin))"
            case .pinToSuperviewLeft(let margin):
                return "pinToSuperviewLeft(\(margin))"
            case .pinToSuperviewRight(let margin):
                return "pinToSuperviewRight(\(margin))"
            case .pinToSuperviewLeading(let margin):
                return "pinToSuperviewLeading(\(margin))"
            case .pinToSuperviewTrailing(let margin):
                return "pinToSuperviewTrailing(\(margin))"

                // Pin to superview as strip
            case .pinToSuperviewAsTopStrip(let height):
                return "pinToSuperviewAsTopStrip(\(height))"
            case .pinToSuperviewAsBottomStrip(let height):
                return "pinToSuperviewAsBottomStrip(\(height))"
            case .pinToSuperviewAsLeftStrip(let width):
                return "pinToSuperviewAsLeftStrip(\(width))"
            case .pinToSuperviewAsRightStrip(let width):
                return "pinToSuperviewAsRightStrip(\(width))"
            case .pinToSuperviewAsLeadingStrip(let width):
                return "pinToSuperviewAsLeadingStrip(\(width))"
            case .pinToSuperviewAsTrailingStrip(let width):
                return "pinToSuperviewAsTrailingStrip(\(width))"
                
                // Pin to superview center
            case .pinToSuperviewCenter:
                return "pinToSuperviewCenter()"
            case .pinToSuperviewCenterX(let offset):
                if let offset = offset {
                    return "pinToSuperviewCenterX(offset: \(offset))"
                }
                else{
                    return "pinToSuperviewCenterX()"
                }
            case .pinToSuperviewCenterY(let offset):
                if let offset = offset {
                    return "pinToSuperviewCenterY(offset: \(offset))"
                }
                else{
                    return "pinToSuperviewCenterY()"
                }
        }

        }

    }

    let layoutFuction: LayoutFuction
    let viewNumber: Int
    
    init(viewNumber: Int, layoutFunction: LayoutFuction) {
        
        self.viewNumber = viewNumber
        self.layoutFuction = layoutFunction
    }
    
    func name() -> String {
        
        /*
        if let viewName = viewName {
            return "\(viewName).\(layoutFuction.name())"
        }
        else{
            return layoutFuction.name()
        }
        */
        return layoutFuction.name()

    }
    
    
    func apply(view: UIView) {
        switch layoutFuction {
            
            // Pin Width / Height
        case .pinWidth(let width):
            view.pinWidth(CGFloat(width))
        case .pinHeight(let height):
            view.pinHeight(CGFloat(height))
        case .pinAspectRatio(let width, let height):
            view.pinAspectRatio(width: CGFloat(width), height: CGFloat(height))
            
            // Pin to superview edges
        case .pinToSuperViewEdges:
            view.pinToSuperviewEdges()
        case .pinToSuperviewTop(let margin):
            view.pinToSuperviewTop(CGFloat(margin))
        case .pinToSuperviewBottom(let margin):
            view.pinToSuperviewBottom(CGFloat(margin))
        case .pinToSuperviewLeft(let margin):
            view.pinToSuperviewLeft(CGFloat(margin))
        case .pinToSuperviewRight(let margin):
            view.pinToSuperviewRight(CGFloat(margin))
        case .pinToSuperviewLeading(let margin):
            view.pinToSuperviewLeading(CGFloat(margin))
        case .pinToSuperviewTrailing(let margin):
            view.pinToSuperviewTrailing(CGFloat(margin))
            
            // Pin to superview as strip
        case .pinToSuperviewAsTopStrip(let height):
            view.pinToSuperviewAsTopStrip(CGFloat(height))
        case .pinToSuperviewAsBottomStrip(let height):
            view.pinToSuperviewAsBottomStrip(CGFloat(height))
        case .pinToSuperviewAsLeftStrip(let width):
            view.pinToSuperviewAsLeftStrip(CGFloat(width))
        case .pinToSuperviewAsRightStrip(let width):
            view.pinToSuperviewAsRightStrip(CGFloat(width))
        case .pinToSuperviewAsLeadingStrip(let width):
            view.pinToSuperviewAsLeadingStrip(CGFloat(width))
        case .pinToSuperviewAsTrailingStrip(let width):
            view.pinToSuperviewAsTrailingStrip(CGFloat(width))

            
            // Pin to superview center
        case .pinToSuperviewCenter:
            view.pinToSuperviewCentre()
        case .pinToSuperviewCenterX(let offset):
            if let offset = offset {
                view.pinToSuperviewCentreX(offset: CGFloat(offset))
            }
            else{
                view.pinToSuperviewCentreX()
            }
        case .pinToSuperviewCenterY(let offset):
            if let offset = offset {
                view.pinToSuperviewCentreY(offset: CGFloat(offset))
            }
            else{
                view.pinToSuperviewCentreY()
            }

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

    init(textPosition: TextPosition, layoutActions: [AutoLayoutAction]) {
        self.layoutActions = layoutActions
        self.textPosition = textPosition
    }
    
    
}


