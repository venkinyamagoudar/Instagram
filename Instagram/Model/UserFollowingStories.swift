//
//  UserFollowingStories.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/29/22.
//

import Foundation

struct UserFollowingStories: Codable{
    var username: String
    var userId: Int
    var userStoryList: [UserStoryList]
    var storyList: [UserStoryFollowingDetails]
}

struct UserStoryFollowingDetails: Codable{
    var followingUserUsername: String
    var followingUserID: Int
    var followingUserProfile: URL
    var FollowingUserStories:[StoryDetails]
}

struct StoryDetails: Codable{
    var isstoryMediaVideo:Bool
    var storyURL:URL
    var storyID:Int
    var didUserLikeTheStory: Bool
    var didUserSeeTheStoryFoRFirstTime: Bool
}

struct UserStoryList: Codable{
    var isstoryMediaVideo: Bool
    var storyURL: URL
    var storyID: Int
    var didUserLikeTheStory: Bool
    var didUserSeeTheStoryFoRFirstTime: Bool
}


