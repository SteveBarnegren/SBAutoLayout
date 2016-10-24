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
    
    @discardableResult public func pinWidth(_ width: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: width)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinHeight(_ height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: nil,
                                                 attribute: .notAnAttribute,
                                                 multiplier: 1,
                                                 constant: height)
        
        if let priority = priority {
            constraint.priority = priority
        }

        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinAspectRatio(width: CGFloat, height: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
    
        translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint.init(item: self,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: self,
                                                 attribute: .height,
                                                 multiplier: width/height,
                                                 constant: 0)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    // MARK: - Pin to superview edges
    
    @discardableResult public func pinToSuperviewEdges(priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        return self.pinToSuperviewEdges(top: 0, bottom: 0, leading: 0, trailing: 0, priority: priority)
    }
    
    @discardableResult public func pinToSuperviewEdges(top: CGFloat, bottom: CGFloat, leading: CGFloat, trailing: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(margin: top, priority: priority))
        constraints.append(pinToSuperviewBottom(margin: bottom, priority: priority))
        constraints.append(pinToSuperviewLeading(margin: leading, priority: priority))
        constraints.append(pinToSuperviewTrailing(margin: trailing, priority: priority))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewEdges(insets: UIEdgeInsets, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        translatesAutoresizingMaskIntoConstraints = false;
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(margin: insets.top, priority: priority))
        constraints.append(pinToSuperviewBottom(margin: insets.bottom, priority: priority))
        constraints.append(pinToSuperviewLeading(margin: insets.left, priority: priority))
        constraints.append(pinToSuperviewTrailing(margin: insets.right, priority: priority))
        
        return constraints
    }
    
    
    @discardableResult public func pinToSuperviewTop(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.top, constant: margin, priority: priority)
    }
    
    @discardableResult public func pinToSuperviewBottom(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.bottom, constant: -margin, priority: priority)
    }
    
    @discardableResult public func pinToSuperviewLeft(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.left, constant: margin, priority: priority)
    }
    
    @discardableResult public func pinToSuperviewRight(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.right, constant: -margin, priority: priority)
    }
    
    @discardableResult public func pinToSuperviewLeading(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.leading, constant: margin, priority: priority)
    }
    
    @discardableResult public func pinToSuperviewTrailing(margin: CGFloat, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.trailing, constant: -margin, priority: priority)
    }
    
    // MARK: - Pin to superview as strip
    
    @discardableResult public func pinToSuperviewAsTopStrip(height: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTop(margin: 0, priority: priority))
        constraints.append(pinToSuperviewLeading(margin: 0, priority: priority))
        constraints.append(pinToSuperviewTrailing(margin: 0, priority: priority))
        constraints.append(pinHeight(height, priority: priority))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsBottomStrip(height: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewBottom(margin: 0, priority: priority))
        constraints.append(pinToSuperviewLeading(margin: 0, priority: priority))
        constraints.append(pinToSuperviewTrailing(margin: 0, priority: priority))
        constraints.append(pinHeight(height, priority: priority))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsLeftStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeft(margin: 0, priority: priority))
        constraints.append(pinToSuperviewTop(margin: 0, priority: priority))
        constraints.append(pinToSuperviewBottom(margin: 0, priority: priority))
        constraints.append(pinWidth(width, priority: priority))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsRightStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewRight(margin: 0, priority: priority))
        constraints.append(pinToSuperviewTop(margin: 0, priority: priority))
        constraints.append(pinToSuperviewBottom(margin: 0, priority: priority))
        constraints.append(pinWidth(width, priority: priority))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsLeadingStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewLeading(margin: 0, priority: priority))
        constraints.append(pinToSuperviewTop(margin: 0, priority: priority))
        constraints.append(pinToSuperviewBottom(margin: 0, priority: priority))
        constraints.append(pinWidth(width, priority: priority))
        
        return constraints
    }
    
    @discardableResult public func pinToSuperviewAsTrailingStrip(width: CGFloat, priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewTrailing(margin: 0, priority: priority))
        constraints.append(pinToSuperviewTop(margin: 0, priority: priority))
        constraints.append(pinToSuperviewBottom(margin: 0, priority: priority))
        constraints.append(pinWidth(width, priority: priority))
        
        return constraints
    }
    
    // MARK: - Pin to superview centre
    
    @discardableResult public func pinToSuperviewCentreX(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerX, constant: offset)
    }
    
    @discardableResult public func pinToSuperviewCentreY(offset: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return matchAttributeToSuperview(.centerY, constant: offset)
    }
    
    @discardableResult public func pinToSuperviewCentre(priority: UILayoutPriority? = nil) -> [NSLayoutConstraint]{
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(pinToSuperviewCentreX(priority: priority))
        constraints.append(pinToSuperviewCentreY(priority: priority))
        return constraints
    }
    
    // MARK: - Match superview attributes
    
    public func matchAttributeToSuperview(_ attribute: NSLayoutAttribute, multiplier: CGFloat = 1, constant: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: attribute,
                                            relatedBy: .equal,
                                            toItem: superview,
                                            attribute: attribute,
                                            multiplier: multiplier,
                                            constant: constant)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        superview!.addConstraint(constraint)
        return constraint
    }
    
    // MARK:- Pin to other views

    @discardableResult public func pinAboveView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        otherView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: otherView,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: -separation)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        commonSuperviewWithView(otherView).addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinBelowView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return otherView.pinAboveView(self, separation: separation, priority: priority)
    }
    
    @discardableResult public func pinToLeftOfView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        otherView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .right,
                                            relatedBy: .equal,
                                            toItem: otherView,
                                            attribute: .left,
                                            multiplier: 1,
                                            constant: -separation)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        commonSuperviewWithView(otherView).addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinToRightOfView(_ otherView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        return otherView.pinToLeftOfView(self, separation: separation, priority: priority)
    }
    
    @discardableResult public func pinWidthToSameAsView(_ otherView: UIView, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        otherView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: otherView,
                                            attribute: .width,
                                            multiplier: 1,
                                            constant: 0)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        commonSuperviewWithView(otherView).addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinHeightToSameAsView(_ otherView: UIView, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        translatesAutoresizingMaskIntoConstraints = false
        otherView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: otherView,
                                            attribute: .height,
                                            multiplier: 1,
                                            constant: 0)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        commonSuperviewWithView(otherView).addConstraint(constraint)
        return constraint
    }



    // MARK:- Pin views in subview heirarchy

    @discardableResult public func pinViewsVertically(topView: UIView, bottomView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: topView,
                                            attribute: .bottom,
                                            relatedBy: .equal,
                                            toItem: bottomView,
                                            attribute: .top,
                                            multiplier: 1,
                                            constant: -separation)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsHorizontally(leadingView: UIView, trailingView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        leadingView.translatesAutoresizingMaskIntoConstraints = false
        trailingView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: leadingView,
                                            attribute: .trailing,
                                            relatedBy: .equal,
                                            toItem: trailingView,
                                            attribute: .leading,
                                            multiplier: 1,
                                            constant: -separation)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsHorizontally(leftView: UIView, rightView: UIView, separation: CGFloat = 0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        leftView.translatesAutoresizingMaskIntoConstraints = false
        rightView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: leftView,
                                            attribute: .right,
                                            relatedBy: .equal,
                                            toItem: rightView,
                                            attribute: .left,
                                            multiplier: 1,
                                            constant: -separation)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsWidthToSame(firstView: UIView, secondView: UIView, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false

        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: .width,
                                            relatedBy: .equal,
                                            toItem: secondView,
                                            attribute: .width,
                                            multiplier: 1,
                                            constant: 0)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    @discardableResult public func pinViewsHeightToSame(firstView: UIView, secondView: UIView, priority: UILayoutPriority? = nil) -> NSLayoutConstraint{
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = NSLayoutConstraint(item: firstView,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: secondView,
                                            attribute: .height,
                                            multiplier: 1,
                                            constant: 0)
        
        if let priority = priority {
            constraint.priority = priority
        }
        
        addConstraint(constraint)
        return constraint
    }
    
    // MARK:- Get common superview
    
    func commonSuperviewWithView(_ otherView: UIView) -> UIView {
        
        var testView = self
        
        while otherView.isDescendant(of: testView) == false {
            
            guard let superview = testView.superview else {
                print("Views must share a common superview")
                abort()
            }
            
            testView = superview
        }
        
       return testView
    }

}
