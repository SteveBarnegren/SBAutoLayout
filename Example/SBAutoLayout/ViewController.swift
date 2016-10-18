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
        
        items.append(
            ExampleItem(layoutActions: [
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperViewEdges)
                ])
        )
        
        items.append(
            ExampleItem(layoutActions: [
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewTop(margin: 40)),
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewBottom(margin: 40)),
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewLeft(margin: 20)),
                            AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewRight(margin: 20))
                ])
        )
        
        items.append(
            ExampleItem(layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsTopStrip(height: 50)),
                ])
        )
        
        items.append(
            ExampleItem(layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsBottomStrip(height: 150)),
                ])
        )
        
        items.append(
            ExampleItem(layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsLeftStrip(width: 15)),
                ])
        )
        
        items.append(
            ExampleItem(layoutActions: [
                AutoLayoutAction(viewNumber: 0, layoutFunction: .pinToSuperviewAsRightStrip(width: 60)),
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


