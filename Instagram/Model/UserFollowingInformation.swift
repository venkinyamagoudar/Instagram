//
//  UserFollowingList.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/28/22.
//

import Foundation

struct UserFollowingInformation : Codable{
    var username: String
    var userID: Int
    var followingCount: Int
    var followingDetails: [FollowingUserDetails]
}

struct FollowingUserDetails: Codable{
    var followingName: String
    var followingUsername:String
    var followingProfileHd: URL
    var isUserFollowing: String
}
