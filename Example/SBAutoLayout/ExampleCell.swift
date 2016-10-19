//
//  ExampleCell.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 18/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

let DEBUG_DRAW = false

class ExampleCell: UICollectionViewCell {
    
    let label = UILabel()
    var views = [Int:UIView]()
    var textPosition: ExampleItem.TextPosition = .center
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Textfield
        label.text = "Test text"
        label.textAlignment = .center
        label.numberOfLines = 0
        self.contentView.addSubview(label)
        
        self.backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class has not implemented NSCoding")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch textPosition {
        case .center:
            label.frame = contentView.bounds
        case .centerInView(let viewNumber):
            if let view = views[viewNumber] {
                positionLabelInCenterOfView(view)
            }
        case .aboveView(let viewNumber):
            if let view = views[viewNumber] {
                positionLabelAboveView(view)
            }
        case .belowView(let viewNumber):
            if let view = views[viewNumber] {
                positionLabelBelowView(view)
            }
        case .leftOfView(let viewNumber):
            if let view = views[viewNumber] {
                positionLabelToLeftOfView(view)
            }
        case .rightOfView(let viewNumber):
            if let view = views[viewNumber] {
                positionLabelToRightOfView(view)
            }
        }
    }
    
    func positionLabelInCenterOfView(_ view: UIView) {
        label.frame = view.frame
    }

    
    func positionLabelAboveView(_ view: UIView) {
    
        let viewTop = view.frame.origin.y
        label.frame = CGRect(x: 0,
                             y: 0,
                             width: contentView.bounds.size.width,
                             height: viewTop)
    }
    
    func positionLabelBelowView(_ view: UIView) {
        
        let viewBottom = view.frame.origin.y + view.frame.size.height
        label.frame = CGRect(x: 0,
                             y: viewBottom,
                             width: contentView.bounds.size.width,
                             height: contentView.bounds.size.height - viewBottom)
    }
    
    func positionLabelToLeftOfView(_ view: UIView) {
        
        let viewStartX = view.frame.origin.x
        label.frame = CGRect(x: 0,
                             y: 0,
                             width: viewStartX,
                             height: contentView.bounds.size.height)
    }
    
    func positionLabelToRightOfView(_ view: UIView) {
        
        let viewEndX = view.frame.origin.x + view.frame.size.width
        label.frame = CGRect(x: viewEndX,
                             y: 0,
                             width: contentView.bounds.size.width - viewEndX,
                             height: contentView.bounds.size.height)
    }
    
    func configureWithItem(item: ExampleItem) {
        
        // Remove old views
        for (_, view) in Array(views) {
            view.removeFromSuperview()
        }
        views.removeAll()
        
        // Create new views
        for action in item.layoutActions {
            
            if views[action.viewNumber] == nil{
                
                let view = UIView(frame: .zero)
                view.backgroundColor = UIColor.clear
                contentView.addSubview(view)
                views[action.viewNumber] = view
                
                if DEBUG_DRAW {
                    view.backgroundColor = UIColor.green
                }

            }
            
            action.apply(view: views[action.viewNumber]!)
            
        }
        
        textPosition = item.textPosition
        label.text = item.text
        label.superview?.bringSubview(toFront: label)
        setNeedsLayout()
        layoutIfNeeded()
    }
    
    // MARK: - Get autolayout rects
    
    public func numberOfViews() -> Int {
        return self.views.count
    }
    
    public func rectForView(viewNumber: Int) -> CGRect {
        
        guard let view = self.views[viewNumber] else {
            return .zero
        }
        
        return view.frame
    }
    
    
    
    
}
