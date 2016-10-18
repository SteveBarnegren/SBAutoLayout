//
//  ExampleCell.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 18/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ExampleCell: UICollectionViewCell {
    
    let label = UILabel()
    var views = [Int:UIView]()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Textfield
        label.text = "Test text"
        label.textAlignment = .center
        label.numberOfLines = 0
        self.contentView.addSubview(label)
        
        self.backgroundColor = UIColor.magenta
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class has not implemented NSCoding")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label.frame = contentView.bounds
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
                view.backgroundColor = UIColor.green
                contentView.addSubview(view)
                views[action.viewNumber] = view
            }
            
            action.apply(view: views[action.viewNumber]!)
            
        }
        
        label.text = item.text
        label.superview?.bringSubview(toFront: label)
    }
    
}
