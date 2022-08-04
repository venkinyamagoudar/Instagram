//
//  FollowersInformation.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/28/22.
//

import Foundation

struct UserFollowersInformation: Codable {
    var username:String
    var userID: Int
    var followersCount: Int
    var followerDetails:[FollowerUserDetails]
}

struct FollowerUserDetails :Codable {
    var followerName: String
    var followerUsername: String
    var followerProfileHd: URL
    var isUserFollowing: String
}
