//
//  UserInformation.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/25/22.
//

import Foundation

struct UserInformation : Codable {
    var profile_pic_url: URL
    var profile_pic_url_hd: URL
    var username: String
    var edge_followed_by: FollowersCount
    var edge_follow: FollowingCount
    var full_name: String
    var id: String
    var edge_owner_to_timeline_media: PostCount
    var pronouns: [String]!
    var biography: String!
}

struct FollowersCount: Codable {
    var count: Int
}

struct FollowingCount: Codable {
    var count: Int
}

struct PostCount: Codable {
    var count: Int
}
