//
//  Profiledata.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 7/8/22.
//

import Foundation

public enum UserPostType {
    case photo,video
}
public enum Gender {
    case male, female, other
}

struct UserCounts {
    let followers: Int
    let following: Int
    let numberOfPosts: Int
}
struct User {
    let username: String
    let bio: String
    let name: (first:String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCounts
    let joinedDate: Date
}

struct PostLike {
    let username: String
    let postIdentifier: String
}

struct CommentLike {
    let username: String
    let CommentIdentifier: String
}

struct PostComments{
    let identifier: String
    let username: String
    let text: String
    let commentedDate: String
    let like: [CommentLike]
}

public struct UserPost{
    let identifier: String
    let postType: UserPostType
    let thumbNailImage: URL
    let postURL: URL
    let caption: String?
    let likeCount: [PostLike]
    let comments: [PostComments]
    let createdDate: Date
    let taggedUsers: [User]
}


