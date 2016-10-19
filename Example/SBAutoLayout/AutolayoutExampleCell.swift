//
//  AutolayoutExampleCell.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 19/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

protocol AutoLayoutExampleCell {
    
    func numberOfViews() -> Int
    func rectForView(viewNumber: Int) -> CGRect
}
