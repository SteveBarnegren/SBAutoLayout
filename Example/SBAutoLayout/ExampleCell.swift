//
//  ExampleCell.swift
//  SBAutoLayout
//
//  Created by Steven Barnegren on 18/10/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class ExampleCell: UICollectionViewCell {
    
    let textField = UITextField()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        // Textfield
        textField.text = "Test text"
        textField.textAlignment = .center
        self.contentView.addSubview(textField)
        
        self.backgroundColor = UIColor.magenta
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("This class has not implemented NSCoding")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textField.frame = contentView.bounds
    }
    
}
