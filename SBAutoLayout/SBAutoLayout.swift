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
    
    @discardableResult public func pinWidth(_ width: CGFloat) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: width)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinHeight(_ height: CGFloat) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: height)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinAspectRatio(width: CGFloat, height: CGFloat) -> NSLayoutConstraint {
    
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: self,
                                                 attribute: .height,
                                                 multiplier: width/height,
                                                 constant: 0)
        
        addConstraint(constraint)
        return constraint
    }
    
    // MARK: - Pin to superview edges
    
    @discardableResult public func pinToSuperviewEdges() -> [NSLayoutConstraint]{
        return self.pinToSuperviewEdges(top: 0, bottom: 0, leading: 0, trailing: 0)
    }
    
    @discardableResult public func pinToSuperviewEdges(top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(margin: top))
        constraints.append(pinToSuperviewBottom(margin: bottom))
        constraints.append(pinToSuperviewLeading(margin: leading))
        constraints.append(pinToSuperviewTrailing(margin: trailing))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewEdges(insets: UIEdgeInsets) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false;
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(margin: insets.top))
        constraints.append(pinToSuperviewBottom(margin: insets.bottom))
        constraints.append(pinToSuperviewLeading(margin: insets.left))
        constraints.append(pinToSuperviewTrailing(margin: insets.right))
        
        return constraints
    }
    
    
    @discardableResult public func pinToSuperviewTop(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.top, constant: margin)
    }
    
    @discardableResult public func pinToSuperviewBottom(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.bottom, constant: -margin)
    }
    
    @discardableResult public func pinToSuperviewLeft(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.left, constant: margin)
    }
    
    @discardableResult public func pinToSuperviewRight(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.right, constant: -margin)
    }
    
    @discardableResult public func pinToSuperviewLeading(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.leading, constant: margin)
    }
    
    @discardableResult public func pinToSuperviewTrailing(margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.trailing, constant: -margin)
    }
    
    // MARK: - Pin to superview as strip
    
    @discardableResult public func pinToSuperviewAsTopStrip(height: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(margin: 0))
        constraints.append(pinToSuperviewLeading(margin: 0))
        constraints.append(pinToSuperviewTrailing(margin: 0))
        constraints.append(pinHeight(height))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsBottomStrip(height: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewBottom(margin: 0))
        constraints.append(pinToSuperviewLeading(margin: 0))
        constraints.append(pinToSuperviewTrailing(margin: 0))
        constraints.append(pinHeight(height))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsLeftStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeft(margin: 0))
        constraints.append(pinToSuperviewTop(margin: 0))
        constraints.append(pinToSuperviewBottom(margin: 0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsRightStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewRight(margin: 0))
        constraints.append(pinToSuperviewTop(margin: 0))
        constraints.append(pinToSuperviewBottom(margin: 0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsLeadingStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeading(margin: 0))
        constraints.append(pinToSuperviewTop(margin: 0))
        constraints.append(pinToSuperviewBottom(margin: 0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsTrailingStrip(width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTrailing(margin: 0))
        constraints.append(pinToSuperviewTop(margin: 0))
        constraints.append(pinToSuperviewBottom(margin: 0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    // MARK: - Pin to superview centre
    
    @discardableResult public func pinToSuperviewCentreX(offset: CGFloat = 0) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerX, constant: offset)
    }
    
    @discardableResult public func pinToSuperviewCentreY(offset: CGFloat = 0) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerY, constant: offset)
    }
    
    @discardableResult public func pinToSuperviewCentre() -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewCentreX())
        constraints.append(pinToSuperviewCentreY())
        return constraints
    }
    
    // MARK: - Match superview attributes
    
    public func matchAttributeToSuperview(_ attribute: NSLayoutAttribute, constant: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(attribute, multiplier: 1, constant: constant)
    }
    
    public func matchAttributeToSuperview(_ attribute: NSLayoutAttribute, multiplier: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(attribute, multiplier: multiplier, constant: 0)
    }
    
    public func matchAttributeToSuperview(_ attribute: NSLayoutAttribute, multiplier: CGFloat, constant: CGFloat) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: attribute,
                                            relatedBy: .equal,
                                            toItem: superview,
                                            attribute: attribute,
                                            multiplier: multiplier,
                                            constant: constant)
        
        superview!.addConstraint(constraint)
        return constraint
    }
    
    // MARK:- Pin views in subview heirarchy

    @discardableResult public func pinViewsVertically(topView: UIView, bottomView: UIView, separation: CGFloat = 0) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: topView,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: bottomView,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: separation)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsHorizonally(leadingView: UIView, trailingView: UIView, separation: CGFloat) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: leadingView,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: trailingView,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: separation)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsHorizonally(leftView: UIView, rightView: UIView, separation: CGFloat) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: leftView,
                                            attribute: .right,
                                            relatedBy: .equal,
                                            toItem: rightView,
                                            attribute: .left,
                                            multiplier: 1,
                                            constant: separation)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsWidthToSame(firstView: UIView, secondView: UIView) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: secondView,
                                            attribute: .width,
                                            multiplier: 1,
                                            constant: 0)
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsHeightToSame(firstView: UIView, secondView: UIView) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: secondView,
                                            attribute: .height,
                                            multiplier: 1,
                                            constant: 0)
        addConstraint(constraint)
        return constraint
    }

}
