//
//  UserSearch.swift
//  Instagram
//
//  Created by Venkatesh Nyamagoudar on 8/1/22.
//

import Foundation


struct UserSearch : Codable{
    var data: [UserSearchDetails]
}

struct UserSearchDetails: Codable {
    var username: String
    var full_name: String
    var is_private: Bool
    var profile_pic_url : URL
}
