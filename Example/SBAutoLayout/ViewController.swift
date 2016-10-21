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
        
        
        /*
        // Pin to superview edges
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .center, layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewEdges(viewNum: 0))
                ])
        )
        
        // Pin to super view edges separately with margins (using left / right)
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .centerInView(viewNumber: 0), layoutActions: [
                            AutoLayoutAction(layoutFunction: .pinToSuperviewTop(viewNum: 0, margin: 20)),
                            AutoLayoutAction(layoutFunction: .pinToSuperviewBottom(viewNum: 0, margin: 20)),
                            AutoLayoutAction(layoutFunction: .pinToSuperviewLeft(viewNum: 0, margin: 20)),
                            AutoLayoutAction(layoutFunction: .pinToSuperviewRight(viewNum: 0, margin: 20))
                ])
        )
        
        // Pin to super view edges separately with margins (using leading / trailing)
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .centerInView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewTop(viewNum: 0, margin: 60)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewBottom(viewNum: 0, margin: 40)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewLeading(viewNum: 0, margin: 15)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewTrailing(viewNum: 0, margin: 15))
                ])
        )
        
        // Pin as top strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .belowView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsTopStrip(viewNum: 0, height: 50)),
                ])
        )
        
        // Pin as bottom strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsBottomStrip(viewNum: 0, height: 150)),
                ])
        )
        
        // Pin as left strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .rightOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsLeftStrip(viewNum: 0, width: 15)),
                ])
        )
        
        // Pin as right strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .leftOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsRightStrip(viewNum: 0, width: 60)),
                ])
        )
        
        // Pin as leading strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .rightOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsLeadingStrip(viewNum: 0, width: 40)),
                ])
        )
        
        // Pin as trailing strip
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .leftOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsTrailingStrip(viewNum: 0, width: 20)),
                ])
        )

        
        // Pin to center with width / height
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenter(viewNum: 0)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 80)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 0, width: 250)),
                ])
        )
        
        // Pin to center with width / height and Y offset
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .belowView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterX(viewNum: 0, offset: nil)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterY(viewNum: 0, offset: -100)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 60)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 0, width: 100)),
                ])
        )
        
        // Pin to center with width / height and Y and X offset
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .belowView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterX(viewNum: 0, offset: -100)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterY(viewNum: 0, offset: -100)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 50)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 0, width: 50)),
                ])
        )
        
        // Pin to center with width / height and Y and X offset
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterX(viewNum: 0, offset: 70)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterY(viewNum: 0, offset: 70)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 100)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 0, width: 100)),
                ])
        )
        
        // Pin to center with width / aspect ratio
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenter(viewNum: 0)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 100)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 0, width: 1, height: 1))
                ])
        )
        
        // Pin to center with width / aspect ratio (wider)
        items.append(
            ExampleItem(numberOfViews: 1, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenter(viewNum: 0)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 100)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 0, width: 3, height: 1))
                ])
        )
 
 
        // Pin multiple views
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenter(viewNum: 0)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 100)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 0, width: 100)),
                
                // view 1
                //AutoLayoutAction(layoutFunction: .pinToSuperviewCenterY(viewNum: 1, offset: -200)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterX(viewNum: 1, offset: nil)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 1, height: 80)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 1, width: 80)),
                AutoLayoutAction(layoutFunction: .pinViewsVertically(topViewNum: 1, bottomViewNum: 0, separation: 10)),
                ])
        )
        
        // Pin multiple views
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 1), layoutActions: [
                // view 1
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsTopStrip(viewNum: 1, height: 60)),
                
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterX(viewNum: 0, offset: nil)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 50)),
                AutoLayoutAction(layoutFunction: .pinWidth(viewNum: 0, width: 50)),
                AutoLayoutAction(layoutFunction: .pinViewsVertically(topViewNum: 1, bottomViewNum: 0, separation: 25)),
                ])
        )
        
        // Pin multiple views
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .aboveView(viewNumber: 1), layoutActions: [
                // view 1
                AutoLayoutAction(layoutFunction: .pinToSuperviewAsBottomStrip(viewNum: 0, height: 80)),
                
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewLeft(viewNum: 1, margin: 5)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 1, height: 50)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 1, width: 1, height: 1)),
                AutoLayoutAction(layoutFunction: .pinViewsVertically(topViewNum: 1, bottomViewNum: 0, separation: 5)),
                ])
        )
        
        // Pin views horizontally (left / right)
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenter(viewNum: 0)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 100)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 0, width: 1, height: 1)),

                // view 1
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterY(viewNum: 1, offset: nil)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 1, height: 50)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 1, width: 1, height: 1)),
                AutoLayoutAction(layoutFunction: .pinViewsHorizontallyLeftRight(leftViewNum: 0, rightViewNum: 1, separation: 5)),
                ])
        )
        
        // Pin views horizontally (leading / trailing)
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenter(viewNum: 1)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 1, height: 100)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 1, width: 1, height: 1)),
                
                // view 1
                AutoLayoutAction(layoutFunction: .pinToSuperviewCenterY(viewNum: 0, offset: nil)),
                AutoLayoutAction(layoutFunction: .pinHeight(viewNum: 0, height: 50)),
                AutoLayoutAction(layoutFunction: .pinAspectRatio(viewNum: 0, width: 1, height: 1)),
                AutoLayoutAction(layoutFunction: .pinViewsHorizontallyLeadingTrailing(leadingViewNum: 0, trailingViewNum: 1, separation: 5)),
                ])
        )
        
        // Pin views width to same
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .belowView(viewNumber: 0), layoutActions: [
                
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewLeft(viewNum: 0, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewTop(viewNum: 0, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewBottom(viewNum: 0, margin: 200)),
                
                // view 1
                AutoLayoutAction(layoutFunction: .pinToSuperviewRight(viewNum: 1, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewTop(viewNum: 1, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewBottom(viewNum: 1, margin: 200)),
                AutoLayoutAction(layoutFunction: .pinViewsHorizontallyLeftRight(leftViewNum: 0, rightViewNum: 1, separation: 20)),
                AutoLayoutAction(layoutFunction: .pinViewsWidthToSame(firstViewNum: 0, secondViewNum: 1)),
                ])
        )
 
 */
        
        // Pin views heights to same
        items.append(
            ExampleItem(numberOfViews: 2, textPosition: .aboveView(viewNumber: 0), layoutActions: [
                
                // view 0
                AutoLayoutAction(layoutFunction: .pinToSuperviewTop(viewNum: 0, margin: 200)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewLeft(viewNum: 0, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewRight(viewNum: 0, margin: 20)),
                
                // view 1
                AutoLayoutAction(layoutFunction: .pinToSuperviewBottom(viewNum: 1, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewLeft(viewNum: 1, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinToSuperviewRight(viewNum: 1, margin: 20)),
                AutoLayoutAction(layoutFunction: .pinViewsVertically(topViewNum: 0, bottomViewNum: 1, separation: 20)),
                AutoLayoutAction(layoutFunction: .pinViewsHeightToSame(firstViewNum: 0, secondViewNum: 1)),
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


