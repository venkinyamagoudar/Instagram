//
//  FollowersPosts.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/28/22.
//

import Foundation

struct UserFollowingPosts : Codable{
    var username: String
    var userId: Int
    var mediaInPostSection: [UserFollowingPostsDetails]
}

struct UserFollowingPostsDetails: Codable {
    var followingUserUsername: String
    var followingUserFullName: String
    var followingUserPostType: String
    var followingUserProfilePicture: URL
    var followingUserPostURL: URL
}
