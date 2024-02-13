//
//  OtherProfileStoryCollectionReusableView.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/14/22.
//

import UIKit

class OtherProfileStoryCollectionReusableView: UICollectionReusableView {

    static var identifier = "OtherProfileStoryCollectionReusableView"
    
    static func nib() -> UINib {
        return UINib(nibName: "OtherProfileStoryCollectionReusableView", bundle: nil)
    }
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        
        storyCollectionView.register(OtherStoryCollectionViewCell.nib(), forCellWithReuseIdentifier: OtherStoryCollectionViewCell.identifier)
        
    }
    
}


extension OtherProfileStoryCollectionReusableView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OtherStoryCollectionViewCell.identifier, for: indexPath) as! OtherStoryCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Go to Story collection")
    }
}
