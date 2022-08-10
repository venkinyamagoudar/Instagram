//
//  StoryDetailViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

class StoryDetailViewModel{
    var followingUserDetails = [UserStoryFollowingDetails]()
    
    var image: UIImage!
    var indexPath:IndexPath!
    
    func configure(model: [UserStoryFollowingDetails], indexpath: IndexPath){
        self.followingUserDetails = model
        self.indexPath = indexpath
        image = getImageData(imageURL: followingUserDetails[indexPath.row].FollowingUserStories[0].storyURL)
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
