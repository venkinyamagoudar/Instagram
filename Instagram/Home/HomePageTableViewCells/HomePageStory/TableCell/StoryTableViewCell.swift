//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/27/22.
//

import UIKit



class StoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, StoryTappableDelegate {
  
    static var identifier = "StoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StoryTableViewCell", bundle: nil)
    }
    
    var storyTableViewModel =  StoryTableViewModel()
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
//    func configure(model: UserFollowingStories){
//        storyTableViewModel.configure(model: model)
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storyTableViewModel.followingUserDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.configure(model: storyTableViewModel.followingUserDetails)
        cell.userImage.image = storyTableViewModel.getImageData(imageURL: storyTableViewModel.followingUserDetails[indexPath.row].followingUserProfile)
        cell.userProfile.text = storyTableViewModel.followingUserDetails[indexPath.row].followingUserUsername
        cell.storyCollectionViewModel.selecetedIndexpath(indexpath: indexPath)
        cell.storyCollectionViewModel.storyImageTapDelegate = self
        return cell
    }
    
    // imageview tapp
    func didTapStoryCell(with model: [UserStoryFollowingDetails], indexpath: IndexPath) {
        storyTableViewModel.storyDelegate?.didTapStoryCellTable(with: model, indexpath: indexpath)
    }
    
    
}
