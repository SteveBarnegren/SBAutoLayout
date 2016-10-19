//
//  RectangleDrawingView.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 19/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class RectangleDrawingView: UIView {

    struct Rectangle {
        let rect: CGRect
        let color: UIColor
    }
    
    var rectangles = [Rectangle]() {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        backgroundColor = UIColor.white
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        UIColor.white.set()
        UIBezierPath(rect: rect).fill()
        
        for rectangle in rectangles {
            
            rectangle.color.set()
            UIBezierPath(rect: rectangle.rect).fill()
        }
        
    }
    
}
