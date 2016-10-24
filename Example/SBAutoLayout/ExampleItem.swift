//
//  ExampleItem.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 18/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

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


