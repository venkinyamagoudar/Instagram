//
//  StoryTableViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

protocol StoryTableViewCellDelegate: AnyObject {
    func didTapStoryCellTable(with model: [UserStoryFollowingDetails], indexpath: IndexPath)
}

class StoryTableViewModel{
 
    //story data
    public var userStoryData: UserFollowingStories!
    var userStoryDetails = [UserStoryList]()
    var followingUserDetails = [UserStoryFollowingDetails]()
    
    public weak var storyDelegate: StoryTableViewCellDelegate?
    
    func configure(model: UserFollowingStories){
        self.userStoryData = model
        self.userStoryDetails = model.userStoryList
        self.followingUserDetails = model.storyList
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
