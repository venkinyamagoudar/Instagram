//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/27/22.
//

import UIKit

protocol StoryTableViewCellDelegate: AnyObject {
    func didTapStoryCellTable(with image: UIImage)
}

class StoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, StoryTappableDelegate {
    
    
  
//    static var identifier = "StoryTableViewCell"
//    
//    static func nib() -> UINib {
//        return UINib(nibName: "StoryTableViewCell", bundle: nil)
//    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    public weak var storyDelegate: StoryTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib(nibName: "StoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoryCollectionViewCell")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.storyImageTapDelegate = self
        return cell
    }
    
    // imageview tapp
    func didTapStoryCell(with image: UIImage) {
        print("image tapped")
        storyDelegate?.didTapStoryCellTable(with: image)
    }
    
    
}
