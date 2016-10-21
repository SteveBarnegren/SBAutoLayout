//
//  File.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 21/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

class ViewNamesAndColors {
    
    class func mainViewName() -> String {
        return "main"
    }
    
    class func namesAndColors() -> [(name: String, color: UIColor)] {
        
        let array: [(name: String, color: UIColor)] = [
            ("blue", UIColor(red: 0.333, green: 0.675, blue: 0.937, alpha: 1)),
            ("orange", UIColor.orange),
            ]
        
        return array
    }
    
    class func nameAndColorForView(number: Int) -> (name: String, color: UIColor) {
        return self.namesAndColors()[number]
    }
    
    class func numberOfViewColors() -> Int {
        return self.namesAndColors().count
    }
    
    class func nameForView(number: Int) -> String {
        return self.nameAndColorForView(number: number).name
    }
    
    class func colorForView(number: Int) -> UIColor {
        return self.nameAndColorForView(number: number).color
    }
    
}
