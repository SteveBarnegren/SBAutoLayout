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
        case pinToSuperViewEdges
        case pinToSuperviewTop(margin: Int)
        case pinToSuperviewBottom(margin: Int)
        case pinToSuperviewLeft(margin: Int)
        case pinToSuperviewRight(margin: Int)
        case pinToSuperviewAsTopStrip(height: Int)
        case pinToSuperviewAsBottomStrip(height: Int)
        case pinToSuperviewAsLeftStrip(width: Int)
        case pinToSuperviewAsRightStrip(width: Int)

        func name() -> String {
            
            switch self {
            case .pinToSuperViewEdges:
                return "pinToSuperViewEdges"
            case .pinToSuperviewTop(let margin):
                return "pinToSuperviewTop(\(margin))"
            case .pinToSuperviewBottom(let margin):
                return "pinToSuperviewBottom(\(margin))"
            case .pinToSuperviewLeft(let margin):
                return "pinToSuperviewLeft(\(margin))"
            case .pinToSuperviewRight(let margin):
                return "pinToSuperviewRight(\(margin))"
            case .pinToSuperviewAsTopStrip(let height):
                return "pinToSuperviewAsTopStrip(\(height))"
            case .pinToSuperviewAsBottomStrip(let height):
                return "pinToSuperviewAsBottomStrip(\(height))"
            case .pinToSuperviewAsLeftStrip(let width):
                return "pinToSuperviewAsLeftStrip(\(width))"
            case .pinToSuperviewAsRightStrip(let width):
                return "pinToSuperviewAsRightStrip(\(width))"
            }
        }
    }
    
    let layoutFuction: LayoutFuction
    let viewNumber: Int
    
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
    
    init(viewNumber: Int, layoutFunction: LayoutFuction) {
        
        self.viewNumber = viewNumber
        self.layoutFuction = layoutFunction
    }
    
    func apply(view: UIView) {
        
        switch layoutFuction {
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
        case .pinToSuperviewAsTopStrip(let height):
            view.pinToSuperviewAsTopStrip(CGFloat(height))
        case .pinToSuperviewAsBottomStrip(let height):
            view.pinToSuperviewAsBottomStrip(CGFloat(height))
        case .pinToSuperviewAsLeftStrip(let width):
            view.pinToSuperviewAsLeftStrip(CGFloat(width))
        case .pinToSuperviewAsRightStrip(let width):
            view.pinToSuperviewAsRightStrip(CGFloat(width))
        }
    }
    
}

struct ExampleItem {
    
    let layoutActions: [AutoLayoutAction]
    
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

    init(layoutActions: [AutoLayoutAction]) {
        self.layoutActions = layoutActions
    }
    
    
}


