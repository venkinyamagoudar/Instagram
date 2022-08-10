//
//  StoryCollectionViewModel.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/9/22.
//

import Foundation
import UIKit

protocol StoryTappableDelegate : AnyObject {
    func didTapStoryCell(with model: [UserStoryFollowingDetails], indexpath: IndexPath)
}

class StoryCollectionViewModel{
    
    var followingUserDetails = [UserStoryFollowingDetails]()
    
    var storyImage = UIImage(named: "message")
    var indexpath : IndexPath!
    
    public weak var storyImageTapDelegate: StoryTappableDelegate?
    
    func configure(model: [UserStoryFollowingDetails]){
        self.followingUserDetails = model
    }
    
    func selecetedIndexpath(indexpath: IndexPath){
        self.indexpath = indexpath
    }

}
