//
//  QuoteCollectionVC.swift
//  Quote-Generator-No-Storyboard
//
//  Created by Tim Ng on 11/6/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

let cellId = "quoteCell"

class QuoteCollectionVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 1. Add title
        navigationItem.title = "Quote Creator!"
        
        // 2. Set background collection view background color
        collectionView.backgroundColor = UIColor.white
        
        // 3. Register Cell to Collection View
        collectionView.register(QuoteCell.self, forCellWithReuseIdentifier: cellId)
        
        // 4. Collection View Cells Vertical Bounce
        collectionView.alwaysBounceVertical = true
    }
    
    
    // 4. Collection View Delegate Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let quoteCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return quoteCell
    }
    
    // 5. Collection View Flow Layout Delegate Methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = CGSize(width: view.frame.width, height: 50)
        return cellSize
    }
    

}

class QuoteCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Little things make big things happen!"
        label.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.medium)
        // SUPER IMPORTANT: Disable Autoresizing Mask
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(8)-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":nameLabel]))
        
        
        
    }
    
    
    
}

