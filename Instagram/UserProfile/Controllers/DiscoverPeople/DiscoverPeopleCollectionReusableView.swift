//
//  DiscoverPeopleCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/20/22.
//

import UIKit

class DiscoverPeopleCollectionReusableView: UICollectionReusableView {

    @IBOutlet weak var discoverCollectionView: UICollectionView!
    
    static var identifier = "DiscoverPeopleCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "DiscoverPeopleCollectionReusableView", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        discoverCollectionView.delegate = self
        discoverCollectionView.dataSource = self
        
        discoverCollectionView.register(DiscoverPeopleCollectionViewCell.nib(), forCellWithReuseIdentifier: DiscoverPeopleCollectionViewCell.identifier)
    }
    @IBAction func seeAllButtonPressed(_ sender: Any) {
        
    }
    
}


extension DiscoverPeopleCollectionReusableView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = discoverCollectionView.dequeueReusableCell(withReuseIdentifier: DiscoverPeopleCollectionViewCell.identifier, for: indexPath) as! DiscoverPeopleCollectionViewCell
        return cell
    }
    
    
}
