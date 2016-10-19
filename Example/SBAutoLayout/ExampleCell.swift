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

        // Self
        self.backgroundColor = UIColor.clear
        
        // Textfield
        label.text = "Test text"
        label.font = UIFont(name: "Menlo", size: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textAlignment = .left
        self.contentView.addSubview(label)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class has not implemented NSCoding")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        switch textPosition {
        case .center:
            positionLabelWithinFrame(frame: contentView.bounds)
        case .centerInView(let viewNumber):
            if let view = views[viewNumber] {
                positionLabelWithinFrame(frame: view.frame)
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
    
    func positionLabelAboveView(_ view: UIView) {
        
        let viewTop = view.frame.origin.y
        let frame = CGRect(x: 0,
                           y: 0,
                           width: contentView.bounds.size.width,
                           height: viewTop)
        positionLabelWithinFrame(frame: frame)
    }
    
    func positionLabelBelowView(_ view: UIView) {
        
        let viewBottom = view.frame.origin.y + view.frame.size.height
        let frame = CGRect(x: 0,
                           y: viewBottom,
                           width: contentView.bounds.size.width,
                           height: contentView.bounds.size.height - viewBottom)
        positionLabelWithinFrame(frame: frame)
        
    }
    
    func positionLabelToLeftOfView(_ view: UIView) {
        
        let viewStartX = view.frame.origin.x
        let frame = CGRect(x: 0,
                           y: 0,
                           width: viewStartX,
                           height: contentView.bounds.size.height)
        positionLabelWithinFrame(frame: frame)
        
    }
    
    func positionLabelToRightOfView(_ view: UIView) {
        
        let viewEndX = view.frame.origin.x + view.frame.size.width
        let frame = CGRect(x: viewEndX,
                           y: 0,
                           width: contentView.bounds.size.width - viewEndX,
                           height: contentView.bounds.size.height)
        positionLabelWithinFrame(frame: frame)
        
    }
    
    func positionLabelWithinFrame(frame: CGRect) {
        
        label.transform = CGAffineTransform.identity
        
        var frame = frame
        let margin = CGFloat(8)
        
        frame = CGRect(x: frame.origin.x + margin,
                       y: frame.origin.y + margin,
                       width: frame.size.width - margin*2,
                       height: frame.size.height - margin*2)
        
        
        let labelSize = label.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude,
                                                  height: frame.size.height))
        
        let newFrame = CGRect(x: frame.origin.x + (frame.size.width - labelSize.width)/2,
                              y: frame.origin.y + (frame.size.height - labelSize.height)/2,
                              width: labelSize.width,
                              height: labelSize.height)
        
        label.frame = newFrame
    
        if labelSize.width > frame.size.width {
            let scale = frame.size.width / labelSize.width
            label.transform = CGAffineTransform(scaleX: scale, y: scale)
        }
    }
    
    func configureWithItem(item: ExampleItem) {
        
        // Remove old views
        for (_, view) in Array(views) {
            view.removeFromSuperview()
        }
        views.removeAll()
        
        // Create new views
        for action in item.layoutActions {
            
            if views[action.viewNumber] == nil {
                
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
    
}

extension ExampleCell: AutoLayoutExampleCell {
    
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
