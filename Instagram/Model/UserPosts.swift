//
//  UserPosts.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/28/22.
//

import Foundation

struct UserPosts : Codable {
    var userName: String
    var userId: Int
    var numberOfPosts :Int
    var postDetails: [PostDetails]
}

struct PostDetails :Codable {
    var postSerialNumber: Int
    var postDataType: String
    var postDisplayURL: URL
    var media_caption: String
}
