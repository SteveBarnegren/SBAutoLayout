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
            ExampleItem(textPosition: .center, layoutActions: [
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperViewEdges)
                ])
        )
        
        // Pin to super view edges separately with margins (using left / right)
        items.append(
            ExampleItem(textPosition: .centerInView(viewNumber: 0), layoutActions: [
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewTop(margin: 20)),
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewBottom(margin: 20)),
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewLeft(margin: 20)),
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewRight(margin: 20))
                ])
        )
        
        // Pin to super view edges separately with margins (using leading / trailing)
        items.append(
            ExampleItem(textPosition: .centerInView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewTop(margin: 60)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewBottom(margin: 40)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewLeading(margin: 15)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewTrailing(margin: 15))
                ])
        )
        
        // Pin as top strip
        items.append(
            ExampleItem(textPosition: .belowView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsTopStrip(height: 50)),
                ])
        )
        
        // Pin as bottom strip
        items.append(
            ExampleItem(textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsBottomStrip(height: 150)),
                ])
        )
        
        // Pin as left strip
        items.append(
            ExampleItem(textPosition: .rightOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsLeftStrip(width: 15)),
                ])
        )
        
        // Pin as right strip
        items.append(
            ExampleItem(textPosition: .leftOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsRightStrip(width: 60)),
                ])
        )
        
        // Pin as leading strip
        items.append(
            ExampleItem(textPosition: .rightOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsLeadingStrip(width: 40)),
                ])
        )
        
        // Pin as trailing strip
        items.append(
            ExampleItem(textPosition: .leftOfView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsTrailingStrip(width: 20)),
                ])
        )

        
        // Pin to center with width / height
        items.append(
            ExampleItem(textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenter),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinHeight(height: 80)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinWidth(width: 250)),
                ])
        )
        
        // Pin to center with width / height and Y offset
        items.append(
            ExampleItem(textPosition: .belowView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenterX(offset: nil)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenterY(offset: -100)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinHeight(height: 60)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinWidth(width: 100)),
                ])
        )
        
        // Pin to center with width / height and Y and X offset
        items.append(
            ExampleItem(textPosition: .belowView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenterX(offset: -100)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenterY(offset: -100)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinHeight(height: 50)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinWidth(width: 50)),
                ])
        )
        
        // Pin to center with width / height and Y and X offset
        items.append(
            ExampleItem(textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenterX(offset: 70)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenterY(offset: 70)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinHeight(height: 100)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinWidth(width: 100)),
                ])
        )
        
        // Pin to center with width / aspect ratio
        items.append(
            ExampleItem(textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenter),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinHeight(height: 100)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinAspectRatio(width: 1, height: 1))
                ])
        )
        
        // Pin to center with width / aspect ratio (wider)
        items.append(
            ExampleItem(textPosition: .aboveView(viewNumber: 0), layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewCenter),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinHeight(height: 100)),
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinAspectRatio(width: 3, height: 1))
                ])
        )

        return items
    }
    
    func redraw() {
        
        print("**************************")
        
        var offset = collectionView.contentOffset.x / collectionView.bounds.size.width
        offset = min(offset, CGFloat(items.count-1))
        offset = max(0, offset)
        
        let beforeIndex = Int(offset)
        let nextIndex = beforeIndex+1
        print("Before Index: \(beforeIndex)")
        print("Next Index: \(nextIndex)")
        
        var beforeRect = rectForView(viewNumber: 0, cellIndex: beforeIndex)
        var nextRect = rectForView(viewNumber: 0, cellIndex: nextIndex)
        
        if beforeRect == nil {
            beforeRect = nextRect ?? .zero
        }
        
        if nextRect == nil {
            nextRect = beforeRect ?? .zero
        }
        
        print("Before rect: \(beforeRect!)")
        print("Next rect: \(nextRect!)")
        
        let interpolationPct = offset - CGFloat(beforeIndex)
        print("Interpolation pct: \(interpolationPct)")
        let rect = interpolateRects(startRect: beforeRect!,
                                    endRect: nextRect!,
                                    t: interpolationPct)
        
        let rectangle = RectangleDrawingView.Rectangle(rect: rect,
                                                       color: UIColor(red: 0.333, green: 0.675, blue: 0.937, alpha: 1))
        print("Rect: \(rectangle.rect)")
        rectangleDrawingView.rectangles = [rectangle]
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


