//
//  SBAutoLayout.swift
//  SBLayoutSwift
//
//  Created by Steven Barnegren on 26/04/2016.
//  Copyright © 2016 Steve Barnegren. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    // MARK: - Pin Width / Height
    public func pinWidth(width: CGFloat) -> NSLayoutConstraint{
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .Width,
                                                 relatedBy: .Equal,
                                                 toItem: nil,
                                                 attribute: .NotAnAttribute,
                                                 multiplier: 1,
                                                 constant: width)
        addConstraint(constraint)
        return constraint
    }
    
    public func pinHeight(height: CGFloat) -> NSLayoutConstraint{
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .Height,
                                                 relatedBy: .Equal,
                                                 toItem: nil,
                                                 attribute: .NotAnAttribute,
                                                 multiplier: 1,
                                                 constant: height)
        addConstraint(constraint)
        return constraint
    }
    
    // MARK: - Pin to superview edges
    
    public func pinToSuperviewEdges() -> [NSLayoutConstraint]{
        return self.pinToSuperviewEdges(top: 0, bottom: 0, leading: 0, trailing: 0)
    }
    
    public func pinToSuperviewEdges(top top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(top))
        constraints.append(pinToSuperviewBottom(bottom))
        constraints.append(pinToSuperviewLeading(leading))
        constraints.append(pinToSuperviewTrailing(trailing))
        
        return constraints
    }
    
    public func pinToSuperviewEdges(insets: UIEdgeInsets) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false;
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(insets.top))
        constraints.append(pinToSuperviewBottom(insets.bottom))
        constraints.append(pinToSuperviewLeading(insets.left))
        constraints.append(pinToSuperviewTrailing(insets.right))
        
        return constraints
    }
    
    
    public func pinToSuperviewTop(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.Top, constant: margin)
    }
    
    public func pinToSuperviewBottom(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.Bottom, constant: -margin)
    }
    
    public func pinToSuperviewLeft(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.Left, constant: margin)
    }
    
    public func pinToSuperviewRight(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.Right, constant: -margin)
    }
    
    public func pinToSuperviewLeading(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.Leading, constant: margin)
    }
    
    public func pinToSuperviewTrailing(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.Trailing, constant: -margin)
    }
    
    // MARK: - Pin to superview as strip
    
    public func pinToSuperviewAsTopStrip(height: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewLeading(0))
        constraints.append(pinToSuperviewTrailing(0))
        constraints.append(pinHeight(height))
        
        return constraints
    }
    
    public func pinToSuperviewAsBottomStrip(height: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinToSuperviewLeading(0))
        constraints.append(pinToSuperviewTrailing(0))
        constraints.append(pinHeight(height))
        
        return constraints
    }
    
    public func pinToSuperviewAsLeftStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeft(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    public func pinToSuperviewAsRightStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewRight(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    public func pinToSuperviewAsLeadingStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeading(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    public func pinToSuperviewAsTrailingStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTrailing(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    // MARK: - Pin to superview centre
    
    public func pinToSuperviewCentreX() -> NSLayoutConstraint{
        return matchAttributeToSuperview(.CenterX, constant: 0)
    }
    
    public func pinToSuperviewCentreX(offset offset: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.CenterX, constant: offset)
    }
    
    public func pinToSuperviewCentreY() -> NSLayoutConstraint{
        return matchAttributeToSuperview(.CenterY, constant: 0)
    }
    
    public func pinToSuperviewCentreY(offset offset: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.CenterY, constant: offset)
    }
    
    public func pinToSuperviewCentre() -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewCentreX())
        constraints.append(pinToSuperviewCentreY())
        return constraints
    }
    
    // MARK: - Match superview attributes
    
    public func matchAttributeToSuperview(attribute: NSLayoutAttribute, constant: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(attribute, multiplier: 1, constant: constant)
    }
    
    public func matchAttributeToSuperview(attribute: NSLayoutAttribute, multiplier: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(attribute, multiplier: multiplier, constant: 0)
    }
    
    public func matchAttributeToSuperview(attribute: NSLayoutAttribute, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint{
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: attribute,
                                            relatedBy: .Equal,
                                            toItem: superview,
                                            attribute: attribute,
                                            multiplier: multiplier,
                                            constant: constant)
        
        superview!.addConstraint(constraint)
        return constraint
    }
    
    // MARK:- Pin views in subview heirarchy

    public func pinViewsVertically(topView topView: UIView, bottomView: UIView, separation: CGFloat) -> NSLayoutConstraint{
        
        let constraint = NSLayoutConstraint(item: topView,
                                            attribute: .Bottom,
                                            relatedBy: .Equal,
                                            toItem: bottomView,
                                            attribute: .Top,
                                            multiplier: 1,
                                            constant: separation)
        addConstraint(constraint)
        return constraint
    }
    
    public func pinViewsHorizonally(leadingView leadingView: UIView, trailingView: UIView, separation: CGFloat) -> NSLayoutConstraint{
        
        let constraint = NSLayoutConstraint(item: leadingView,
                                            attribute: .Trailing,
                                            relatedBy: .Equal,
                                            toItem: trailingView,
                                            attribute: .Leading,
                                            multiplier: 1,
                                            constant: separation)
        addConstraint(constraint)
        return constraint
    }
    
    public func pinViewsHorizonally(leftView leftView: UIView, rightView: UIView, separation: CGFloat) -> NSLayoutConstraint{
        
        let constraint = NSLayoutConstraint(item: leftView,
                                            attribute: .Right,
                                            relatedBy: .Equal,
                                            toItem: rightView,
                                            attribute: .Left,
                                            multiplier: 1,
                                            constant: separation)
        addConstraint(constraint)
        return constraint
    }
    
    public func pinViewsWidthToSame(firstView: UIView, secondView: UIView) -> NSLayoutConstraint{
        
        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: .Width,
                                            relatedBy: .Equal,
                                            toItem: secondView,
                                            attribute: .Width,
                                            multiplier: 1,
                                            constant: 0)
        addConstraint(constraint)
        return constraint
    }
    
    public func pinViewsHeightToSame(firstView: UIView, secondView: UIView) -> NSLayoutConstraint{
        
        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: .Height,
                                            relatedBy: .Equal,
                                            toItem: secondView,
                                            attribute: .Height,
                                            multiplier: 1,
                                            constant: 0)
        addConstraint(constraint)
        return constraint
    }

}