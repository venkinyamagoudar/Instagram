//
//  Reels.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/2/22.
//

import Foundation

struct Reels: Codable{
    var reelCreators: [ReelCreator]
}

struct ReelCreator: Codable{
    
    var pk: Int
    var username: String
    var full_name: String
    var is_private: Bool
    var profile_pic_url :URL
    var type: Int
    var width: Int
    var height: Int
    var url: URL
    var didUserLikeReel: Bool
}
