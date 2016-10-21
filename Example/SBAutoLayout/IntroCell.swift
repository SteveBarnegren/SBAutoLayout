//
//  IntroCell.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 19/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class IntroCell: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var underlineView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        underlineView.backgroundColor = UIColor.clear
        containerView.backgroundColor = UIColor.clear
    }
    
}

extension IntroCell: AutoLayoutExampleCell {
    
    func colorForView(viewNumber: Int) -> UIColor {
        return ViewNamesAndColors.colorForView(number: 0)
    }

    public func numberOfViews() -> Int {
        return 1
    }
    
    public func rectForView(viewNumber: Int) -> CGRect {
        return underlineView .convert(underlineView.bounds, to: self)
    }
}

