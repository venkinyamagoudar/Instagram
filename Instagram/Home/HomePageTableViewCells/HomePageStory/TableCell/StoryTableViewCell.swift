//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 6/27/22.
//

import UIKit

protocol StoryTableViewCellDelegate: AnyObject {
    func didTapStoryCellTable(with model: [UserStoryFollowingDetails], indexpath: IndexPath)
}

class StoryTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, StoryTappableDelegate {
  
    static var identifier = "StoryTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "StoryTableViewCell", bundle: nil)
    }
    
    //story data
    public var userStoryData: UserFollowingStories!
    var userStoryDetails = [UserStoryList]()
    var followingUserDetails = [UserStoryFollowingDetails]()
    
    @IBOutlet var collectionView: UICollectionView!
    
    public weak var storyDelegate: StoryTableViewCellDelegate?
    
    func configure(model: UserFollowingStories){
        self.userStoryData = model
        self.userStoryDetails = model.userStoryList
        self.followingUserDetails = model.storyList
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(StoryCollectionViewCell.nib(), forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return followingUserDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.configure(model: followingUserDetails)
        cell.userImage.image = getImageData(imageURL: followingUserDetails[indexPath.row].followingUserProfile)
        cell.userProfile.text = followingUserDetails[indexPath.row].followingUserUsername
        cell.selecetedIndexpath(indexpath: indexPath)
        cell.storyImageTapDelegate = self
        return cell
    }
    
    // imageview tapp
    func didTapStoryCell(with model: [UserStoryFollowingDetails], indexpath: IndexPath) {
        print("image tapped")
        storyDelegate?.didTapStoryCellTable(with: model, indexpath: indexpath)
    }
    
    func getImageData(imageURL: URL) -> UIImage?{
        do {
            if let imageData = try? Data(contentsOf: imageURL){
                if let image = UIImage(data: imageData){
                    return image
                }
            }
        }catch{
            print("error in image \(error)")
        }
        return nil
    }
}
