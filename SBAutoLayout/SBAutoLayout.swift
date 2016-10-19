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
    
    // MARK: - Pin to superview edges
    
    @discardableResult public func pinToSuperviewEdges() -> [NSLayoutConstraint]{
        return self.pinToSuperviewEdges(top: 0, bottom: 0, leading: 0, trailing: 0)
    }
    
    @discardableResult public func pinToSuperviewEdges(top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(top))
        constraints.append(pinToSuperviewBottom(bottom))
        constraints.append(pinToSuperviewLeading(leading))
        constraints.append(pinToSuperviewTrailing(trailing))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewEdges(_ insets: UIEdgeInsets) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false;
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(insets.top))
        constraints.append(pinToSuperviewBottom(insets.bottom))
        constraints.append(pinToSuperviewLeading(insets.left))
        constraints.append(pinToSuperviewTrailing(insets.right))
        
        return constraints
    }
    
    
    @discardableResult public func pinToSuperviewTop(_ margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.top, constant: margin)
    }
    
    @discardableResult public func pinToSuperviewBottom(_ margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.bottom, constant: -margin)
    }
    
    @discardableResult public func pinToSuperviewLeft(_ margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.left, constant: margin)
    }
    
    @discardableResult public func pinToSuperviewRight(_ margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.right, constant: -margin)
    }
    
    @discardableResult public func pinToSuperviewLeading(_ margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.leading, constant: margin)
    }
    
    @discardableResult public func pinToSuperviewTrailing(_ margin: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.trailing, constant: -margin)
    }
    
    // MARK: - Pin to superview as strip
    
    @discardableResult public func pinToSuperviewAsTopStrip(_ height: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewLeading(0))
        constraints.append(pinToSuperviewTrailing(0))
        constraints.append(pinHeight(height))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsBottomStrip(_ height: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinToSuperviewLeading(0))
        constraints.append(pinToSuperviewTrailing(0))
        constraints.append(pinHeight(height))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsLeftStrip(_ width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeft(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsRightStrip(_ width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewRight(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsLeadingStrip(_ width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeading(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsTrailingStrip(_ width: CGFloat) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTrailing(0))
        constraints.append(pinToSuperviewTop(0))
        constraints.append(pinToSuperviewBottom(0))
        constraints.append(pinWidth(width))
        
        return constraints
    }
    
    // MARK: - Pin to superview centre
    
    @discardableResult public func pinToSuperviewCentreX() -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerX, constant: 0)
    }
    
    @discardableResult public func pinToSuperviewCentreX(offset: CGFloat) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerX, constant: offset)
    }
    
    @discardableResult public func pinToSuperviewCentreY() -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerY, constant: 0)
    }
    
    @discardableResult public func pinToSuperviewCentreY(offset: CGFloat) -> NSLayoutConstraint{
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

    @discardableResult public func pinViewsVertically(topView: UIView, bottomView: UIView, separation: CGFloat) -> NSLayoutConstraint{
        
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
    
    @discardableResult public func pinViewsWidthToSame(_ firstView: UIView, secondView: UIView) -> NSLayoutConstraint{
        
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
    
    @discardableResult public func pinViewsHeightToSame(_ firstView: UIView, secondView: UIView) -> NSLayoutConstraint{
        
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
