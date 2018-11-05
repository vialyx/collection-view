//
//  ViewController.swift
//  CollectionView
//
//  Created by Maksim Vialykh on 05/11/2018.
//  Copyright © 2018 Vialyx. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    // Create constant data source
    private let dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Attach to table view
        dataSource.attach(to: collectionView)
        // Setup data set
        dataSource.items = ["The", "Best", "Solution", "for", "Data Source", "is", "Separated", "Class"]
    }


}

// TODO: - Move to separated file TextCollectionViewCell.swift
final class TextCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    class var identifier: String { return "TextCollectionViewCell" }
    
}

/*
 The Data Source Pattern is provide element to view depends on data that it's owns
 */

// TODO: - Move to separated file DataSource.swift
final class DataSource: NSObject {
    
    var items: [String] = []
    
    func attach(to view: UICollectionView) {
        // Setup itself as table data source (Implementation in separated extension)
        view.dataSource = self
    }
    
}

// MARK: - UICollectionViewDataSource
extension DataSource: UICollectionViewDataSource {
    
    // Return elements count that must be displayed in table
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // Instantiate or reused (depend on position and cell type in table view), configure cell element and return it for displaying on table
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCollectionViewCell.identifier, for: indexPath) as! TextCollectionViewCell
        cell.title.text = item
        return cell
    }
    
}

