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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.pinToSuperviewEdges()
        collectionView.backgroundColor = UIColor.orange
        collectionView.register(ExampleCell.self, forCellWithReuseIdentifier: String(describing: ExampleCell.self) )
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        
        // Create items
        self.items = makeItems()
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
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier = String(describing: ExampleCell.self)
        
        let cell: ExampleCell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ExampleCell
        cell.configureWithItem(item: items[indexPath.row])
        return cell
        
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

extension ViewController: UICollectionViewDelegate {
    
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        <#code#>
    }
 */
}


