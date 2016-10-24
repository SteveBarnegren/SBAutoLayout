//
//  ViewController.swift
//  SBAutoLayout
//
//  Created by Steve Barnegren on 10/17/2016.
//  Copyright (c) 2016 Steve Barnegren. All rights reserved.
//

import UIKit
import SBAutoLayout

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var items: [ExampleItem]!
    let rectangleDrawingView = RectangleDrawingView()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rectangle drawing view
        view.addSubview(self.rectangleDrawingView)
        self.rectangleDrawingView.pinToSuperviewEdges()
        
        // Collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.pinToSuperviewEdges()
        collectionView.backgroundColor = UIColor.orange
        collectionView.register(ExampleCell.self, forCellWithReuseIdentifier: String(describing: ExampleCell.self) )
        
        let introCellIdentifier = String(describing: IntroCell.self)
        let introCellNib = UINib(nibName: introCellIdentifier, bundle: nil)
        collectionView.register(introCellNib, forCellWithReuseIdentifier: introCellIdentifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = UIColor.clear
        self.collectionView.showsHorizontalScrollIndicator = false
        
        // Create items
        self.items = makeItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        redraw()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        redraw()
    }
    
    func makeItems() -> [ExampleItem] {
        
        var items = [ExampleItem]()
        
      
        // Pin to superview edges
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .center, layoutActions: [
                PinToSuperviewEdges(viewNum: 0)
                ])
        )
        
        // Pin to super view edges separately with margins (using left / right)
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .centerInView(viewNumber: 0), layoutActions: [
                PinToSuperviewTop(viewNum: 0, margin: 20),
                PinToSuperviewBottom(viewNum: 0, margin: 20),
                PinToSuperviewLeft(viewNum: 0, margin: 20),
                PinToSuperviewRight(viewNum: 0, margin: 20),
                ])
        )
       
        // Pin to super view edges separately with margins (using leading / trailing)
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .centerInView(viewNumber: 0), layoutActions: [
                PinToSuperviewTop(viewNum: 0, margin: 60),
                PinToSuperviewBottom(viewNum: 0, margin: 40),
                PinToSuperviewLeading(viewNum: 0, margin: 15),
                PinToSuperviewTrailing(viewNum: 0, margin: 15),
                ])
        )
        
        // Pin as top strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .belowView(viewNumber: 0), layoutActions: [
                PinToSuperviewAsTopStrip(viewNum: 0, height: 50)
                ])
        )
        
        // Pin as bottom strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                PinToSuperviewAsBottomStrip(viewNum: 0, height: 150)
                ])
        )
        
        // Pin as left strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .rightOfView(viewNumber: 0), layoutActions: [
                PinToSuperviewAsLeftStrip(viewNum: 0, width: 15)
                ])
        )
        
        // Pin as right strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .leftOfView(viewNumber: 0), layoutActions: [
                PinToSuperviewAsRightStrip(viewNum: 0, width: 60)
                ])
        )
        
        // Pin as leading strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .rightOfView(viewNumber: 0), layoutActions: [
                PinToSuperviewAsLeadingStrip(viewNum: 0, width: 40)
                ])
        )
        
        // Pin as trailing strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .leftOfView(viewNumber: 0), layoutActions: [
                PinToSuperviewAsTrailingStrip(viewNum: 0, width: 20)
                ])
        )

        
        // Pin to center with width / height
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                PinToSuperviewCenter(viewNum: 0),
                PinHeight(viewNum: 0, height: 80),
                PinWidth(viewNum: 0, width: 250)
                ])
        )
        
        // Pin to center with width / height and Y offset
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .belowView(viewNumber: 0), layoutActions: [
                PinToSuperviewCenterX(viewNum: 0, offset: nil),
                PinToSuperviewCenterY(viewNum: 0, offset: -100),
                PinHeight(viewNum: 0, height: 60),
                PinWidth(viewNum: 0, width: 100)
                ])
        )
     
        // Pin to center with width / height and Y and X offset
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .belowView(viewNumber: 0), layoutActions: [
                PinToSuperviewCenterX(viewNum: 0, offset: -100),
                PinToSuperviewCenterY(viewNum: 0, offset: -100),
                PinHeight(viewNum: 0, height: 50),
                PinWidth(viewNum: 0, width: 50)
                ])
        )
        
        // Pin to center with width / height and Y and X offset
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                PinToSuperviewCenterX(viewNum: 0, offset: 70),
                PinToSuperviewCenterY(viewNum: 0, offset: 70),
                PinHeight(viewNum: 0, height: 100),
                PinWidth(viewNum: 0, width: 100)
                ])
        )
      
        // Pin to center with width / aspect ratio
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                PinToSuperviewCenter(viewNum: 0),
                PinHeight(viewNum: 0, height: 100),
                PinAspectRatio(viewNum: 0, width: 1, height: 1)
                ])
        )
        
        // Pin to center with width / aspect ratio (wider)
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                PinToSuperviewCenter(viewNum: 0),
                PinHeight(viewNum: 0, height: 100),
                PinAspectRatio(viewNum: 0, width: 3, height: 1)
                ])
        )
 
  
        // Pin multiple views
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                // view 0
                PinToSuperviewCenter(viewNum: 0),
                PinHeight(viewNum: 0, height: 100),
                PinWidth(viewNum: 0, width: 100),
                
                // view 1
                PinToSuperviewCenterX(viewNum: 1, offset: nil),
                PinHeight(viewNum: 1, height: 80),
                PinWidth(viewNum: 1, width: 80),
                PinAboveView(viewNum: 1, otherViewNum: 0, separation: 10)
                ])
        )
        
        
        
        // Pin multiple views
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 1), layoutActions: [
                // view 1
                PinToSuperviewAsTopStrip(viewNum: 1, height: 60),
                
                // view 0
                PinToSuperviewCenterX(viewNum: 0, offset: nil),
                PinHeight(viewNum: 0, height: 50),
                PinWidth(viewNum: 0, width: 50),
                PinBelowView(viewNum: 0, otherViewNum: 1, separation: 25)
                ])
        )
        
        // Pin multiple views
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .aboveView(viewNumber: 1), layoutActions: [
                // view 1
                PinToSuperviewAsBottomStrip(viewNum: 0, height: 80),
                
                // view 0
                PinToSuperviewLeft(viewNum: 1, margin: 5),
                PinHeight(viewNum: 1, height: 50),
                PinAspectRatio(viewNum: 1, width: 1, height: 1),
                PinAboveView(viewNum: 1, otherViewNum: 0, separation: 5)

                ])
        )
        
        // Pin to right of view
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                // view 0
                PinToSuperviewCenter(viewNum: 0),
                PinHeight(viewNum: 0, height: 100),
                PinAspectRatio(viewNum: 0, width: 1, height: 1),

                // view 1
                PinToSuperviewCenterY(viewNum: 1, offset: nil),
                PinHeight(viewNum: 1, height: 50),
                PinAspectRatio(viewNum: 1, width: 1, height: 1),
                PinTrailingFromView(viewNum: 1, otherViewNum: 0, separation: 5)

                ])
        )
        
        
        
        // Pin to left of view
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                // view 0
                PinToSuperviewCenter(viewNum: 1),
                PinHeight(viewNum: 1, height: 100),
                PinAspectRatio(viewNum: 1, width: 1, height: 1),
                
                // view 1
                PinToSuperviewCenterY(viewNum: 0, offset: nil),
                PinHeight(viewNum: 0, height: 50),
                PinAspectRatio(viewNum: 0, width: 1, height: 1),
                PinLeadingToView(viewNum: 0, otherViewNum: 1, separation: 5),
                ])
        )
        
       
        // Pin leading to view
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                
                // view 0
                PinToSuperviewLeft(viewNum: 0, margin: 20),
                PinToSuperviewTop(viewNum: 0, margin: 20),
                PinToSuperviewBottom(viewNum: 0, margin: 200),
                PinWidth(viewNum: 0, width: 40),
                
                // view 1
                PinToSuperviewRight(viewNum: 1, margin: 20),
                PinToSuperviewTop(viewNum: 1, margin: 20),
                PinToSuperviewBottom(viewNum: 1, margin: 200),
                PinToRightOfView(viewNum: 1, otherViewNum: 0, separation: 20),
                ])
        )
        
        // Pin views width to same
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                
                // view 1
                PinToSuperviewRight(viewNum: 1, margin: 20),
                PinToSuperviewTop(viewNum: 1, margin: 20),
                PinToSuperviewBottom(viewNum: 1, margin: 200),
                
                // view 0
                PinToSuperviewLeft(viewNum: 0, margin: 20),
                PinToSuperviewTop(viewNum: 0, margin: 20),
                PinToSuperviewBottom(viewNum: 0, margin: 200),
                PinToLeftOfView(viewNum: 0, otherViewNum: 1, separation: 20),
                PinWidthToSameAsView(viewNum: 0, otherViewNum: 1),

                ])
        )
 

        
        // Pin leading
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                
                // view 0
                PinToSuperviewTop(viewNum: 0, margin: 200),
                PinToSuperviewLeft(viewNum: 0, margin: 20),
                PinToSuperviewRight(viewNum: 0, margin: 20),
                
                // view 1
                PinToSuperviewBottom(viewNum: 1, margin: 20),
                PinToSuperviewLeft(viewNum: 1, margin: 20),
                PinToSuperviewRight(viewNum: 1, margin: 20),
                PinBelowView(viewNum: 1, otherViewNum: 0, separation: 20),
                PinHeightToSameAsView(viewNum: 1, otherViewNum: 0)
                ])
        )
        
        return items
    }
    
    func redraw() {
        
        var offset = collectionView.contentOffset.x / collectionView.bounds.size.width
        offset = min(offset, CGFloat(items.count))
        offset = max(0, offset)
        
        let beforeIndex = Int(offset)
        let nextIndex = beforeIndex+1
        
        let numBeforeRects = numRectsForView(cellIndex: beforeIndex)
        let numNextRects = numRectsForView(cellIndex: nextIndex)

        let numRectsToDraw = max(numBeforeRects, numNextRects)
        
        var rectangles: [RectangleDrawingView.Rectangle] = []
        
        for i in 0..<numRectsToDraw {
            
            let beforeNum = min(numBeforeRects-1, i)
            let nextNum = min(numNextRects-1, i)

            var beforeRect = rectForView(viewNumber: beforeNum, cellIndex: beforeIndex)
            var nextRect = rectForView(viewNumber: nextNum, cellIndex: nextIndex)
            
            if beforeRect == nil {
                beforeRect = nextRect ?? .zero
            }
            
            if nextRect == nil {
                nextRect = beforeRect ?? .zero
            }
            
            let interpolationPct = offset - CGFloat(beforeIndex)
            let rect = interpolateRects(startRect: beforeRect!,
                                        endRect: nextRect!,
                                        t: interpolationPct)
            
            let rectangle = RectangleDrawingView.Rectangle(rect: rect,
                                                           color: ViewNamesAndColors.colorForView(number: i))
            rectangles.append(rectangle)
        }
       
        rectangleDrawingView.rectangles = rectangles.reversed()
    }
    
    func numRectsForView(cellIndex: Int) -> Int {
        
        let indexPath = IndexPath(item: cellIndex, section: 0)
        guard let cell = collectionView.cellForItem(at: indexPath) as? AutoLayoutExampleCell else {
            return 0
        }
        
        return cell.numberOfViews()
    }

    func rectForView(viewNumber: Int, cellIndex: Int) -> CGRect? {
        
        let indexPath = IndexPath(item: cellIndex, section: 0)
        guard let cell = collectionView.cellForItem(at: indexPath) as? AutoLayoutExampleCell else {
            return nil
        }
        
        let rect = cell.rectForView(viewNumber: viewNumber)
        return rect
    }
    
    func interpolateRects(startRect: CGRect, endRect: CGRect, t: CGFloat) -> CGRect {
        
        let x = startRect.origin.x + (endRect.origin.x - startRect.origin.x) * t
        let y = startRect.origin.y + (endRect.origin.y - startRect.origin.y) * t
        let w = startRect.size.width + (endRect.size.width - startRect.size.width) * t
        let h = startRect.size.height + (endRect.size.height - startRect.size.height) * t
        
        return CGRect(x: x,
                      y: y,
                      width: w,
                      height: h)
    }

    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count + 1 // +1 for intro cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let identifier = String(describing: IntroCell.self)

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! IntroCell
            return cell
        }
        else{
            let identifier = String(describing: ExampleCell.self)
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ExampleCell
            cell.configureWithItem(item: items[indexPath.row-1])
            return cell

        }
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        redraw()
    }
    
}


